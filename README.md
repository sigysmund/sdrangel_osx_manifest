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
brew install fftw
```

### OpenCV
```
brew install opencv
```

## Build Non-hardware dependencies
### CM265cc
Build like in WiKi
### MBElib
Build like in WiKi
### SerialDV
Build like in WiKi
### DSDcc
Build like in WiKi 
### Codec2/FreeDV
```
brew install speexdsp libsamplerate codec2
```

## Build Hardware dependencies which you own
RTL-SDR
Build like in WiKi 
HackRF
Build like in WiKi 
LimeSDR
Build like in WiKi 
** Open IDE(QtCreator) and try to build SDRangel...