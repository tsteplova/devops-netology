### Домашнее задание к занятию "7.6. Написание собственных провайдеров для Terraform."

> Бывает, что
>
> - общедоступная документация по терраформ ресурсам не всегда достоверна,
> - в документации не хватает каких-нибудь правил валидации или неточно описаны параметры,
> - понадобиться использовать провайдер без официальной документации,
> - может возникнуть необходимость написать свой провайдер для системы используемой в ваших проектах.

> ## Задача 1.
>
> Давайте потренируемся читать исходный код AWS провайдера, который можно с клонировать от сюда: https://github.com/hashicorp/terraform-provider-aws.git. Просто найдите нужные ресурсы в исходном коде и ответы на вопросы станут понятны.

[репозиторий](https://github.com/tsteplova/terraform-provider-aws)

> 1. Найдите, где перечислены все доступные `resource` и `data_source`, приложите ссылку на эти строки в коде на гитхабе.

[resource](https://github.com/tsteplova/terraform-provider-aws/blob/main/internal/provider/provider.go#L911-L2085)   со строки 911

[data_source](https://github.com/tsteplova/terraform-provider-aws/blob/main/internal/provider/provider.go#L425-L909)   со строки 425

> 2. Для создания очереди сообщений SQS используется ресурс `aws_sqs_queue` у которого есть параметр `name`.
>
> - С каким другим параметром конфликтует `name`? Приложите строчку кода, в которой это указано.
> - Какая максимальная длина имени?
> - Какому регулярному выражению должно подчиняться имя?

[ConflictsWith: []string{"name_prefix"}](https://github.com/tsteplova/terraform-provider-aws/blob/main/internal/service/sqs/queue.go#L87)

[Длина не более 80 символов](https://github.com/tsteplova/terraform-provider-aws/blob/main/internal/service/sqs/queue.go#L427)

[регулярное выражение](https://github.com/tsteplova/terraform-provider-aws/blob/main/internal/service/sqs/queue.go#L424-L428)

![Terraform_own_provider.png](https://github.com/tsteplova/devops-netology/blob/fix/Terraform_own_provider.png?raw=true)