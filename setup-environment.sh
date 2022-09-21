#!/bin/sh

DIR="build"
if [ -d "$DIR" ]; then
	echo "Environment already configured..."
	exit 1
fi

source ./poky/oe-init-build-env

bitbake-layers add-layer \
	../poky/meta \
	../poky/meta-poky \
	../poky/meta-yocto-bsp \
	../meta-openembedded/meta-oe \
	../meta-arm/meta-arm-toolchain \
	../meta-arm/meta-arm \
	../meta-rockchip \
	../meta-clang \
	../meta-flutter

sed -i "s|MACHINE ??= \"qemux86-64\"|MACHINE ??= \"tinker-board-s\"|g" ./conf/local.conf

echo '' >>./conf/local.conf
echo 'MACHINE_EXTRA_RRECOMMENDS += "kernel-modules"' >>./conf/local.conf
echo 'BB_NUMBER_THREADS ?= "4"' >>./conf/local.conf

echo 'INIT_MANAGER = "systemd"' >>./conf/local.conf
echo 'DISTRO_FEATURES:append = " wayland pam"' >>./conf/local.conf

echo '
IMAGE_INSTALL:append = " \
    flutter-engine-runtimedebug \
    flutter-pi-runtimedebug \
    flutter-gallery-runtimedebug \
"
' >>./conf/local.conf

echo 'TOOLCHAIN_HOST_TASK:append = " nativesdk-flutter-sdk"' >>./conf/local.conf
