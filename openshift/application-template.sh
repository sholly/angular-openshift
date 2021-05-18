#!/bin/sh 

oc process -p NAME=angular-openshift \
	 -f application-template.yml |oc apply -f -
