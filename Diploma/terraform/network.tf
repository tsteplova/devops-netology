resource "yandex_vpc_network" "default" {
  name = "net"
}

resource "yandex_vpc_subnet" "web-subnet" {
  name           = "websubnet"
  zone           = "ru-central1-b"
  network_id     = "${yandex_vpc_network.default.id}"
  v4_cidr_blocks = ["192.168.100.0/24"]
}

resource "yandex_vpc_route_table" "route" {
  network_id = "${yandex_vpc_network.default.id}"

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "192.168.100.11"
  }
}

resource "yandex_vpc_subnet" "priv-subnet" {
  name           = "privsubnet"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.default.id}"
  route_table_id = "${yandex_vpc_route_table.route.id}"
  v4_cidr_blocks = ["192.168.101.0/24"]
}
