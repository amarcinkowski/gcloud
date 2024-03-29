# Monitor and Log with Google Cloud Operations Suite

## GSP089 monitoring 

Agent Cloud Monitoring jest demonem collectd zbierającym dane, który gromadzi wskaźniki dotyczące systemu i aplikacji z maszyn wirtualnych i przesyła je do usługi Monitoring. 

```
curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.sh
sudo bash add-google-cloud-ops-agent-repo.sh --also-install
sudo systemctl status google-cloud-ops-agent"*"
```

### uptime check & alerting

#### create uptime

protocol - http 
resource type - instance
instance - [select]
check freq - 1m
[continue] x3
[test]
[create]

#### alerting - create policy

metric - uncheck active - network traffic (vm instance - interface)
threshold - above - 500 - reset window 1m
notification channels - manage - add email - save
[create]

#### dashboard

dashboards - create - add widget - line
metric - uncheck active - cpu load 1m (vm instance - cpu)

add widget - received packets (vm instance - instance)

### Logs

menu - logging - logs explorer
resource - vm instance - apply
stream logs

## GSP090 cloud monitoring (multiple projects)

### Add 2nd project

menu > monitoring - Settings (left pannel) +Add GCP Projects [Add]

### Monitoring group

menu - groups +create - criteria - name (contains) "instance" - [create]

uptime checks +create - tcp (protocol) - instance (resource type) - aplies to DemoGroup - 22 (port - freq 1m
[test] - [create]

uptime checks -  three dots  -  add alert policy +add alert condition - Uptime health check on DemoGroup
new condition - metric - uncheck active - search check_passed and click VM Instance > Uptime_check > Check passed [apply]


## GSP092 monitoring logging - cloud func

### cloud function

name - region - http (trigger type) - allow unauth invocations [save] - runtime settings - max num of instances 5
- [next] - [deploy]

### vegeta

cloud function - trigger tab - trigger url - copy url
```
curl -LO 'https://github.com/tsenart/vegeta/releases/download/v6.3.0/vegeta-v6.3.0-linux-386.tar.gz'
tar xvzf vegeta-v6.3.0-linux-386.tar.gz
echo "GET https://-.cloudfunctions.net/helloWorld" | ./vegeta attack -duration=300s > results.bin
```

### logs based metric

logging - logs explorer - resource - cloud function->helloWorld [apply] - run query - create metric
distribution (metric type) - cloudfunctionlatency-logs - textPayload - regular expr
```
execution took (\d+)
```
[create metric]

### monitoring

menu - monitoring - metric explorer - select a metric "executions" - cloud fun->fun->executions [apply]
widget type - sacked bar chart 

### dashboards

dashboards - add widget - stacket bar - select a metric - vm instance>cpi>cpu util [apply]
add widget - heamap - select a metric - vm instance> Vm_flow < RTT LATENCIES [apply]

## GSP111 reporting app metrics into cloud monitoring (open census)

create vm instance (e2 medium) - allow http / https
install go & open sensus
```
sudo curl -O https://storage.googleapis.com/golang/go1.17.2.linux-amd64.tar.gz
sudo tar -xvf go1.17.2.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo mv go /usr/local
sudo apt-get update
sudo apt-get install git
export PATH=$PATH:/usr/local/go/bin
go get go.opencensus.io
go get contrib.go.opencensus.io/exporter/stackdriver
go mod init test3
go mod tidy
```

install agents for cloud monitoring
```
curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.sh
sudo bash add-google-cloud-ops-agent-repo.sh --also-install
```

Run App `go run main.go`

Cloud Monitoring - Metrics Explorer - Select a metric - vm>custom metrics>opencensus/my.videoservice.org


## GSP091 log-based metrics

Log-based metrics:
- system metrics
- user-defined metrics

create GKE cluster
`gcloud container clusters create gmp-cluster --num-nodes=1 --zone us-east1-c`

### log based alert

logs explorer
```
resource.type="gce_instance" 
protoPayload.methodName="v1.compute.instances.stop"
```
create alert - notification - email

### log-based metric

list clusters
`gcloud container clusters list`

authenticated the cluster
`gcloud container clusters get-credentials gmp-cluster`

create namespace
`kubectl create ns gmp-test`

deploy and verify app
```
kubectl -n gmp-test apply -f https://storage.googleapis.com/spls/gsp091/gmp_flask_deployment.yaml
kubectl -n gmp-test apply -f https://storage.googleapis.com/spls/gsp091/gmp_flask_service.yaml
kubectl get services -n gmp-test
```

logs explorer - create metric - filter selection
```
severity=ERROR
resource.labels.container_name="hello-app"
textPayload: "ERROR: 404 Error page not found"
```
[create]

logging - log-based metric - select - 2min roll win - notifications - create policy

> generate errors in bash

### logs explorer - monitoring - alerting - alerting policies

