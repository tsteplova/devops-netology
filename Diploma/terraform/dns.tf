resource "yandex_dns_zone" "public-zone" {
  name   = "my-public-zone"
  zone   = "${var.domain}."
  public = true
}

resource "yandex_dns_recordset" "dns_record_1" {
  zone_id = yandex_dns_zone.public-zone.id
  name    = "${var.domain}."
  type    = "A"
  ttl     = 600
  data    = [yandex_compute_instance.nginx.network_interface.0.nat_ip_address]
  depends_on = [
    yandex_compute_instance.nginx
  ]
}

resource "yandex_dns_recordset" "dns_record_2" {
  zone_id = yandex_dns_zone.public-zone.id
  name    = "www"
  type    = "A"
  ttl     = 600
  data    = [yandex_compute_instance.nginx.network_interface.0.nat_ip_address]
  depends_on = [
    yandex_compute_instance.nginx
  ]
}

resource "yandex_dns_recordset" "dns_record_3" {
  zone_id = yandex_dns_zone.public-zone.id
  name    = "gitlab"
  type    = "A"
  ttl     = 600
  data    = [yandex_compute_instance.nginx.network_interface.0.nat_ip_address]
  depends_on = [
    yandex_compute_instance.nginx
  ]
}

resource "yandex_dns_recordset" "dns_record_4" {
  zone_id = yandex_dns_zone.public-zone.id
  name    = "grafana"
  type    = "A"
  ttl     = 600
  data    = [yandex_compute_instance.nginx.network_interface.0.nat_ip_address]
  depends_on = [
    yandex_compute_instance.nginx
  ]
}

resource "yandex_dns_recordset" "dns_record_5" {
  zone_id = yandex_dns_zone.public-zone.id
  name    = "prometheus"
  type    = "A"
  ttl     = 600
  data    = [yandex_compute_instance.nginx.network_interface.0.nat_ip_address]
  depends_on = [
    yandex_compute_instance.nginx
  ]
}

resource "yandex_dns_recordset" "dns_record_6" {
  zone_id = yandex_dns_zone.public-zone.id
  name    = "alertmanager"
  type    = "A"
  ttl     = 600
  data    = [yandex_compute_instance.nginx.network_interface.0.nat_ip_address]
  depends_on = [
    yandex_compute_instance.nginx
  ]
}
