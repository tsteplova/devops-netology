### Домашнее задание к занятию "08.02 Работа с Playbook"

> #### Подготовка к выполнению
>
> 1. Создайте свой собственный (или используйте старый) публичный репозиторий на github с произвольным именем.
> 2. Скачайте [playbook](https://github.com/netology-code/mnt-homeworks/blob/master/08-ansible-02-playbook/playbook) из репозитория с домашним заданием и перенесите его в свой репозиторий.
> 3. Подготовьте хосты в соответствии с группами из пред подготовленного playbook.
> 4. Скачайте дистрибутив [java](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html) и положите его в директорию `playbook/files/`.

#### Основная часть

1. Приготовьте свой собственный inventory файл `prod.yml`.

![Playbook_1.png](https://github.com/tsteplova/devops-netology/blob/fix/Playbook/png/Playbook_1.png?raw=true)

2. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает [vector](https://vector.dev).

3. При создании tasks рекомендую использовать модули: `get_url`, `template`, `unarchive`, `file`.

4. Tasks должны: скачать нужной версии дистрибутив, выполнить распаковку в выбранную директорию, установить vector.

![Playbook_2.png](https://github.com/tsteplova/devops-netology/blob/fix/Playbook/png/Playbook_2.png?raw=true)

5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.

6. Попробуйте запустить playbook на этом окружении с флагом `--check`.

![Playbook_3.png](https://github.com/tsteplova/devops-netology/blob/fix/Playbook/png/Playbook_3.png?raw=true)

7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.

![Playbook_4.png](https://github.com/tsteplova/devops-netology/blob/fix/Playbook/png/Playbook_4.png?raw=true)

8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.

![Playbook_5.png](https://github.com/tsteplova/devops-netology/blob/fix/Playbook/png/Playbook_5.png?raw=true)

9. Подготовьте README.md файл по своему playbook. В нём должно быть  описано: что делает playbook, какие у него есть параметры и теги.

[README.md](https://github.com/tsteplova/devops-netology/blob/fix/Playbook/Playbook.md)

10. Готовый playbook выложите в свой репозиторий, в ответ предоставьте ссылку на него.

[playbook](https://github.com/tsteplova/devops-netology/tree/fix/Playbook)