resource "yandex_compute_instance" "nginx" {
  name                      = "nginx"
  zone                      = "ru-central1-b"
  hostname                  = "${var.domain}"
  platform_id               = "standard-v2"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
#    core_fraction = local.instance_type[terraform.workspace]
  }

  boot_disk {
    initialize_params {
      image_id = "${var.ubuntu-1804}"
      name     = "root-nginx"
      type     = "network-nvme"
      size     = "20"
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.web-subnet.id
#    subnet_id = yandex_vpc_subnet.priv-subnet.id
    nat        = true
    ip_address = "192.168.100.11"

  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}
