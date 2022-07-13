terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "~> 0.70.0"
    }
  }
}

provider "yandex" {
  token                    = "   "
  cloud_id                 = "   "
  folder_id                = "   "
  zone                     = "ru-central1-a"
}

resource "yandex_compute_instance" "vm-servers" {

  name                      = "vm-${count.index+1}"
  count                     = var.data["count"]
  platform_id               = "standard-v1"
  hostname                  = "vm-${count.index+1}"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
   initialize_params {
      image_id = "fd82re2tpfl4chaupeuf" //Ubuntu 20.04 LTS (ubuntu-20-04-lts-v20220502)
      size     = 10
      type     = "network-ssd"
    }
  }
  
  secondary_disk {
    disk_id = yandex_compute_disk.vm-secondary-data-disk[count.index].id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.web-servers-subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "vm-servers:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_vpc_network" "web-servers-network" {
  name = "web-servers-network"
}

resource "yandex_vpc_subnet" "web-servers-subnet" {
  name           = "web-servers-subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.web-servers-network.id
  v4_cidr_blocks = ["10.158.0.0/24"]
}


resource "yandex_compute_disk" "vm-secondary-data-disk" {

  count = var.data["count"]
  name = "vm-secondary-data-disk-${count.index+1}"
  type = "network-hdd"
  zone = "ru-central1-a"
  size = "5"
}


output "external_ip_address_vm-servers" {
  value = [yandex_compute_instance.vm-servers[*].hostname,yandex_compute_instance.vm-servers[*].network_interface.0.nat_ip_address]
}

output "internal_ip_address_vm-servers" {
  value = [yandex_compute_instance.vm-servers[*].hostname,yandex_compute_instance.vm-servers[*].network_interface.0.ip_address]
}


resource "null_resource" "ansible-install" {

  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = format("ansible-playbook -D -i %s, -u ${var.data["account"]} ${path.module}/provision.yml",
    join("\",\"", yandex_compute_instance.vm-servers[*].network_interface.0.nat_ip_address)
    )
  }
}
