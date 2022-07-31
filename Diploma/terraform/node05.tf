resource "yandex_compute_instance" "runner" {
  name                      = "runner"
  zone                      = "ru-central1-a"
  hostname                  = "runner.${var.domain}"
  platform_id               = "standard-v2"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "${var.ubuntu2004}"
      name     = "root-runner"
      type     = "network-nvme"
      size     = "20"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.priv-subnet.id
    #    nat        = false
    ip_address = "192.168.101.16"
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}
