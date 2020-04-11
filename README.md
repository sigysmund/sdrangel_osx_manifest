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
repo start osx
```
## Install libraries, if not available:

### Boost
```
brew install boost
```

### FFTW3
```
curl -OL http://fftw.org/fftw-3.3.8.tar.gz
tar -xf fftw-3.3.8.tar.gz && cd fftw-3.3.8
./configure \
  --enable-threads \
  --enable-float \
  --enable-sse \
  --enable-sse2
make -j16 && sudo make install
```

### OpenCV
```
brew install opencv
```

## Build Non-hardware dependencies
CM265cc
MBElib
SerialDV
DSDcc
Codec2/FreeDV

## Build Hardware dependencies which you own
RTL-SDR

HackRF

LimeSDR

** Open IDE(QtCreator) and try to build SDRangel...