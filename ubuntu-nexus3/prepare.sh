#!/bin/bash

# Variables
NEXUS_URL="https://sonatype-download.global.ssl.fastly.net/repository/repositoryManager/3/nexus-3.13.0-01-unix.tar.gz"
NEXUS_PACKAGE=$(echo "$NEXUS_URL" | sed -e 's/.*\///')
BIN_DIR=bin
BUILD_DIR=build

# Determine my_home
MY_HOME=$(dirname $0)
pushd "$MY_HOME"
MY_HOME=$(pwd)

# Download the nexus file if required
mkdir $BIN_DIR
pushd $BIN_DIR
if ! [ -f $NEXUS_PACKAGE ]; then
	wget "$NEXUS_URL"
fi
if ! sha256sum -c ../nexus3.sha256; then
	echo "$NEXUS_PACKAGE is corrupted."
	exit 1
fi
popd

# Deploy the binaries inside the build dir
mkdir $BUILD_DIR
pushd $BUILD_DIR
tar -xzf ../$BIN_DIR/$NEXUS_PACKAGE
NEXUS_DIR=$(find ./ -type d | grep /system/com/sonatype$ | sed -e 's/\.\///;s/\/.*//')

ln -s $NEXUS_DIR current
mv sonatype-work sonatype-work.tpl
popd

popd

