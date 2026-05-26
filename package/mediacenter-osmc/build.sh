# (c) 2014-2015 Sam Nazarko
# email@samnazarko.co.uk

#!/bin/bash

. ../common.sh

if [ "$1" == "rbp2" ] || [ "$1" == "rbp4" ] || [ "$1" == "vero3" ] || [ "$1" == "vero5" ]
then
pull_source "https://github.com/xbmc/xbmc/archive/22.0a3-Piers.tar.gz" "$(pwd)/src"
API_VERSION="22"
else
pull_source "https://github.com/xbmc/xbmc/archive/master.tar.gz" "$(pwd)/kodi"
API_VERSION="22"
fi
if [ $? != 0 ]; then echo -e "Error fetching Kodi source" && exit 1; fi
# Build in native environment
BUILD_OPTS=$BUILD_OPTION_DEFAULTS
BUILD_OPTS=$(($BUILD_OPTS - $BUILD_OPTION_USE_CCACHE))
if [ "$1" == "rbp2" ] || [ "$1" == "rbp4" ] || [ "$1" == "vero3" ] || [ "$1" == "vero5" ]
then
    BUILD_OPTS=$(($BUILD_OPTS + $BUILD_OPTION_NEEDS_SWAP))
fi
build_in_env "${1}" $(pwd) "mediacenter-osmc" "$BUILD_OPTS"
build_return=$?
if [ $build_return == 99 ]
then
	# Fix Kodi CMake issues where local dependencies are introduced in the toolchain
	rm -rf /usr/local/include/* >/dev/null 2>&1
	rm -rf /usr/local/lib/* >/dev/null 2>&1
	echo -e "Building package Kodi"
	out=$(pwd)/files
	make clean
	mount -t proc proc /proc >/dev/null 2>&1
	update_sources
	handle_dep "autopoint"
	handle_dep "automake"
	handle_dep "bison"
	handle_dep "make"
	handle_dep "curl"
	handle_dep "cvs"
	handle_dep "default-jre-headless"
	handle_dep "gawk"
	handle_dep "gdc"
	handle_dep "gettext"
	handle_dep "gperf"
	handle_dep "liblirc-dev"
	handle_dep "libasound2-dev"
	handle_dep "libbz2-dev"
	handle_dep "libcap-dev"
	handle_dep "libcdio-dev"
	handle_dep "libcurl4-openssl-dev"
	handle_dep "libdbus-1-dev"
	handle_dep "libfontconfig1-dev"
	handle_dep "libfreetype6-dev"
	handle_dep "libfribidi-dev"
	handle_dep "libfstrcmp-dev"
	handle_dep "libgtest-dev"
	handle_dep "libinput-dev"
	handle_dep "libgif-dev"
	handle_dep "libiso9660-dev"
	handle_dep "libjpeg62-turbo-dev"
	handle_dep "liblzo2-dev"
	handle_dep "libmad0-dev"
	handle_dep "libmicrohttpd-dev"
	handle_dep "libmodplug-dev"
	handle_dep "libmariadbd-dev"
	handle_dep "libpcre3-dev"
	handle_dep "libplist-dev"
	handle_dep "libpng-dev"
	handle_dep "libsmbclient-dev"
	handle_dep "libssh-dev"
	handle_dep "libavahi-client-dev"
	handle_dep "libssl-dev" # We need this as well as libcurl4-openssl-dev because openssl libs are only suggestions
	handle_dep "libtinyxml-dev"
	handle_dep "libtinyxml2-dev"
	handle_dep "libtool"
	handle_dep "libudev-dev"
	handle_dep "libvorbis-dev"
	handle_dep "libxml2-dev"
	handle_dep "libxmu-dev"
	handle_dep "libxslt1-dev"
	handle_dep "libxt-dev"
	handle_dep "libyajl-dev"
        handle_dep "libxkbcommon-dev"
	handle_dep "nasm"
	handle_dep "pmount"
	handle_dep "python3-dev"
	handle_dep "python3-pil"
	handle_dep "swig"
	handle_dep "unzip"
	handle_dep "yasm"
	handle_dep "zip"
	handle_dep "zlib1g-dev"
	handle_dep "libtag1-dev"
	handle_dep "libsamplerate0-dev"
	handle_dep "libltdl-dev"
	handle_dep "libgnutls28-dev"
	handle_dep "git"
	handle_dep "uuid-dev"
	handle_dep "libcrossguid-dev"
	handle_dep "cmake"
	handle_dep "rapidjson-dev"
        handle_dep "libgcrypt20-dev"
        handle_dep "libnfs-dev"
        handle_dep "libass-dev"
	handle_dep "libunistring-dev"
	handle_dep "xmlstarlet"
	handle_dep "meson"
	handle_dep "libflatbuffers-dev"
	handle_dep "libspdlog-dev"
	handle_dep "libfmt-dev"
	handle_dep "libudfread-dev"
	handle_dep "libdisplay-info-dev"
	if [ "$1" == "rbp2" ] || [ "$1" == "rbp4" ]
	then
		handle_dep "rbp2-libcec-dev-osmc"
		armv7-libshairplay-dev-osmc
	fi
fi
