# Malware Configuration Extractor

[![build](https://travis-ci.org/c3rb3ru5d3d53c/mwcfg.svg?branch=master)](https://travis-ci.org/c3rb3ru5d3d53c/mwcfg)
[![license](https://img.shields.io/github/license/c3rb3ru5d3d53c/mwcfg)](https://github.com/c3rb3ru5d3d53c/mwcfg/blob/master/LICENSE)
[![pypi-version](https://pypip.in/v/mwcfg/badge.png)](https://pypi.org/project/mwcfg/)
[![pypi-downloads](https://pypip.in/d/mwcfg/badge.png)](https://pypi.org/project/mwcfg/)
[![pypi-wheel](https://pypip.in/wheel/mwcfg/badge.svg)](https://pypi.org/project/mwcfg/)
[![issues](https://img.shields.io/github/issues/c3rb3ru5d3d53c/mwcfg)](https://github.com/c3rb3ru5d3d53c/mwcfg/issues)
[![stars](https://img.shields.io/github/stars/c3rb3ru5d3d53c/mwcfg)](https://github.com/c3rb3ru5d3d53c/mwcfg/stargazers)

<p align="center">
  <img src="https://github.com/c3rb3ru5d3d53c/mwcfg/raw/master/docs/img/logo.png" alt="logo" width="25%">
</p>
<p align="center">
  A Malware Configuration Extraction Tool and Modules for MalDuck
</p>

This project is FREE as in FREE :beer:, use it commercially, privately or however you see fit.

The easiest way to use this project is to visit [`mwcfg.info`](https://mwcfg.info), and start extracting malware config right away!

If you like this project and wish to donate :moneybag: to support the fight against malware...

Buy me a :tea:, as I don't drink :beer:, by sending me some ₿ to `16oXesi7uv3jdPZxxwarHSD2f3cNMpaih9`

**Dependancies**
```bash
sudo apt install gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt install mono-devel
```

**Installation:**
```bash
sudo apt install -y python-virtualenv python-is-python3 git-lfs
git clone --recursive https://github.com/c3rb3ru5d3d53c/mwcfg.git
cd mwcfg/
virtualenv venv/
source venv/bin/activate
./setup.py install
git lfs --include tests/azorult.zip
unzip -P infected tests/azorult.zip tests/
mwcfg --input tests/azorult/ --modules modules/ --threads 4 --debug
mwcfg --input tests/azorult/ --list-modules
```

**Installation with PyPi:**
```bash
sudo apt install -y python-virtualenv python-is-python3
virtualenv venv/
source venv/bin/activate
pip install mwcfg
git clone https://github.com/c3rb3ru5d3d53c/mwcfg-modules.git modules/
mwcfg --input sample.bin --modules modules/ --debug
```

**Server Installation with Docker:**
```bash
sudo apt install -y docker.io make
sudo usermod -a -G docker $USER
make mwcfg-server        # Build Server
make mwcfg-server-start  # Start the Server
make mwcfg-server-status # Check Running Status
make mwcfg-server-logs   # Tail Logs
make mwcfg-server-stop   # Stop Server
make mwcfg-server-clean  # Delete Server
```

Once completed, navigate to https://127.0.0.1

You can alternatively upload samples and get results by doing:
```bash
curl --silent --insecure -X POST --upload-file sample.bin https://127.0.0.1
```

**mwcfg Usage:**
```text
usage: mwcfg v1.0.0 [-h] [--version] [-i INPUT] -m MODULES [--list-modules] [-d] [-p] [-t THREADS] [-r] [-l LOG]

A Modular Malware Configuration Extraction Utility for MalDuck

optional arguments:
  -h, --help            show this help message and exit
  --version             show program's version number and exit
  -i INPUT, --input INPUT
                        Input File or Directory
  -m MODULES, --modules MODULES
                        Modules
  --list-modules
  -d, --debug           Debug
  -p, --pretty          Pretty Print Configs
  -t THREADS, --threads THREADS
                        Threads
  -r, --recursive       Recursive
  -l LOG, --log LOG     Log to File

Author: c3rb3ru5
```

**mwcfg-server Usage:**
```text
usage: mwcfg-server v1.0.0 [-h] [--version] [--host HOST] [-p PORT] -m MODULES [-u UPLOADS] [-d]

A Modular Malware Configuration Extraction Server using MalDuck

optional arguments:
  -h, --help            show this help message and exit
  --version             show program's version number and exit
  --host HOST           Host
  -p PORT, --port PORT
  -m MODULES, --modules MODULES
                        Modules
  -u UPLOADS, --uploads UPLOADS
                        Uploads Directory
  -d, --debug

Author: c3rb3ru5
```

**Karton Framework Installation:**
```bash
sudo apt install -y python-virtualenv python-is-python3 git-lfs
git clone --recursive https://github.com/c3rb3ru5d3d53c/mwcfg.git
cd mwcfg/
virtualenv venv/
source venv/bin/activate
./setup.py install
pip install karton-config-extractor
karton-config-extractor --config-file karton.ini --modules modules/
```

**Contributing Modules:**

Please refer to [`CONTRIBUTING.md`](https://github.com/c3rb3ru5d3d53c/mwcfg/blob/master/CONTRIBUTING.md)

**Additional Resources:**
- [`MWDB`](https://github.com/CERT-Polska/mwdb-core)
- [`MWDB Documentation`](https://mwdb.readthedocs.io/en/latest/)
- [`Karton Framework`](https://github.com/CERT-Polska/karton)
- [`Karton Config Extractor`](https://github.com/CERT-Polska/karton-config-extractor)
- [`MalDuck`](https://github.com/CERT-Polska/malduck)
- [`MalDuck Documentation`](https://malduck.readthedocs.io/en/latest/)
