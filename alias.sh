#!/bin/bash

function gal() {
  gcloud auth login "$1"
}

function gpid() {
  gcloud config set project "$1"
}
