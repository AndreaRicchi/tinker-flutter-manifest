[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# tinker-flutter-manifest

Manifest used to sync required Yocto layers for building a BSP compatible with Tinker-Board-S and flutter

## Setup

```bash
mkdir tinker-flutter && cd tinker-flutter
repo init -u https://github.com/AndreaRicchi/tinker-flutter-manifest.git -b main
repo sync
ln -s ./.repo/manifests/setup-environment.sh ./setup-environment.sh
./setup-environment.sh
```

## Flutter development

For flutter development please refere to the meta-flutter [development flow](https://github.com/meta-flutter/meta-flutter#recommended-development-flow)