#!/bin/bash

# Determine my_home
MY_HOME=$(dirname $0)
pushd "$MY_HOME"
MY_HOME=$(pwd)
popd

# Check if it is the first deployment
if ! [ -d /sonatype-work ]; then
	echo "Creating the initial data directory..."
	mkdir /sonatype-work
fi
# Populate the initial data if necessary
if ! [ -d /sonatype-work/nexus3 ]; then
	echo "Creating the initial deployment data from the template..."
	cp -r $MY_HOME/sonatype-work.tpl/* /sonatype-work
fi
# Fix the link to the data directory
if ! [ -e $MY_HOME/sonatype-work ]; then
	echo "Create the link to the data directory volume..."
	ln -s /sonatype-work $MY_HOME/sonatype-work
fi

cd $MY_HOME/current/bin
./nexus run

