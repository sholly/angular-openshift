#!/bin/sh 

oc process -p NAME=angular-openshift \
	 -p NAMESPACE="angular-jenkins" \
	 -f application-template.yml |oc apply -f -
