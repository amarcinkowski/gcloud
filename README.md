# gcloud

My notes for Google Cloud trainings (Google Cloud Skills Boost) and [Progress report](https://docs.google.com/spreadsheets/d/1RGSgV5ofXTanl3J4R-YPjYXgUAg-7YXgznbx_X-91X8/edit?usp=sharing).

## Ubuntu env setup (one time)

### gcloud
```
sudo apt install apt-transport-https ca-certificates gnupg curl
echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.asc
sudo apt update && sudo apt-get install google-cloud-cli
```
### for kubectl auth
```
sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
```

## Training env setup (each)

### Auth & project
```
gcloud auth login
gcloud config set project qwiklabs-gcp-03-014d3a9d0a1a
```

### Default zone & region 
```
gcloud config set compute/zone "ZONE"
export ZONE=$(gcloud config get compute/zone)

gcloud config set compute/region "REGION"
export REGION=$(gcloud config get compute/region)
```
# DevOps Engineer path

| trng | details | result | badge |
|---|---|---|---|
| [Perform Foundational Infrastructure Tasks in Google Cloud](devops-infra-tsks.md) | `10 labs (2 days, 6h): GSP064, GSP073, GSP074, GSP080, GSP081, GSP089, GSP094, GSP095, GSP096, GSP315` | :white_check_mark: :100: :ok: | [badge](https://cdn.qwiklabs.com/SOUHCWvev6HmfC5QztXJd%2BCkSK8%2B3WGWg%2BF%2Fww%2FfqXA%3D) |
| [Monitor and Log with Google Cloud Operations Suite](devops-monitor.md) | `6 labs (4 days, 7h): GSP087, GSP089, GSP090, GSP091, GSP092, GSP111, GSP338` | :white_check_mark: :100: :ok: | [badge](https://cdn.qwiklabs.com/qJIAuJXge9co6AJ0qbQlcjkJ%2F2uHpOQA4eHmmLBQQOc%3D) |
| [Google Cloud Fundamentals: Core Infrastructure](devops-core-infra.md) | `(6 modules, 1day, 5h)` | :white_check_mark: :100: :ok: | [badge](https://cdn.qwiklabs.com/c2YC1UuO5rdWmNVT%2FcutvuyiE3DJMExXHjpOU15jvhY%3D) |


# Google Cloud Badges

| | |
|---|---|

# Useful commands

### change type (e.g. to e2-medium)
```bash
 1062  gcloud compute instances describe my-opencensus-demo
 1064  gcloud compute instances stop my-opencensus-demo
 1066* gcloud compute instances set-machine-type  my-opencensus-demo --machine-type e2-medium
 1067* gcloud compute instances start my-opencensus-demo
```

### get project 
```
gcloud info --format='value(config.project)'
```

### enable api
```
gcloud services enable run.googleapis.com
```


