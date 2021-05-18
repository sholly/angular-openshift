#!/bin/sh 

oc process -p APPLICATION_NAME=angular-openshift \
	 -p NAMESPACE="angular-openshift" -f buildconfig.yml |oc apply -f -
