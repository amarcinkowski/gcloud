# gcloud
iqwik gcloud

## GSP073 cloud-console

- menu nawigacyjne > Cloud Storage
    - create bucket
        - uid    wyłącznie małe litery, cyfry, łączniki (-), znaki podkreślenia (_) i kropki (.). Nazwy zawierające kropki wymagają [zatwierdzenia]
    - Udostępnianie zasobnika jako publicznego
        - podmioty zabepieczeń - allUsers
        - tworzenie i usuwanie folderów
## GSP074 cli / sdk

- cloud shell
    - tworzenie zasobnika (bucket)
        `gsutil mb gs://YOUR-BUCKET-NAME/`
    - przesyłanie i poiberanie pliku
        `gsutil cp ada.jpg gs://YOUR-BUCKET-NAME`
        `gsutil cp -r gs://YOUR-BUCKET-NAME/ada.jpg .`
    - kopiowanie
        `gsutil cp gs://YOUR-BUCKET-NAME/ada.jpg gs://YOUR-BUCKET-NAME/image-folder/`
    - ls
        `gsutil ls -l gs://YOUR-BUCKET-NAME`
    - Ustawianie obiektu jako dostępnego publicznie
        `gsutil acl ch -u AllUsers:R gs://YOUR-BUCKET-NAME/ada.jpg`
    - Usuwanie dostępu publicznego
        `gsutil acl ch -d AllUsers gs://YOUR-BUCKET-NAME/ada.jpg`

## GSP064 IAM

- menu nawigacyjne > Administracja > Uprawnienia (menu > IAM & Admin > IAM)
    - role w projekcie (+GRANT ACCES) basic
        - browser
        - editor
        - viewer
        - owner
    - uprawnienia do Cloud Storage 
        - Remove project access (Navigation menu > Cloud Storage > Buckets)
    - Add Storage permissions
        - Navigation menu > IAM & Admin > IAM
            - +GRANT ACCESS
            - Select a role
            - Cloud Storage > Storage Object Viewer 

## GSP089 Monitoring

Aby ustawić domyślny region i strefę dla Twojego modułu, uruchom te polecenia gcloud w konsoli Cloud:
```
gcloud config set compute/zone "ZONE"
export ZONE=$(gcloud config get compute/zone)

gcloud config set compute/region "REGION"
export REGION=$(gcloud config get compute/region)
```

- Tworzenie maszyny Compute Engine
     - menu nawigacyjne > Compute Engine > Maszyny wirtualne

        | prop      | val |
        |---|---|
        | Name	    | lamp-1-vm |
        | Region    | REGION |
        | Zone	    | ZONE |
        | Series	| E2 |
        | Machine type	| e2-medium |
        | Boot disk	| Debian GNU/Linux 11 (bullseye) |
        | Firewall	| Check Allow HTTP traffic |

- In the Console, click SSH
```
sudo apt-get update
sudo apt-get install apache2 php7.0
sudo service apache2 restart
```

- Navigation menu (Navigation menu icon) > Monitoring.
    - Run the Monitoring agent install script command in the SSH terminal of your VM-
    ```
    curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.shA
    sudo bash add-google-cloud-ops-agent-repo.sh --also-install
    sudo systemctl status google-cloud-ops-agent"*"
    ```

    - uptime checks
        - protocol - http
        - resource type - instance
        - select vm
        - freq 1min
            - [test]
            - [create]
    - alerting policy
        - alerting
        - create policy
        - metric - uncheck 'active'
        - "network traffic" vm instance - interface - network traffic
        - threshold "above threshold" 500 - retest window "1 min"
        - notification channels - email - "adr@gmail.com"
    - dashboard
        - create
        - add widget
            - line - cpu load - resource metric - uncheck 'active'
            - "cpu load (1m)" - vm instance - cpu - apply
        - add widget
            - received packets - unch 'active' - resource & metric - received packets - vm instance - instance

- Navigation menu > Logging > Logs Explorer
    - resource - vm instance > lamp-1-vm
    - stream logs

    - compute engine - vm instances - lamp - stop -> see logs
    - menu - monitoring - uptime checks
    - alerting (email)
    

## GSP081 cloud functions
 
### use case
 
- przetwarzanie danych, obrazów, trranskodowanie video, przekształcanie danych
- webhooki, github, slack, stripe
- API
- mobile backend Firebase
- IoT, Pub/Sub

### create

- menu > Clound Functions
    - http -> deploy
    - testing -> test - logs "200"

    - function - menu |... - view logs
    

### cli

1. function

```bash
gcloud config set compute/region REGION
mkdir gcf_hello_world
cd gcf_hello_world
vi index.js # GET node.js HelloWorld
```

2. bucket
`gsutil mb -p [PROJECT_ID] gs://[BUCKET_NAME]`

3. deploy
```bash
gcloud functions deploy helloWorld \
  --stage-bucket [BUCKET_NAME] \
  --trigger-topic hello_world \
  --runtime nodejs20  
```

4. check
`gcloud functions describe helloWorld`

```
DATA=$(printf 'Hello World!'|base64) && gcloud functions call helloWorld --data '{"data":"'$DATA'"}'
```

5 logs
`gcloud functions logs read helloWorld`

## GSP096 pub/sub console GSP095 pub/sub cli

- Menu nawigacyjne (Ikona menu nawigacyjnego) > Pub/Sub > Tematy.
    - create topic - create pull subscription
    - publish message
    - pull msg
    `gcloud pubsub subscriptions pull --auto-ack MySub`

- cli topics / subs
```
gcloud pubsub topics create myTopic
gcloud pubsub topics create Test1
gcloud pubsub topics create Test2

gcloud pubsub topics list
gcloud pubsub topics delete Test1

gcloud pubsub subscriptions create --topic myTopic mySubscription
gcloud pubsub subscriptions create --topic myTopic Test1

gcloud pubsub topics list-subscriptions myTopic

gcloud pubsub subscriptions delete Test1
```
- cli msgs
```
gcloud pubsub topics publish myTopic --message "Cześć"
gcloud pubsub topics publish myTopic --message "Uważam, że Pub/Sub jest super"

gcloud pubsub subscriptions pull mySubscription --auto-ack
gcloud pubsub subscriptions pull mySubscription --auto-ack --limit=3
```

## GSP094 pub sub python

### virtual env

```
apt-get install -y virtualenv
python3 -m venv venv
source venv/bin/activate

pip install --upgrade google-cloud-pubsub
git clone https://github.com/googleapis/python-pubsub.git
cd python-pubsub/samples/snippets
GOOGLE_CLOUD_PROJECT=XXXXXXXXXXXXXX
python publisher.py -h
python publisher.py $GOOGLE_CLOUD_PROJECT create MyTopic
python subscriber.py $GOOGLE_CLOUD_PROJECT create MyTopic MySub

gcloud pubsub topics publish MyTopic --message "Hello"

python subscriber.py $GOOGLE_CLOUD_PROJECT receive MySub
```


