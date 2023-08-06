### Домашнее задание к занятию "6.2. SQL"

#### Задача 1

> Используя docker поднимите инстанс PostgreSQL (версию 12) c 2 volume, в который будут складываться данные БД и бэкапы.
>
> Приведите получившуюся команду или docker-compose манифест.

![SQL.png](https://github.com/tsteplova/devops-netology/blob/fix/SQL/png/SQL.png?raw=true)

![SQL1.png](https://github.com/tsteplova/devops-netology/blob/fix/SQL/png/SQL1.png?raw=true)

#### Задача 2

> В БД из задачи 1:
>
> - создайте пользователя test-admin-user и БД test_db
> - в БД test_db создайте таблицу orders и clients (спeцификация таблиц ниже)
> - предоставьте привилегии на все операции пользователю test-admin-user на таблицы БД test_db
> - создайте пользователя test-simple-user
> - предоставьте пользователю test-simple-user права на SELECT/INSERT/UPDATE/DELETE данных таблиц БД test_db

![SQL9.png](https://github.com/tsteplova/devops-netology/blob/fix/SQL/png/SQL9.png?raw=true)

![SQL4.png](https://github.com/tsteplova/devops-netology/blob/fix/SQL/png/SQL4.png?raw=true)

> Таблица orders:
>
> - id (serial primary key)
> - наименование (string)
> - цена (integer)

> Таблица clients:
>
> - id (serial primary key)
> - фамилия (string)
> - страна проживания (string, index)
> - заказ (foreign key orders)

![SQL3.png](https://github.com/tsteplova/devops-netology/blob/fix/SQL/png/SQL3.png?raw=true)

> Приведите:
>
> - итоговый список БД после выполнения пунктов выше,
> - описание таблиц (describe)
> - SQL-запрос для выдачи списка пользователей с правами над таблицами test_db
> - список пользователей с правами над таблицами test_db

![SQL5.png](https://github.com/tsteplova/devops-netology/blob/fix/SQL/png/SQL5.png?raw=true)

#### Задача 3

> Используя SQL синтаксис - наполните таблицы следующими тестовыми данными:
>
> Таблица orders
>
> | Наименование | цена |
> | ------------ | ---- |
> | Шоколад      | 10   |
> | Принтер      | 3000 |
> | Книга        | 500  |
> | Монитор      | 7000 |
> | Гитара       | 4000 |

​     insert into orders VALUES (1, 'Шоколад', 10), (2, 'Принтер', 3000), (3, 'Книга', 500), (4, 'Монитор', 7000), (5, 'Гитара', 4000);

![SQL10.png](https://github.com/tsteplova/devops-netology/blob/fix/SQL/png/SQL10.png?raw=true)

> Таблица clients
>
> | ФИО                  | Страна проживания |
> | -------------------- | ----------------- |
> | Иванов Иван Иванович | USA               |
> | Петров Петр Петрович | Canada            |
> | Иоганн Себастьян Бах | Japan             |
> | Ронни Джеймс Дио     | Russia            |
> | Ritchie Blackmore    | Russia            |

​     insert into clients VALUES (1, 'Иванов Иван Иванович', 'USA'), (2, 'Петров Петр Петрович', 'Canada'), (3, 'Иоганн Себастьян Бах', 'Japan'), (4, 'Ронни Джеймс Дио', 'Russia'), (5, 'Ritchie Blackmore', 'Russia');

![SQL11.png](https://github.com/tsteplova/devops-netology/blob/fix/SQL/png/SQL11.png?raw=true)

> Используя SQL синтаксис:
>
> - вычислите количество записей для каждой таблицы
> - приведите в ответе:
>   - запросы
>   - результаты их выполнения.

![SQL12.png](https://github.com/tsteplova/devops-netology/blob/fix/SQL/png/SQL12.png?raw=true)

#### Задача 4

> Часть пользователей из таблицы clients решили оформить заказы из таблицы orders.
>
> Используя foreign keys свяжите записи из таблиц, согласно таблице:
>
> | ФИО                  | Заказ   |
> | -------------------- | ------- |
> | Иванов Иван Иванович | Книга   |
> | Петров Петр Петрович | Монитор |
> | Иоганн Себастьян Бах | Гитара  |
>
> Приведите SQL-запросы для выполнения данных операций.
>
> Приведите SQL-запрос для выдачи всех пользователей, которые совершили заказ, а также вывод данного запроса.
>
> Подсказк - используйте директиву `UPDATE`.

![SQL13.png](https://github.com/tsteplova/devops-netology/blob/fix/SQL/png/SQL13.png?raw=true)

​      также можно по-другому, результат тот же

![SQL7.png](https://github.com/tsteplova/devops-netology/blob/fix/SQL/png/SQL7.png?raw=true)

#### Задача 5

> Получите полную информацию по выполнению запроса выдачи всех пользователей из задачи 4 (используя директиву EXPLAIN).
>
> Приведите получившийся результат и объясните что значат полученные значения.

![SQL15.png](https://github.com/tsteplova/devops-netology/blob/fix/SQL/png/SQL15.png?raw=true)

Происходит чтение данных из таблиц:

<p align="justify"> Вначале последовательное, блок за блокам, чтение данных таблицы orders для неё будет создан хэш, после будет чтение clients.</p>

<p align="justify"> cost - первое значение `0.00` — затраты на получение первой строки, второе — затраты на получение всех строк. `rows` — приблизительное количество возвращаемых строк при выполнении операции `Seq Scan. width` — средний размер одной строки в байтах.</p>







