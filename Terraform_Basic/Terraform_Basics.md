### Домашнее задание к занятию "7.3. Основы и принцип работы Терраформ"

> #### Задача 1. Создадим бэкэнд в S3 (необязательно, но крайне желательно).
>
> Если в рамках предыдущего задания у вас уже есть аккаунт AWS, то давайте продолжим знакомство со взаимодействием терраформа и aws.
>
> 1. Создайте s3 бакет, iam роль и пользователя от которого будет работать терраформ. Можно создать отдельного пользователя, а можно использовать созданного в рамках предыдущего задания, просто добавьте ему необходимы права, как описано [здесь](https://www.terraform.io/docs/backends/types/s3.html).
> 2. Зарегистрируйте бэкэнд в терраформ проекте как описано по ссылке выше.

Делаю в Yandex Cloud

![Terraform_Basics.png](https://github.com/tsteplova/devops-netology/blob/fix/Terraform_Basic/png/Terraform_Basics.png?raw=true)

> #### Задача 2. Инициализируем проект и создаем воркспейсы.
>
> 1. Выполните 
>
>    ```
>    terraform init
>    ```
>
>    - если был создан бэкэнд в S3, то терраформ создаст файл стейтов в S3 и запись в таблице dynamodb.
>    - иначе будет создан локальный файл со стейтами.

> 2. Создайте два воркспейса `stage` и `prod`.
>
> 3. В уже созданный `aws_instance` добавьте зависимость типа инстанса от вокспейса, что бы в разных ворскспейсах использовались разные `instance_type`.
>
> 4. Добавим `count`. Для `stage` должен создаться один экземпляр `ec2`, а для `prod` два.

![Terraform_Basics_1.png](https://github.com/tsteplova/devops-netology/blob/fix/Terraform_Basic/png/Terraform_Basics_1.png?raw=true)

> 5. Создайте рядом еще один `aws_instance`, но теперь определите их количество при помощи `for_each`, а не `count`.
>
> 6. Что бы при изменении типа инстанса не возникло ситуации, когда не будет ни одного инстанса добавьте параметр жизненного цикла `create_before_destroy = true` в один из ресурсов `aws_instance`.
>
> 7. При желании поэкспериментируйте с другими параметрами и ресурсами.

![Terraform_Basics_2.png](https://github.com/tsteplova/devops-netology/blob/fix/Terraform_Basic/png/Terraform_Basics_2.png?raw=true)

> В виде результата работы пришлите:
>
> - Вывод команды `terraform workspace list`.

![Terraform_Basics_1.png](https://github.com/tsteplova/devops-netology/blob/fix/Terraform_Basic/png/Terraform_Basics_1.png?raw=true)

> - Вывод команды `terraform plan` для воркспейса `prod`.

[terraform plan](https://github.com/tsteplova/devops-netology/blob/fix/Terraform_Basics/terraform_plan.log)

[main.tf](https://github.com/tsteplova/devops-netology/blob/fix/Terraform_Basics/main.tf)