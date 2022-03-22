### Домашнее задание к занятию "6.4. PostgreSQL"

> #### Задача 1
>
> Используя docker поднимите инстанс PostgreSQL (версию 13). Данные БД сохраните в volume.
>
> Подключитесь к БД PostgreSQL используя `psql`.
>
> Воспользуйтесь командой `\?` для вывода подсказки по имеющимся в `psql` управляющим командам.
>
> **Найдите и приведите** управляющие команды для:
>
> - вывода списка БД
> - подключения к БД
> - вывода списка таблиц
> - вывода описания содержимого таблиц
> - выхода из psql

Поднимаем PostgreSQL.

docker pull postgres:13

![PostgreSQL.png](https://github.com/tsteplova/devops-netology/blob/fix/PostgreSQL.png?raw=true)

docker volume create v_postgres

docker image tag postgres:13 v_post

docker run --rm --name v_post -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD= postgres -ti -p 5432:5432 -v v_postges:/var/lib/postgresql/data postgres:13

![PostgreSQL1.png](https://github.com/tsteplova/devops-netology/blob/fix/PostgreSQL1.png?raw=true)

………..

docker exec -ti v_post bash

psql -U postgres

![PostgreSQL2.png](https://github.com/tsteplova/devops-netology/blob/fix/PostgreSQL2.png?raw=true)

- вывода списка БД 

postgres=# \l

![PostgreSQL3.png](https://github.com/tsteplova/devops-netology/blob/fix/PostgreSQL3.png?raw=true)

- подключение к БД:

![PostgreSQL4.png](https://github.com/tsteplova/devops-netology/blob/fix/PostgreSQL4.png?raw=true)

- вывода списка таблиц
- вывода описания содержимого     таблиц
- выхода из psql

![PostgreSQL5.png](https://github.com/tsteplova/devops-netology/blob/fix/PostgreSQL5.png?raw=true)

![PostgreSQL6.png](https://github.com/tsteplova/devops-netology/blob/fix/PostgreSQL6.png?raw=true)

------

> #### Задача 2
>
> Используя `psql` создайте БД `test_database`.
>
> Изучите [бэкап БД](https://github.com/netology-code/virt-homeworks/tree/master/06-db-04-postgresql/test_data).
>
> Восстановите бэкап БД в `test_database`.

![PostgreSQL7.png](https://github.com/tsteplova/devops-netology/blob/fix/PostgreSQL7.png?raw=true)

![PostgreSQL8.png](https://github.com/tsteplova/devops-netology/blob/fix/PostgreSQL8.png?raw=true)

……….

![PostgreSQL9.png](https://github.com/tsteplova/devops-netology/blob/fix/PostgreSQL9.png?raw=true)

> Перейдите в управляющую консоль `psql` внутри контейнера.
>
> Подключитесь к восстановленной БД и проведите операцию ANALYZE для сбора статистики по таблице.
>
> Используя таблицу [pg_stats](https://postgrespro.ru/docs/postgresql/12/view-pg-stats), найдите столбец таблицы `orders` с наибольшим средним значением размера элементов в байтах.
>
> **Приведите в ответе** команду, которую вы использовали для вычисления и полученный результат.

![PostgreSQL10.png](https://github.com/tsteplova/devops-netology/blob/fix/PostgreSQL10.png?raw=true)

--------

> #### Задача 3
>
> Архитектор и администратор БД выяснили, что ваша таблица orders разрослась до невиданных размеров и поиск по ней занимает долгое время. Вам, как успешному выпускнику курсов DevOps в нетологии предложили провести разбиение таблицы на 2 (шардировать на orders_1 - price>499 и orders_2 - price<=499).
>
> Предложите SQL-транзакцию для проведения данной операции.
>
> Можно ли было изначально исключить "ручное" разбиение при проектировании таблицы orders?

Переименовываем старую таблицу и создаем новую 

![PostgreSQL11.png](https://github.com/tsteplova/devops-netology/blob/fix/PostgreSQL11.png?raw=true)

Можно ли было изначально исключить "ручное" разбиение при проектировании таблицы orders?

При изначальном проектировании таблиц можно было сделать ее секционирование (разбиение одной большой логической таблицы на несколько меньших физических секций)

--------

> #### Задача 4
>
> Используя утилиту `pg_dump` создайте бекап БД `test_database`.
>
> Как бы вы доработали бэкап-файл, чтобы добавить уникальность значения столбца `title` для таблиц `test_database`?

Используя утилиту `pg_dump` создайте бекап БД `test_database`.

pg_dump -U postgres -d test_database > /var/lib/postgresql/data/ test_database_dump.sql

![PostgreSQL12.png](https://github.com/tsteplova/devops-netology/blob/fix/PostgreSQL12.png?raw=true)

Как бы вы доработали бэкап-файл, чтобы добавить уникальность значения столбца `title` для таблиц `test_database`?

можно добавить индекс

```
CREATE INDEX ON orders ((lower(title)));
```

