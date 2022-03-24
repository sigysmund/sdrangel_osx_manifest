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

### Build other
```
brew install speexdsp libsamplerate codec2
```

## Build Hardware dependencies which you own
### RTL-SDR
Build like in WiKi 
### HackRF
Build like in WiKi 
### LimeSDR
Build like in WiKi 

## To build or develop
```
Open IDE(QtCreator - Used in this case) and open SDRangel source dir
Hopefully CMake will set-up the project, otherwise some dependecies or paths are missing or being not properly prefixed.
```