### Домашнее задание к занятию "5.5. Оркестрация кластером Docker контейнеров на примере Docker Swarm"

#### Задача 1

Дайте письменные ответы на следующие вопросы:

> **В чём отличие режимов работы сервисов в Docker Swarm кластере: replication и global?**

+ **Replication** - приложение запускается в том количестве экземпляров, которое мы укажем.

+ **Global –** приложение запускается на каждой ноде в единственном экземпляре.

> **Какой алгоритм выбора лидера используется в Docker Swarm кластере?**

<p align="justify"> В Docker Swarm кластере используется алгоритм Raft.Raft реализуется поверх кластера однообразных слабо связных нод, на каждой из которой работает машина состояний. Raft обеспечивает надёжную доставку сигналов на все ноды в заданном порядке. Таким образом обеспечивается переход всех машин состояний по одним и тем же последовательностям состояний. Таким образом, каждая нода гарантированно приходит в согласие с другими нодами.</p>

> **Что такое Overlay Network?**

<p align="justify"> Overlay-сеть — это сеть для соединения несколько демонов Docker между собой и которые позволяют docker-swarm службам взаимодействовать друг с другом. Overlay-сеть использует технологию vxlan. При помощи этого действия Docker создает виртуальные сети поверх существующих связей между хостами, которые могут оказаться внутри одной подсети. Любые точки, которые являются частью этой виртуальной сети, выглядят друг для друга так, будто они связаны поверх свича и не заботятся об устройстве основной физической сети.</p>

### Задача 2

Создать ваш первый Docker Swarm кластер в Яндекс.Облаке

Для получения зачета, вам необходимо предоставить скриншот из терминала (консоли), с выводом команды:

```
docker node ls
```

![](https://github.com/tsteplova/devops-netology/blob/fix/swarm1.png?raw=true)

### Задача 3

Создать ваш первый Docker Swarm кластер в Яндекс.Облаке

Для получения зачета, вам необходимо предоставить скриншот из терминала (консоли), с выводом команды:

```
docker service ls
```

![](https://github.com/tsteplova/devops-netology/blob/fix/swarm2.png?raw=true)