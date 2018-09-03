#!/bin/bash

# Determine MY_HOME
MY_HOME=$(dirname $0)
pushd "$MY_HOME" > /dev/null
MY_HOME=$(pwd)
popd > /dev/null


