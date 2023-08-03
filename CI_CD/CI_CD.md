### Домашнее задание к занятию "09.02 CI\CD"

> **Знакомоство с SonarQube**
>
> **Подготовка к выполнению**
>
> 1. Выполняем docker pull sonarqube:8.7-community

![CI_CD_1.png](https://github.com/tsteplova/devops-netology/blob/fix/CI_CD/png/CI_CD_1.png?raw=true)

> 2. Выполняем docker     run -d --name sonarqube -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true -p     9000:9000 sonarqube:8.7-community

![CI_CD_2.png](https://github.com/tsteplova/devops-netology/blob/fix/CI_CD/png/CI_CD_2.png?raw=true)

> 3. Ждём запуск, смотрим логи через docker logs -f sonarqube

![CI_CD_3.png](https://github.com/tsteplova/devops-netology/blob/fix/CI_CD/png/CI_CD_3.png?raw=true)

> 4. Проверяем готовность сервиса     через [браузер](http://localhost:9000)
>
> 5. Заходим под admin\admin, меняем     пароль на свой
>
> В целом, в [этой статье](https://docs.sonarqube.org/latest/setup/install-server/) описаны все варианты установки, включая и docker, но так как нам он нужен разово, то достаточно того набора действий, который я указал выше.
>
> **Основная часть**
>
> 1. Создаём новый проект, название     произвольное
>
> 2. Скачиваем пакет sonar-scanner, который нам предлагает скачать сам sonarqube

![CI_CD_20.png](https://github.com/tsteplova/devops-netology/blob/fix/CI_CD/png/CI_CD_20.png?raw=true)

> 3. Делаем так, чтобы binary был     доступен через вызов в shell (или меняем переменную PATH или любой другой     удобный вам способ)
>
> 4. Проверяем sonar-scanner –version

![CI_CD_21.png](https://github.com/tsteplova/devops-netology/blob/fix/CI_CD/png/CI_CD_21.png?raw=true)

> 5. Запускаем анализатор против кода из директории [example](https://github.com/netology-code/mnt-homeworks/blob/master/09-ci-02-cicd/example) с дополнительным ключом -Dsonar.coverage.exclusions=fail.py

![CI_CD_22.png](https://github.com/tsteplova/devops-netology/blob/fix/CI_CD/png/CI_CD_22.png?raw=true)

> 6. Смотрим результат в интерфейсе

![CI_CD_7.png](https://github.com/tsteplova/devops-netology/blob/fix/CI_CD/png/CI_CD_7.png?raw=true)

> 7. Исправляем ошибки, которые он     выявил(включая warnings)
>
> 8. Запускаем анализатор повторно - проверяем, что QG пройдены успешно

![CI_CD_23.png](https://github.com/tsteplova/devops-netology/blob/fix/CI_CD/png/CI_CD_23.png?raw=true)

> 9. Делаем скриншот успешного прохождения анализа, прикладываем к решению ДЗ

![CI_CD_9.png](https://github.com/tsteplova/devops-netology/blob/fix/CI_CD/png/CI_CD_9.png?raw=true)

> **Знакомство с Nexus**
>
> **Подготовка к выполнению**
>
> 1. Выполняем docker pull sonatype/nexus3

![CI_CD_24.png](https://github.com/tsteplova/devops-netology/blob/fix/CI_CD/png/CI_CD_24.png?raw=true)

> 2. Выполняем docker run -d -p 8081:8081 --name nexus sonatype/nexus3

![CI_CD_25.png](https://github.com/tsteplova/devops-netology/blob/fix/CI_CD/png/CI_CD_25.png?raw=true)

> 3. Ждём запуск, смотрим логи через docker logs -f nexus

![CI_CD_26.png](https://github.com/tsteplova/devops-netology/blob/fix/CI_CD/png/CI_CD_26.png?raw=true)

> 4. Проверяем готовность сервиса     через [бразуер](http://localhost:8081)
>
> 5. Узнаём пароль от admin через docker exec -it nexus /bin/bash

![CI_CD_27.png](https://github.com/tsteplova/devops-netology/blob/fix/CI_CD/png/CI_CD_27.png?raw=true)

> 6. Подключаемся под админом, меняем пароль, сохраняем анонимный доступ

![CI_CD_14.png](https://github.com/tsteplova/devops-netology/blob/fix/CI_CD/png/CI_CD_14.png?raw=true)

> **Основная часть**
>
> 1. В репозиторий maven-public загружаем артефакт с GAV     параметрами: 
>
> 2. 1. groupId: netology
>    2. artifactId: java
>    3. version: 8_282
>    4. classifier: distrib
>    5. type: tar.gz
>
> 3. В него же загружаем такой же     артефакт, но с version: 8_102
>
> 4. Проверяем, что все файлы     загрузились успешно
>
> В ответе присылаем файл maven-metadata.xml для этого артефекта

![CI_CD_33.png](https://github.com/tsteplova/devops-netology/blob/fix/CI_CD/png/CI_CD_33.png?raw=true)

[maven-`metadata.xml`](https://github.com/tsteplova/devops-netology/blob/fix/maven-metadata.xml)

> **Знакомство с Maven**
>
> **Подготовка к выполнению**
>
> 1. Скачиваем дистрибутив с [maven](https://maven.apache.org/download.cgi)

![CI_CD_28.png](https://github.com/tsteplova/devops-netology/blob/fix/CI_CD/png/CI_CD_28.png?raw=true)

> 2. Разархивируем, делаем так,     чтобы binary был доступен через вызов в shell (или меняем переменную PATH     или любой другой удобный вам способ)
>
> 3. Проверяем mvn –version

![CI_CD_29.png](https://github.com/tsteplova/devops-netology/blob/fix/CI_CD/png/CI_CD_29.png?raw=true)

> 4. Забираем директорию [mvn](https://github.com/netology-code/mnt-homeworks/blob/master/09-ci-02-cicd/mvn) с pom
>
> **Основная часть**
>
> 1. Меняем в pom.xml блок с зависимостями под наш     артефакт из первого пункта задания для Nexus (java с версией 8_282)
>
> 2. Запускаем команду mvn package в директории с pom.xml, ожидаем успешного окончания

![CI_CD_31.png](https://github.com/tsteplova/devops-netology/blob/fix/CI_CD/png/CI_CD_31.png?raw=true)

> 3. Проверяем директорию ~/.m2/repository/, находим наш артефакт
>
> 4. В ответе присылаем исправленный файл pom.xml

![CI_CD_32.png](https://github.com/tsteplova/devops-netology/blob/fix/CI_CD/png/CI_CD_32.png?raw=true)

[pom.xml](https://github.com/tsteplova/devops-netology/blob/fix/pom.xml)