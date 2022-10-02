### Домашнее задание к занятию "6.3. MySQL"

> #### Задача 1
>
> Используя docker поднимите инстанс MySQL (версию 8). Данные БД сохраните в volume.
>
> Изучите [бэкап БД](https://github.com/netology-code/virt-homeworks/tree/master/06-db-03-mysql/test_data) и восстановитесь из него.
>
> Перейдите в управляющую консоль mysql внутри контейнера.
>
> Используя команду \h получите список управляющих команд.
>
> Найдите команду для выдачи статуса БД и **приведите в ответе** из ее вывода версию сервера БД.
>
> Подключитесь к восстановленной БД и получите список таблиц из этой БД.
>
> **Приведите в ответе** количество записей с price > 300.
>
> В следующих заданиях мы будем продолжать работу с данным контейнером.

Поднимаем MySQL.

![MySQL.png](https://github.com/tsteplova/devops-netology/blob/fix/MySQL.png?raw=true)

![MySQL1.png](https://github.com/tsteplova/devops-netology/blob/fix/MySQL1.png?raw=true)

Используя команду \h получаем список управляющих команд.

![MySQL2.png](https://github.com/tsteplova/devops-netology/blob/fix/MySQL2.png?raw=true)

Находим команду для выдачи статуса БД и **приводим в ответе** из ее вывода версию сервера БД.

![MySQL3.png](https://github.com/tsteplova/devops-netology/blob/fix/MySQL3.png?raw=true)

Создаем базу.

![MySQL4.png](https://github.com/tsteplova/devops-netology/blob/fix/MySQL4.png?raw=true)

Копируем дамп в том.

![MySQL5.png](https://github.com/tsteplova/devops-netology/blob/fix/MySQL5.png?raw=true)

Восстанавливаем базу.

![MySQL6.png](https://github.com/tsteplova/devops-netology/blob/fix/MySQL6.png?raw=true)

![MySQL7.png](https://github.com/tsteplova/devops-netology/blob/fix/MySQL7.png?raw=true)

------

> ## Задача 2
>
> Создайте пользователя test в БД c паролем test-pass, используя:
>
> - плагин авторизации mysql_native_password
> - срок истечения пароля - 180 дней
> - количество попыток авторизации - 3
> - максимальное количество запросов в час - 100
> - аттрибуты пользователя:
>   - Фамилия "Pretty"
>   - Имя "James"
>
> Предоставьте привелегии пользователю `test` на операции SELECT базы `test_db`.
>
> Используя таблицу INFORMATION_SCHEMA.USER_ATTRIBUTES получите данные по пользователю `test` и **приведите в ответе к задаче**.

![MySQL8.png](https://github.com/tsteplova/devops-netology/blob/fix/MySQL8.png?raw=true)

--------

> ## Задача 3
>
> Установите профилирование `SET profiling = 1`. Изучите вывод профилирования команд `SHOW PROFILES;`.
>
> Исследуйте, какой `engine` используется в таблице БД `test_db` и **приведите в ответе**.
>
> Измените `engine` и **приведите время выполнения и запрос на изменения из профайлера в ответе**:
>
> - на `MyISAM`
> - на `InnoDB`

![MySQL9.png](https://github.com/tsteplova/devops-netology/blob/fix/MySQL9.png?raw=true)

------

> ## Задача 4
>
> Изучите файл `my.cnf` в директории /etc/mysql.
>
> Измените его согласно ТЗ (движок InnoDB):
>
> - Скорость IO важнее сохранности данных
> - Нужна компрессия таблиц для экономии места на диске
> - Размер буффера с незакомиченными транзакциями 1 Мб
> - Буффер кеширования 30% от ОЗУ
> - Размер файла логов операций 100 Мб
>
> Приведите в ответе измененный файл `my.cnf`.

![MySQL10.png](https://github.com/tsteplova/devops-netology/blob/fix/MySQL10.png?raw=true)

