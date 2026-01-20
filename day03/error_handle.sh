#!/bin/bash

create_directory(){
	mkdir demo 
}

if ! create_directory; then 
	echo "the code is terminated beacuse of directory already exists"
	exit 1
fi



echo "this is not work because  the code  is interrepted "


