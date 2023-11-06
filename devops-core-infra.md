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


