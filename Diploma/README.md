### **Дипломный практикум в YandexCloud**

> **Цели:**
>
> 1. Зарегистрировать доменное имя (любое на ваш выбор в любой доменной зоне).
> 2. Подготовить инфраструктуру с помощью Terraform на базе облачного провайдера YandexCloud.
> 3. Настроить внешний Reverse Proxy на основе Nginx и LetsEncrypt.
> 4. Настроить кластер MySQL.
> 5. Установить WordPress.
> 6. Развернуть Gitlab CE и Gitlab Runner.
> 7. Настроить CI/CD для автоматического развёртывания приложения.
> 8. Настроить мониторинг инфраструктуры с помощью стека: Prometheus, Alert Manager и Grafana.

> **Этапы выполнения:**
>
> ***1. Регистрация доменного имени***
>
> Подойдет любое доменное имя на ваш выбор в любой доменной зоне.
>  ПРИМЕЧАНИЕ: Далее в качестве примера используется домен `you.domain` замените его вашим доменом.
>  Рекомендуемые регистраторы:
>
> •	[nic.ru](https://www.nic.ru)
>  •	[reg.ru](https://www.reg.ru)
>
> *Цель:*
>
> 1. Получить возможность выписывать [TLS сертификаты](https://letsencrypt.org) для веб-сервера.
>
> *Ожидаемые результаты:*
>
> 1. У вас есть доступ к личному кабинету на сайте регистратора.
> 2. Вы зарезистрировали домен и можете им управлять (редактировать dns записи в рамках этого домена).

Подготовительные действия:

1. Заведен аккаунт в YandexCloud.
2. Сгенерированы необходимые ключи доступа в YandexCloud.
3. Создан Object Storage.
4. У регистратора [reg.ru](https://reg.ru) зарегистрирован домен tsteplova.fun.
5. Домен делегирован под управление `ns1.yandexcloud.net` и `ns2.yandexcloud.net`.
6. Создан `worckspace` 'stage'.

```bash
$ cd terraform
$ terraform workspace new stage
$ terraform workspace select stage
$ terraform workspace list
  default
  prod
* stage
```

![YO_workspace.png](https://github.com/tsteplova/devops-netology/blob/fix/Diploma/png/YO_workspace.png?raw=true)

7. **Создание инфраструктуры**

В качетсве backend используется S3 bucket YC

```
backend "s3"  {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "my-stage"
    region     = "ru-central1"
    key        = "terraform.tfstate"
    access_key = "YC***************"
    secret_key = "YC***************************"
    skip_region_validation      = true
    skip_credentials_validation = true
}
```

![YO_Backend_1.png](https://github.com/tsteplova/devops-netology/blob/fix/Diploma/png/YO_Backend_1.png?raw=true)

8. Перед началом развертывания все переменные в файле **variables.tf**  и **provider.tf** должны быть заполнены соответствующими значениям.

Если workspace уже создан, то достаточно выполнить следующее.

$ terraform init

$ terraform plan

$ terraform apply -auto-approve

после 30 - 50 минут увидим успешное построение инфраструктуры в YC.

![YO_3.png](https://github.com/tsteplova/devops-netology/blob/fix/Diploma/png/YO_3.png?raw=true)

В YC после созданий инфраструктуры представлены:

##### Ноды виртуальных машин

![YO_mashini.png](https://github.com/tsteplova/devops-netology/blob/fix/Diploma/png/YO_mashini.png?raw=true)

![YO_Disk.png](https://github.com/tsteplova/devops-netology/blob/fix/Diploma/png/YO_Disk.png?raw=true)

Для инфраструктуры было использовано две подсети: `192.168.100.0/24  для revers-proxy на базе nginx и 192.168.101.0/24 `  для остальных сервисов располагающихся за Nat reverse-proxy.

![YO_net.png](https://github.com/tsteplova/devops-netology/blob/fix/Diploma/png/YO_net.png?raw=true)

Записи DNS делегированного домена:

![YO_dns.png](https://github.com/tsteplova/devops-netology/blob/fix/Diploma/png/YO_dns.png?raw=true)

