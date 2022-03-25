# SDRangel MacOS Build Manifest

## Install repo command, needs elevated sheel(sudo su):
```
mkdir -p /usr/local/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo
chmod +x /usr/local/bin/repo
```

## Initialize source directory structure with:
```
mkdir -p ~/Build/SDRangel && cd ~/Build/SDRangel
repo init -u https://github.com/sigysmund/sdrangel_osx_manifest.git
```

## Syncronize projects repositories:
```
repo sync
repo start --all osx
```
## Install libraries, if not available:

### Boost
```
brew install boost
```

### FFTW3
```
brew install fftw
```

### OpenCV
```
brew install opencv
```

### Install other
```
brew install speexdsp libsamplerate codec2
```

## Build Hardware dependencies and libs
```
bash build.bash
```

## Configure SDRangel
```
cmake -Wno-dev -DDEBUG_OUTPUT=ON -DRX_SAMPLE_24BIT=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_PREFIX_PATH=$HOME/Development/Qt/SDK/5.15.2/clang_64 \
    -DMIRISDR_DIR=/opt/install/libmirisdr \
    -DAIRSPY_DIR=/opt/install/libairspy \
    -DAIRSPYHF_DIR=/opt/install/libairspyhf \
    -DBLADERF_DIR=/opt/install/libbladeRF \
    -DHACKRF_DIR=/opt/install/libhackrf \
    -DRTLSDR_DIR=/opt/install/librtlsdr \
    -DLIMESUITE_DIR=/opt/install/LimeSuite \
    -DIIO_DIR=/opt/install/libiio \
    -DSOAPYSDR_DIR=/opt/install/SoapySDR \
    -DUHD_DIR=/opt/install/uhd \
    -DAPT_DIR=/opt/install/aptdec \
    -DCM256CC_DIR=/opt/install/cm256cc \
    -DDSDCC_DIR=/opt/install/dsdcc \
    -DSERIALDV_DIR=/opt/install/serialdv \
    -DMBE_DIR=/opt/install/mbelib \
    -DSGP4_DIR=/opt/install/sgp4 \
    -DLIBSIGMF_DIR=/opt/install/libsigmf \
    -DDAB_DIR=/opt/install/libdab \
    -DCMAKE_INSTALL_PREFIX=/opt/install/sdrangel ..
```

## Build or develop

```
Open IDE(QtCreator - Used in this case) and open SDRangel source dir
Hopefully CMake will set-up the project, otherwise some dependecies or paths are missing or being not properly prefixed.
```