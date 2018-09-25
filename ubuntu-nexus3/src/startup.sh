#!/bin/bash

# Determine my_home
MY_HOME=$(dirname $0)
pushd "$MY_HOME"
MY_HOME=$(pwd)
popd

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

# Fix the user rights
chown -R nexus:nexus /app
chown -R nexus:nexus /sonatype-work

# Run sonarqube
su -c "$MY_HOME/current/bin/nexus run" nexus

