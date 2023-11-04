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



