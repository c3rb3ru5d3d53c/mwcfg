# Malware Configuration Extractor

[![build](https://travis-ci.org/c3rb3ru5d3d53c/mwcfg.svg?branch=master)](https://travis-ci.org/c3rb3ru5d3d53c/mwcfg)
[![license](https://img.shields.io/github/license/c3rb3ru5d3d53c/mwcfg-modules)](https://github.com/c3rb3ru5d3d53c/mwcfg/blob/master/LICENSE)
[![pypi-version](https://pypip.in/v/mwcfg/badge.png)](https://pypi.org/project/mwcfg/)
[![pypi-downloads](https://pypip.in/d/mwcfg/badge.png)](https://pypi.org/project/mwcfg/)
[![pypi-wheel](https://pypip.in/wheel/mwcfg/badge.svg)](https://pypi.org/project/mwcfg/)
[![issues](https://img.shields.io/github/issues/c3rb3ru5d3d53c/mwcfg-modules)](https://github.com/c3rb3ru5d3d53c/mwcfg/issues)
[![stars](https://img.shields.io/github/stars/c3rb3ru5d3d53c/mwcfg)](https://github.com/c3rb3ru5d3d53c/mwcfg/stargazers)

<p align="center">
  <img src="https://github.com/c3rb3ru5d3d53c/mwcfg/raw/master/docs/img/logo.png" alt="logo" width="25%">
</p>
<p align="center">
  A Malware Configuration Extraction Tool and Modules for MalDuck
</p>

This project is FREE as in FREE :beer:, use it commercially, privately or however you see fit.

If you like this project and wish to donate :moneybag: to support the fight against malware...

Buy me a :tea:, as I don't drink :beer:, by sending me some ₿ to `16oXesi7uv3jdPZxxwarHSD2f3cNMpaih9`

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
