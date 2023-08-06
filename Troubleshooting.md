### Домашнее задание к занятию "6.6. Troubleshooting"

#### Задача 1

> Перед выполнением задания ознакомьтесь с документацией по [администрированию MongoDB](https://docs.mongodb.com/manual/administration/).
>
> <p align="justify"> Пользователь (разработчик) написал в канал поддержки, что у него уже 3 минуты происходит CRUD операция в MongoDB и её нужно прервать.
>
> <p align="justify"> Вы как инженер поддержки решили произвести данную операцию:
>
> - <p align="justify"> напишите список операций, которые вы будете производить для остановки запроса пользователя

<p align="justify"> С помощью db.currentOp() получаю текущий идентификатор операции. Увидим что то вроде этого</p>

\> db.currentOp()

​     {

​       "inprog" : [

​         {

​           "opid" :  <opId>,

​           "active" : true,

​           //...

​         }

​       ]

​     }

Завершаю принудительно

db.killOp(<opId>)

> * <p align="justify"> предложите вариант решения проблемы с долгими (зависающими) запросами в MongoDB.</p>

<p align="justify"> Можно воспользоваться процедурой maxTimeMS.  Метод maxTimeMS() устанавливает ограничение по времени для операции. Когда операция достигает указанного ограничения по времени, MongoDB прерывает операцию в следующей точке прерывания. Запрос завершается.</p>

<p align="justify"> Воспользоваться настройкой профилировщика базы данных для собирания подробной информации о командах базы данных, тем самым можно попробовать отловить медленные запросы, изучить их с помощью explain и попробовать оптимизировать: денормализовать данные, добавить/удалить индексы, настроить шардинг и т.д.</p>

------

#### Задача 2

> Перед выполнением задания познакомьтесь с документацией по [Redis latency troobleshooting](https://redis.io/topics/latency).
>
> <p align="justify"> Вы запустили инстанс Redis для использования совместно с сервисом, который использует механизм TTL. Причем отношение количества записанных key-value значений к количеству истёкших значений есть величина постоянная и увеличивается пропорционально количеству реплик сервиса.
>
> <p align="justify"> При масштабировании сервиса до N реплик вы увидели, что:
>
> - сначала рост отношения записанных значений к истекшим
> - Redis блокирует операции записи
>
> Как вы думаете, в чем может быть проблема?

<p align="justify"> Могу предположить, что при добавлении очередной реплики, мы превысили лимит памяти maxmemory, в этом случае Redis отвечает ошибкой записи.</p>

<p align="justify"> (Что произойдет, если в Redis закончится память? Redis либо будет уничтожен убийцей ядра Linux, либо выйдет из строя с ошибкой, либо начнет замедляться. В современных операционных системах функция malloc(), возвращающая значение NULL, встречается нечасто, обычно сервер начинает выполнять подкачку (если настроено некоторое пространство подкачки), и производительность Redis начнет снижаться, так что мы, вероятно, заметим, что что-то не так.)</p>

------

#### Задача 3

> Перед выполнением задания познакомьтесь с документацией по [Common Mysql errors](https://dev.mysql.com/doc/refman/8.0/en/common-errors.html).
>
> Вы подняли базу данных MySQL для использования в гис-системе. При росте количества записей, в таблицах базы, пользователи начали жаловаться на ошибки вида:
>
> ```
> InterfaceError: (InterfaceError) 2013: Lost connection to MySQL server during query u'SELECT..... '
> ```
>
> Как вы думаете, почему это начало происходить и как локализовать проблему?

<p align="justify"> Потеряно соединение с сервером MySQL. Существует три вероятные причины появления этого сообщения об ошибке.</p>

- <p align="justify"> Обычно это     указывает на проблемы с сетевым подключением, и нам следует проверить     состояние сети, если эта ошибка возникает часто. Если сообщение об ошибке     содержит “during query”, вероятно, это тот     случай, с которым мы столкнулись.</p>

- <p align="justify"> Иногда     форма “during query” возникает, когда миллионы     строк отправляются как часть одного или нескольких запросов. Если мы знаем,     что это происходит, нам следует попробовать увеличить net_read_timeout с     значения по умолчанию 30 секунд до 60 секунд или дольше, достаточного для     завершения передачи данных.</p>

- <p align="justify"> Когда     клиент пытается установить первоначальное соединение с сервером. В этом     случае, если наше значение connect_timeout установлено всего на несколько     секунд, мы можете решить проблему, увеличив его до десяти секунд,     возможно, больше, если у нас очень большое расстояние или медленное     соединение. Мы можете определить, сталкиваемся ли мы с этой более     необычной причиной, используя `SHOW GLOBAL STATUS LIKE     'Aborted_connects'`. Он увеличивается на единицу при каждой     первоначальной попытке подключения, которую прерывает сервер.</p>

<p align="justify"> Если причина не является ни одной из выше перечисленных, возможно, у нас возникла проблема со значениями больших двоичных объектов, которые больше max_allowed_packet, что может вызвать эту ошибку у некоторых клиентов. Иногда мы можете увидеть ошибку ER_NET_PACKET_TOO_LARGE, и это подтверждает, что нам необходимо увеличить max_allowed_packet.</p>

> Какие пути решения данной проблемы вы можете предложить?

Необходимо исправить все перечисленные параметры:

- <p align="justify"> Увеличить на сервере MySQL wait_timeout,     max_allowed_packet, net_write_timeout и net_read_timeout</p>

- <p align="justify"> В SQLAlchemy уменьшить pool_recycle, сделать меньше wait_timeout</p>

<p align="justify"> Если ошибка пропадёт, возвращать по одному в исходное состояние, так должно получиться локализовать проблему.</p>

<p align="justify"> Возможно достаточно будет оптимизировать запросы. Их можно найти, включив slow_query_log и настроить параметр long_query_time на значение близкое к net_write_timeout и net_read_timeout.</p>

<p align="justify"> Если проблема происходит только на SELECT, вероятно изменения таймаутов и оптимизации запросов будет достаточно. Если ещё на insert - возможно, наоборот, нужно удалить часть индексов.</p>

------

#### Задача 4

> Перед выполнением задания ознакомтесь со статьей [Common PostgreSQL errors](https://www.percona.com/blog/2020/06/05/10-common-postgresql-errors/) из блога Percona.
>
> <p align="justify"> Вы решили перевести гис-систему из задачи 3 на PostgreSQL, так как прочитали в документации, что эта СУБД работает с большим объемом данных лучше, чем MySQL.</p>
>
> <p align="justify"> После запуска пользователи начали жаловаться, что СУБД время от времени становится недоступной. В dmesg вы видите, что:</p>
>
> ```
> postmaster invoked oom-killer
> ```
>
> Как вы думаете, что происходит?
>
> Как бы вы решили данную проблему?

<p align="justify"> Не хватает памяти. Когда у сервера или процесса заканчивается память, Linux предлагает 2 пути решения: обрушить всю систему или завершить процесс (приложение), который съедает память. Лучше, конечно, завершить процесс и спасти ОС от аварийного завершения. Out-Of-Memory Killer — это процесс, который завершает приложение, чтобы спасти ядро от сбоя. Он жертвует приложением, чтобы сохранить работу ОС.</p>

Решить данную проблему можно:

- повлиять на OOM Killer —  использовать [vm.overcommit_memory](http://catap.ru/blog/2009/05/05/about-memory-overcommit-memory/);
- vm.oom_dump_tasks   —   делать    dump    всех    процессов    за исключением kernel threads, в dump попадает pid, uid, tgid, vm size,     rss, cpu и oom_adj. Имеет смысл включать только для отладки OOM Killer;
- vm.oom_kill_allocating_task — убивать процесс, процесс  которому не хватило памяти, без выбора самого плохого;
- vm.panic_on_oom — считать запуск OOM  критической ошибкой.
