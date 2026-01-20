#!/bin/bash

<<disclamer
this is just for educational purpose 
disclamer

#this is function defination 
function loyal(){

read -p "$1ne mud ke kise dekha : " bandi 

if [ $bandi == "daya" ];
then 
	echo "$1 is loyal "
else 
	echo "$1 is not loyal "
fi
}


#this is function calling 


loyal "bhanu"
