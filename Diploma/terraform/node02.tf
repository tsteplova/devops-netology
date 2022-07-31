resource "yandex_compute_instance" "db02" {
  name                      = "db02"
  zone                      = "ru-central1-a"
  hostname                  = "db02.${var.domain}"
  platform_id               = "standard-v2"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
#    core_fraction = local.instance_type[terraform.workspace]
  }

  boot_disk {
    initialize_params {
      image_id = "${var.ubuntu2004}"
      name     = "root-db02"
      type     = "network-nvme"
      size     = "20"
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.priv-subnet.id
#    nat        = true
    ip_address = "192.168.101.13"
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}
