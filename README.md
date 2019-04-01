# SDRangel MacOS Build Manifest

Install repo command, needs elevated sheel(sudo su):
```
mkdir -p /usr/local/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo
chmod +x /usr/local/bin/repo
```

Initialize source directory structure with:
```
mkdir -p ~/Build/SDRangel && cd ~/Build/SDRangel
repo init -u https://github.com/sigysmund/sdrangel_osx_manifest.git
```

Syncronize projects repositories:
```
repo sync 
```

Build process in given directory structure will be implemented, stay tuned!
