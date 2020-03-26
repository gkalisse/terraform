# Initual Setup

Setup GCP account and workstation
```sh
$ brew cask install google-cloud-sdk
$ gcloud init --console-only
```

Login ofcourse
```sh
$ gcloud auth application-default login
```

Create main gcp project where state files will exist.
```sh
$ gcloud projects create gk-main
$ gcloud config set project gk-main
$ gcloud config set compute/region us-east1
$ gcloud config set compute/zone us-east1-c
$ 
$ gcloud services enable cloudresourcemanager.googleapis.com
$ gcloud services enable cloudbilling.googleapis.com
$ gcloud services enable iam.googleapis.com
$ gcloud services enable compute.googleapis.com
$ gcloud services enable serviceusage.googleapis.com
$ gcloud services enable storage-api.googleapis.com
$ gcloud services enable container.googleapis.com
```

Create gcp project where project resources (GKE clusters) will exist.
```sh
$ gcloud projects create gk-mission
$ gcloud config set project gk-mission
$ 
$ gcloud services enable cloudresourcemanager.googleapis.com
$ gcloud services enable cloudbilling.googleapis.com
$ gcloud services enable iam.googleapis.com
$ gcloud services enable compute.googleapis.com
$ gcloud services enable serviceusage.googleapis.com
$ gcloud services enable storage-api.googleapis.com
$ gcloud services enable container.googleapis.com
```

Create nonprod infra
```sh
$ gcloud config set project gk-main
$ terraform workspace new nonprod
$ terraform init
$ terraform plan
$ terraform apply
```
and then get kubeconfig spec
```sh
$ gcloud config set project gk-mission
$ gcloud container clusters get-credentials gk-mission-nonprod
$ kubectl config use-context gke_gk-mission_us-east1-c_gk-mission-nonprod
```
Create prod1 infra
```sh
$ gcloud config set project gk-main
$ terraform workspace new prod
$ terraform init
$ terraform plan
$ terraform apply
```
and then get kubeconfig spec
```sh
$ gcloud config set project gk-mission
$ gcloud container clusters get-credentials gk-mission-prod1
$ kubectl config use-context gke_gk-mission_us-east1-c_gk-mission-prod1
```

