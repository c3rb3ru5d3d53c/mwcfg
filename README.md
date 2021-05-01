# Malware Configuration Extractor

A Malware Configuration Extraction Tool and Modules for MalDuck

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

**CLI Usage:**
```text
usage: mwcfg v1.0.0 [-h] [--version] [-i INPUT] -m MODULES [--list-modules] [-d] [-p] [-t THREADS] [-r] [-l LOG]

A Modular Malware Configuration Extraction Utility using MalDuck

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
