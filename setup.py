#!/usr/bin/env python

import os
from glob import glob
try:
    from setuptools import setup, find_packages
except ImportError:
    from distutils.core import setup, find_packages

__author__  = '@c3rb3ru5d3d53c'
__version__ = '1.1.0'

this_directory = os.path.abspath(os.path.dirname(__file__))
with open(os.path.join(this_directory, 'README.md'), encoding='utf-8') as f:
    long_description = f.read()

setup(
    name='mwcfg',
    version=__version__,
    maintainer=__author__,
    description='A Modular Malware Configuration Extraction Tool using MalDuck',
    long_description=long_description,
    long_description_content_type='text/markdown',
    install_requires=open('requirements.txt', 'r').read().splitlines(),
    scripts=['mwcfg', 'mwcfg-server'],
    packages=find_packages(),
    include_package_data=True,
    classifiers=[
        "Programming Language :: Python",
        "Operating System :: OS Independent",
    ],
)
