### Домашнее задание к занятию "08.01 Введение в Ansible"

> #### Подготовка к выполнению
>
> 1. Установите ansible версии 2.10 или выше.
> 2. Создайте свой собственный публичный репозиторий на github с произвольным именем.
> 3. Скачайте [playbook](https://github.com/netology-code/mnt-homeworks/blob/master/08-ansible-01-base/playbook) из репозитория с домашним заданием и перенесите его в свой репозиторий.

![ansible_1.png](https://github.com/tsteplova/devops-netology/blob/fix/Ansible/png/ansible_1.png?raw=true)

[ansible](https://github.com/tsteplova/devops-netology/tree/main/ansible_git)

> #### Основная часть
>
> 1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте какое значение имеет факт `some_fact` для указанного хоста при выполнении playbook'a.

![ansible_2.png](https://github.com/tsteplova/devops-netology/blob/fix/Ansible/png/ansible_2.png?raw=true)

> 2. Найдите файл с переменными (group_vars) в котором задаётся найденное в  первом пункте значение и поменяйте его на 'all default fact'.

![ansible_3.png](https://github.com/tsteplova/devops-netology/blob/fix/Ansible/png/ansible_3.png?raw=true)

> 3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.

![ansible_5.png](https://github.com/tsteplova/devops-netology/blob/fix/Ansible/png/ansible_5.png?raw=true)

![ansible_4.png](https://github.com/tsteplova/devops-netology/blob/fix/Ansible/png/ansible_4.png?raw=true)

> 4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.

![ansible_6.png](https://github.com/tsteplova/devops-netology/blob/fix/Ansible/png/ansible_6.png?raw=true)

> 5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились следующие значения: для `deb` - 'deb default fact', для `el` - 'el default fact'.

![ansible_7.png](https://github.com/tsteplova/devops-netology/blob/fix/Ansible/png/ansible_7.png?raw=true)

> 6. Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.

![ansible_8.png](https://github.com/tsteplova/devops-netology/blob/fix/Ansible/png/ansible_8.png?raw=true)

> 7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.

![ansible_9.png](https://github.com/tsteplova/devops-netology/blob/fix/Ansible/png/ansible_9.png?raw=true)

> 8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.

![ansible_10.png](https://github.com/tsteplova/devops-netology/blob/fix/Ansible/png/ansible_10.png?raw=true)

> 9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.

подойдет “local”

> 10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.

![ansible_11.png](https://github.com/tsteplova/devops-netology/blob/fix/Ansible/png/ansible_11.png?raw=true)

> 11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь что факты `some_fact` для каждого из хостов определены из верных `group_vars`.

![ansible_12.png](https://github.com/tsteplova/devops-netology/blob/fix/Ansible/png/ansible_12.png?raw=true)

> 12. Заполните `README.md` ответами на вопросы. Сделайте `git push` в ветку `master`. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым `playbook` и заполненным `README.md`.

[README.md](https://github.com/tsteplova/devops-netology/blob/main/ansible_git/README.md)













