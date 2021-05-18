#!/bin/sh 

oc process -p APPLICATION_NAME=angular-openshift \
	 -p NAMESPACE="angular-jenkins" \
	 -p GIT_REPO="https://github.com/sholly/angular-openshift.git" \
	 -f buildconfig.yml |oc apply -f -
