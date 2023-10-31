# gcloud

My notes for Google Cloud trainings (Google Cloud Skills Boost) and [Progress report](https://docs.google.com/spreadsheets/d/1RGSgV5ofXTanl3J4R-YPjYXgUAg-7YXgznbx_X-91X8/edit?usp=sharing).

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

| trng | details | result | badge |
|---|---|---|---|
| [Perform Foundational Infrastructure Tasks in Google Cloud](devops-infra-tsks.md) | `10 labs (2 days, 6h): GSP064, GSP073, GSP074, GSP080, GSP081, GSP089, GSP094, GSP095, GSP096, GSP315` | :white_check_mark: :100: :ok: | [img](https://cdn.qwiklabs.com/Hgcj1JOh2iuL7imDUME0%2BjEemAfZlnOJoEHsVFIVQCY%3D) INFRASTRUCTURE MODERNIZATION SKILL |
| [Monitor and Log with Google Cloud Operations Suite](devops-monitor.md) | | :soon: | |


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
