#!/bin/bash

#Username=$1
#Password=$2
#GCPProjectID=$3

alias ggcl="gcloud auth login $1"
alias ggcp="gcloud config set project $1"
alias ggce=`export PROJECT_ID=$(gcloud info --format='value(config.project)')`

#gcloud config set compute/zone "ZONE"
#export ZONE=$(gcloud config get compute/zone)
#gcloud config set compute/region "REGION"
#export REGION=$(gcloud config get compute/region)

#gcloud config set compute/zone us-east1-c
#gcloud config set compute/region us-east1


