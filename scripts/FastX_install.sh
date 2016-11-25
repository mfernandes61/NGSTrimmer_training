#!/bin/bash
# set -e
# Fastx-Toolkit Installation:

# Install libgtextutils
 wget http://cancan.cshl.edu/labmembers/gordon/files/libgtextutils-0.6.tar.bz2
 tar -xjf libgtextutils-0.6.tar.bz2
 cd libgtextutils-0.6
 ./configure
 make
 sudo make install
 cd ..
 
 # Install fastx-toolkit
 wget http://cancan.cshl.edu/labmembers/gordon/files/fastx_toolkit-0.0.12.tar.bz2 
 tar -xjf fastx_toolkit-0.0.12.tar.bz2 
 cd fastx_toolkit-0.0.12
 ./configure
 make
 sudo make install
 cd ..
 
# rm *.tar.bz
# update shared library cache
sudo ldconfig
