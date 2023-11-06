# Google Cloud Fundamentals: Core Infrastructure

## Cloud Marketplace

menu > Marketplace - LAMP Packaged by Bitnami - zone - e2-medium - deploy

ssh - cd /opt/bitnami
```
sudo sh -c 'echo "<? php phpinfo();  ?>" > apache2/htdocs/phpinfo.php'
```

open `http://SITE_ADDRESS/phpinfo.php`

## VPC

menu > VPC network > VPC networks - default

routes - effective routes - default - view (subnets + 0.0.0.0)

firewall - rules - delete

vpc - delete network (-> no routes no firewall rules) - cannot create VM ("Go to issues")

vpc - create vpc net - subnet creation mode: automatic - firewall "select all" - create

create 2 vm's - different regions - delete allow icmp - cannot ping -  delete allow ssh & allow custom - cannot ssh to machine

## Cloud Storage & Cloud SQL

create vm - allow http traffic - advanced>management-automation `apt update & apt install apache2 php php-mysql -y & service apache2 restart` - create

create storage `LOCATION=US && gcloud storage buckets create -l $LOCATION gs://$DEVSHELL_PROJECT_ID` - upload image and authorize (acl all users)

create sql - mysql - user/pass - enterpise/sandbox - connections>networking - add a network - `<vm-instance ext.ip> 35.192.208.2/32` - save

vm - `/var/www/html` - `index.php` - db conn / pass - `<img src (url from cloud storage)` - `sudo service apache2 restart`

### Cloud Run (App in the cloud)

enable api `gcloud services enable run.googleapis.com`

nodejs - `package.json` (dep express) - `index.js` (expresss hello world) - `Dockerfile` (node:12-slim / workdir / copy / npm start)

build image `gcloud builds submit --tag gcr.io/$GOOGLE_CLOUD_PROJECT/helloworld`

check `gcloud container images list`

configure gcloud `gcloud auth configure-docker`

run app `docker run -d -p 8080:8080 gcr.io/$GOOGLE_CLOUD_PROJECT/helloworld`

see page `curl localhost:8080`

deploy to cloud run `gcloud run deploy --image gcr.io/$GOOGLE_CLOUD_PROJECT/helloworld --allow-unauthenticated --region=$LOCATION`

cleanup - remove image - `gcloud container images delete gcr.io/$GOOGLE_CLOUD_PROJECT/helloworld` - remove Cloud Run `gcloud run services delete helloworld --region="REGION"`


