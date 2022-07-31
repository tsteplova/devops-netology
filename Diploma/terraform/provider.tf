terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.70.0"
    }
  }

  backend "s3" {
    endpoint                    = "storage.yandexcloud.net"
    bucket                      = " "
    region                      = "ru-central1"
    key                         = "terraform.tfstate"
    access_key                  = " "
    secret_key                  = " "
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  token = " "
  cloud_id  = " "
  folder_id = " "
  zone      = "ru-central1-a"
}
