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

| trng | details | result |
|---|---|---|
| [Perform Foundational Infrastructure Tasks in Google Cloud](devops-infra-tsks.md) | `10 labs (2 days, 6h): GSP064, GSP073, GSP074, GSP080, GSP081, GSP089, GSP094, GSP095, GSP096, GSP315` | :white_check_mark: :100: :ok: |
| [Monitor and Log with Google Cloud Operations Suite](devops-monitor.md) | | :soon: |
