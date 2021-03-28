#!/bin/bash

VERSION=2020-12-R1

LINK_LIBRERIA=https://github.com/greatscottgadgets/libbtbb/archive/refs/tags/$VERSION.tar.gz
LINK_UBERTOOTH=https://github.com/greatscottgadgets/ubertooth/releases/download/$VERSION/ubertooth-$VERSION.tar.xz


LIBRERIA=libbtbb-$VERSION
UBERTOOTH=ubertooth-$VERSION
## Instalacion de las librerias


SUCESS=1
while [ $SUCESS -eq 1 ]
do
  echo "Select Instalation Directory, left EMPTY for use the actual directory"
  read path

  if [ -z $path ] 

  then
      path=$( pwd )
  fi

  cd $path
  SUCESS=$?

done

sudo apt-get -y install cmake libusb-1.0-0-dev make gcc g++ libbluetooth-dev \
pkg-config libpcap-dev python-numpy python-pyside python-qt4 -y


wget $LINK_LIBRERIA -O $LIBRERIA.tar.gz
tar xf $LIBRERIA.tar.gz
cd $LIBRERIA
mkdir build
cd build
cmake ..
make
sudo make install
sudo ldconfig

cd $path

wget $LINK_UBERTOOTH -O $UBERTOOTH.tar.xz
tar xf $UBERTOOTH.tar.xz
cd $UBERTOOTH/host
mkdir build
cd build 
cmake ..
make
sudo make install
sudo ldconfig

cd $path