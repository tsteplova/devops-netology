variable "domain" {
  default = " "
}

variable "le_staging" {
  default = "true"
}

variable "ubuntu-1804" {
  default = "fd84mnpg35f7s7b0f5lg"
}

variable "ubuntu2004" {
  default = "fd8mn5e1cksb3s1pcq12"
}

# Токен для работы Gitlab c runner
variable "gitlab_runner" {
  default = " "
}

# Внутренний пароль для репликации между базами MySQL
variable "replicator_psw" {
  default = "vagrantrep"
}

# Пароль для доступа к Gitlab от пользователя `root`
variable "gitlab_psw" {
  default = "vagrantlab"
}

# Пароль для доступа к Grafana от пользователя `admin`
variable "grafana_psw" {
  default = "vagrantgra"
}
