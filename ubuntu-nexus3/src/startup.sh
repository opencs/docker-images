#!/bin/bash

# Determine my_home
MY_HOME=$(dirname $0)
pushd "$MY_HOME"
MY_HOME=$(pwd)
popd

# Check if it is the first deployment
if ! [ -d /sonatype-work ]; then
	mkdir /sonatype-work
fi
if ! [ -d /sonatype-work/nexus3 ]; then
	echo "Initial deployment!"
	cp -r $MY_HOME/sonatype-work.tpl/* /sonatype-work
	ln -s /sonatype-work $MY_HOME/sonatype-work
fi

cd $MY_HOME/current/bin
./nexus run

