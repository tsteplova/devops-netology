### Домашнее задание к занятию "7.5. Основы golang"

> С `golang` в рамках курса, мы будем работать не много, поэтому можно использовать любой IDE. Но рекомендуем ознакомиться с [GoLand](https://www.jetbrains.com/ru-ru/go/).
>
> ## 
>
> #### Задача 1. Установите golang.
>
> 1. Воспользуйтесь инструкций с официального сайта: https://golang.org/.
> 2. Так же для тестирования кода можно использовать песочницу: https://play.golang.org/.

![go.png](https://github.com/tsteplova/devops-netology/blob/fix/Golang/png/go.png?raw=true)

> #### Задача 2. Знакомство с gotour.
>
> У Golang есть обучающая интерактивная консоль https://tour.golang.org/. Рекомендуется изучить максимальное количество примеров. В консоли уже написан необходимый код, осталось только с ним ознакомиться и поэкспериментировать как написано в инструкции в левой части экрана.
>
> ##
>
> #### Задача 3. Написание кода.
>
> Цель этого задания закрепить знания о базовом синтаксисе языка. Можно использовать редактор кода на своем компьютере, либо использовать песочницу: https://play.golang.org/.
>
> 1. Напишите программу для перевода метров в футы (1 фут = 0.3048 метр). Можно запросить исходные данные у пользователя, а можно статически задать в коде. Для взаимодействия с пользователем можно использовать функцию `Scanf`:
>
>    ```
>    package main
>       
>    import "fmt"
>       
>    func main() {
>        fmt.Print("Enter a number: ")
>        var input float64
>        fmt.Scanf("%f", &input)
>       
>        output := input * 2
>       
>        fmt.Println(output)    
>    }
>    ```

![go_1.png](https://github.com/tsteplova/devops-netology/blob/fix/Golang/png/go_1.png?raw=true)

> 2. Напишите программу, которая найдет наименьший элемент в любом заданном списке, например:
>
> ```
> x := []int{48,96,86,68,57,82,63,70,37,34,83,27,19,97,9,17,}
> ```

![go_2.png](https://github.com/tsteplova/devops-netology/blob/fix/Golang/png/go_2.png?raw=true)

> 3. Напишите программу, которая выводит числа от 1 до 100, которые делятся на 3. То есть `(3, 6, 9, …)`.

![go_3.png](https://github.com/tsteplova/devops-netology/blob/fix/Golang/png/go_3.png?raw=true)