.PHONY: mwcfg-server

PWD := $(shell pwd)
USER_ID := $(shell id -u ${USER})
GROUP_ID := $(shell id -g ${USER})
tag=22.04
version=1.1.0

mwcfg-server:
	@if [ -z "`docker images -q mwcfg-server:${version} 2> /dev/null`" ]; then \
		docker build \
			-t mwcfg-server:${version} \
			--build-arg tag=${tag} \
			-f docker/mwcfg-server.docker .; \
	else \
		echo "docker build for mwcfg-server:${version} already exists..."; \
	fi

mwcfg-server-start:
	@if [ -z "`docker ps | grep "mwcfg-server:${version}" | grep -Po '^[a-f0-9]+'`" ]; then \
		mkdir -p uploads/; \
		docker run \
			-d \
			--rm \
			-v ${PWD}/modules/:/mnt/modules/ \
			-v ${PWD}/uploads/:/mnt/uploads/ \
			-v ${PWD}/docker/etc/uwsgi/apps-enabled/:/etc/uwsgi/apps-enabled/ \
			-v ${PWD}/docker/etc/nginx/conf.d/:/etc/nginx/conf.d/ \
			-v ${PWD}/docker/etc/nginx/ssl/:/etc/nginx/ssl/ \
			-p 80:80 \
			-p 443:443 \
			-t mwcfg-server:${version} > /dev/null; \
		echo "mwcfg-server:${version} started"; \
	else \
		echo "mwcfg-server:${version} is already running"; \
	fi

mwcfg-server-stop:
	@ID=`docker ps | grep "mwcfg-server:${version}" | grep -Po '^[a-f0-9]+'`; \
		if [ ! -z "$${ID}" ]; then \
			docker stop $${ID} > /dev/null; \
			echo "mwcfg-server:${version} stopped"; \
		else \
			echo "mwcfg-server:${version} is not running"; \
		fi

mwcfg-server-restart: mwcfg-server-stop mwcfg-server-start

mwcfg-server-status:
	@if [ -z "`docker ps | grep "mwcfg-server:${version}" | grep -Po '^[a-f0-9]+'`" ]; then \
		echo "mwcfg-server:${version} is not running"; \
	else \
		echo "mwcfg-server:${version} is running"; \
	fi

mwcfg-server-clean:
	@docker rmi --force `docker images | grep mwcfg-server | grep ${version} | tr -s ' ' | cut -d ' ' -f 3`

mwcfg-server-logs:
	@docker logs -f `docker ps | grep "mwcfg-server:${version}" | grep -Po '^[a-f0-9]+'`

docker-clean:
	@docker stop $(shell docker ps -a -q) 2>/dev/null || echo > /dev/null
	@docker rm $(shell docker ps -a -q) 2>/dev/null || echo > /dev/null
	@docker rmi $(shell docker images -a -q) 2>/dev/null || echo > /dev/null
