#!/bin/bash

Username=$1
Password=$2
GCPProjectID=$3

gcloud auth login $Username
gcloud config set project $GCPProjectID

#gcloud config set compute/zone "ZONE"
#export ZONE=$(gcloud config get compute/zone)
#gcloud config set compute/region "REGION"
#export REGION=$(gcloud config get compute/region)

gcloud config set compute/zone us-east1-c
gcloud config set compute/region us-east1

export PROJECT_ID=$(gcloud info --format='value(config.project)')

