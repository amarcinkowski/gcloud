# gcloud
qwik gcloud

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


