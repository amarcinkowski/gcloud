# gcloud

My notes for Google Cloud trainings (Google Cloud Skills Boost).

## Ubuntu env setup (one time)

```
sudo apt install apt-transport-https ca-certificates gnupg curl
echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.asc
sudo apt update && sudo apt-get install google-cloud-cli
```

## Training env setup (each)

```
gcloud auth login
gcloud config set project qwiklabs-gcp-03-014d3a9d0a1a
```

# DevOps Engineer path
[Perform Foundational Infrastructure Tasks in Google Cloud](devops-infra-tsks.md)
