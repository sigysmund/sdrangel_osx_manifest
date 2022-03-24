#!/usr/bin/env bash

# Put in SDRangel/ inited repo dir and execute it

set -e

SCRIPT_PATH=$(pwd)
SCRIPT_PATH="${SCRIPT_PATH}/$(dirname $0)"
NPROC=$(sysctl -n hw.ncpu)
INSTALL_PREFIX="/opt/install"

# Prerequisities
cd lib

# APT
cd aptdec; mkdir -p build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/aptdec" ..
make -j $NPROC install
cd ../..

# CM256cc
cd cm256cc; mkdir -p build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/cm256cc"  ..
make -j $NPROC install
cd ../..

# LibDAB
cd dab-cmdline/library; mkdir -p build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/libdab"  ..
make -j $NPROC install
cd ../../..

# MBElib
cd mbelib; mkdir -p build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/mbelib"  ..
make -j $NPROC install
cd ../..

# SerialDV
cd serialDV; mkdir -p build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/serialdv"  ..
make -j $NPROC install
cd ../..

# DSDcc
cd dsdcc; mkdir -p build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/dsdcc" \
    -DUSE_MBELIB=ON \
    -DLIBMBE_INCLUDE_DIR=${INSTALL_PREFIX}/mbelib/include \
    -DLIBMBE_LIBRARY=${INSTALL_PREFIX}/mbelib/lib/libmbe.dylib \
    -DLIBSERIALDV_INCLUDE_DIR=${INSTALL_PREFIX}/serialdv/include/serialdv \
    -DLIBSERIALDV_LIBRARY=${INSTALL_PREFIX}/serialdv/lib/libserialdv.dylib ..
make -j $NPROC install
cd ../..

# Codec2/FreeDV
#brew install speexdsp libsamplerate codec2
#cd codec2; mkdir -p build; cd build
#cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/codec2"  ..
#make -j $NPROC install
#cd ../..

# SGP4
cd sgp4; mkdir -p build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/sgp4"  ..
make -j $NPROC install
cd ../..

# LibSigMF
cd libsigmf; mkdir -p build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/libsigmf"  ..
make -j $NPROC install
cd ../..

cd ../hardware

# Airspy
cd libairspy; mkdir -p build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/libairspy"  ..
make -j $NPROC install
cd ../..

# SDRplay RSP1
cd libmirisdr; mkdir -p build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/libmirisdr"  ..
make -j $NPROC install
cd ../..

# RTL-SDR
cd librtlsdr; mkdir -p build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/librtlsdr" \
    -DDETACH_KERNEL_DRIVER=ON ..
make -j $NPROC install
cd ../..

# Pluto SDR
brew install libtecla pandoc
cd libiio; mkdir -p build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/libiio" \
    -DPANDOC_EXECUTABLE=/usr/local/bin/pandoc \
    -DINSTALL_UDEV_RULE=OFF ..
make -j $NPROC install
cd ../..

# BladeRF all versions
cd libbladeRF/host; mkdir -p build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/libbladeRF"  ..
make -j $NPROC install
cd ../../..

# HackRF
cd libhackrf/host; mkdir -p build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/libhackrf" \
    -DINSTALL_UDEV_RULES=OFF ..
make -j $NPROC install
cd ../../..

# LimeSDR
cd LimeSuite; mkdir -p build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/LimeSuite"  ..
make -j $NPROC install
cd ../..

# AirspyHF
cd libairspyhf; mkdir -p build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/libairspyhf" ..
make -j $NPROC install
cd ../..

# Perseus
#cd libperseus; mkdir -p build; cd build
#cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/libperseus"  ..
#make -j $NPROC # Build ENV on OSX is faulty
#make install
#cd ../..

# USRP
pip3 install mako docutils
cd usrp/host; mkdir -p build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/uhd" \
    -DPYTHON_EXECUTABLE=/usr/local/bin/python3 \
    -DRUNTIME_PYTHON_EXECUTABLE=/usr/local/bin/python3 ..
make -j $NPROC
make install
"${INSTALL_PREFIX}/uhd/lib/uhd/utils/uhd_images_downloader.py"
### The following aren't required if installed to /
# echo ${INSTALL_PREFIX}/uhd/lib | sudo dd of=/etc/ld.dylib.conf.d/uhd.conf
# ldconfig
# export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:${INSTALL_PREFIX}/uhd/lib/pkgconfig
### Enable USB access from user accounts
cd ../../..

# XTRX
#pip3 install Cheetah3
#cd xtrx-images
#git submodule init
#git submodule update
#cd sources
#mkdir -p build; cd build
#cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/xtrx-images" \
#    -DENABLE_SOAPY=NO \
#    -DFORCE_ARCH=x86_64 \
#    -DLIBUSB_1_INCLUDE_DIRS=/usr/local/include \
#    -DLIBUSB_1_LIBRARIES=/usr/local/lib/libusb.dylib \
#    -DINSTALL_UDEV_RULES=OFF ..
#make -j $NPROC
#make install
#cd ../../..

# Soapy SDR
cd SoapySDR; mkdir -p build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/SoapySDR"  ..
make -j $NPROC install
cd ../..

# Soapy: RTL-SDR
cd SoapyRTLSDR; mkdir -p build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/SoapySDR" \
    -DRTLSDR_INCLUDE_DIR=${INSTALL_PREFIX}/librtlsdr/include \
    -DRTLSDR_LIBRARY=${INSTALL_PREFIX}/librtlsdr/lib/librtlsdr.dylib \
    -DSOAPY_SDR_INCLUDE_DIR=${INSTALL_PREFIX}/SoapySDR/include \
    -DSOAPY_SDR_LIBRARY=${INSTALL_PREFIX}/SoapySDR/lib/libSoapySDR.dylib ..
make -j $NPROC install
cd ../..

# Soapy: HackRF
cd SoapyHackRF; mkdir -p build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/SoapySDR" \
    -DLIBHACKRF_INCLUDE_DIR=${INSTALL_PREFIX}/libhackrf/include/libhackrf \
    -DLIBHACKRF_LIBRARY=${INSTALL_PREFIX}/libhackrf/lib/libhackrf.dylib \
    -DSOAPY_SDR_INCLUDE_DIR=${INSTALL_PREFIX}/SoapySDR/include \
    -DSOAPY_SDR_LIBRARY=${INSTALL_PREFIX}/SoapySDR/lib/libSoapySDR.dylib ..
make -j $NPROC install
cd ../..

# LimeSDR
cd LimeSuite/build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/LimeSuite" \
    -DCMAKE_PREFIX_PATH=${INSTALL_PREFIX}/SoapySDR ..
make -j $NPROC install
cp ${INSTALL_PREFIX}/LimeSuite/lib/SoapySDR/modules0.7/libLMS7Support.so \
    ${INSTALL_PREFIX}/SoapySDR/lib/SoapySDR/modules0.7/libLMS7Support.dylib
cd ../..

# Soapy Remote
cd SoapyRemote; mkdir -p build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}/SoapySDR" \
    -DSOAPY_SDR_INCLUDE_DIR=${INSTALL_PREFIX}/SoapySDR/include \
    -DSOAPY_SDR_LIBRARY=${INSTALL_PREFIX}/SoapySDR/lib/libSoapySDR.dylib ..
make -j $NPROC install
cd ../..

# Build SDRangel
exit 0
