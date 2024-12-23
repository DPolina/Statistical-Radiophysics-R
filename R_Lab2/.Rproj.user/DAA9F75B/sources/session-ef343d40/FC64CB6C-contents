# 1: Создание логической переменной
a <- TRUE
print(a)

# 2: Создание целочисленной переменной
n <- 13
print(n)

# 3: Создание нецелочисленной переменной
fl <- 13.1
print(fl)

# 4: Создание переменной типа string
str <- "Hello, world!"
print(str)

# 5: Создание вектора
v <- c(1,2,3,4,5)
print(v)

# 6: Создание последовательности из 20 чисел
s <- 1:20
print(s)

# 7: Создание вектора, содержащего случайные числа в диапазоне от -5 до 15
r <- sample(-5:15, 20)
print(r)
 
# 8: Выводим значения вектора r
r1 <- r[r > 1 & r < 10]
print(r1)

# 9: Выводим максимальное и минимальное значения вектора r
r_max <- max(r)
r_min <- min(r)
print(paste("MAX:", r_max, " MIN:", r_min))

# 10: Создаем последовательность с диапазоном изменения от -15 до 15 и шагом 0.01;
s <- seq(-15, 15, 0.01)
print(s)

# 11: Создание функции
f <- function(x) 
{
  5 * sin(x^2)
}
print(f(1))

# 12: Строим график
plot(s, f(s), 
     type = "l", 
     col = "blue", 
     lty = 1, 
     pch = 15)

# type: Определяет тип графика
  # "p": Точки
  # "l": Линия
  # "b": И точки, и линия
  # "o": Точки поверх линии
  # "h": Гистограмма
  # "s": Ступенчатая кривая
# lty: Определяет тип линии. Некоторые значения:
#   1: Сплошная линия
#   2: Пунктирная линия
#   3: Пунктирно-штриховая линия
#   4: Штриховая линия

# 13: Строим трехмерный график поверхности
xs <- seq(-5, 5, 0.2)
ys <- seq(-5, 5, 0.2)
f1 <- function(x, y)
{
  (x / 2) * exp(-((x^2 + y^2) / 2))
}
z <- outer(xs, ys, f1)
persp(xs, ys, z,
      theta = 30, 
      phi = 15,
      col = "springgreen",
      shade = 0.5,
      ticktype='detailed',
      nticks=3)

# theta: Угол поворота графика вокруг вертикальной оси (в градусах). В данном случае равен 30.
# phi: Угол наклона графика относительно горизонтальной плоскости (в градусах). В данном случае равен 15.
# col: Цвет поверхности. В данном случае используется цвет "springgreen".
# shade: Уровень затенения поверхности (от 0 до 1). Значение 0.5 означает умеренное затенение.
# ticktype: Тип отображения меток на осях. "detailed" означает, что метки будут подробными.
# nticks: Количество меток на каждой оси. Здесь установлено на 3.

# 14: Создаем матрицу, заполненную последовательностью от 1 до 100.
m <- matrix(data = 1:100, nrow = 10, ncol = 10)
print(m)

# 15: Определяем число строк и столбцов матрицы
rows <- nrow(m)
cols <- ncol(m)
print(paste(rows, " x ", cols))

# 16: Создаем массив, заполненный последовательностью от 1 до 30, и разбитый на 3 части по 10 значений. 
arr <- array(data = 1:30, dim = c(10, 1, 3))
print(arr)

# 17: Создание и вывод списка
L <- list(
  l1 = TRUE,
  l2 = 42L,
  l3 = 3.14,
  l4 = "Hello, world"
)
print(L)

# 18: Создание вектора и фактора
string_vector <- c("apple", "banana", "potato", "apple", "banana", "potato", "cucumber", "cucumber", "pumpkin", "pumpkin")
string_factor <- factor(string_vector)
print(string_factor)

# 19: Вывод уровней фактора
factor_levels <- levels(string_factor)
print(factor_levels)

# 20: Сравнение функций table() и unclass()
factor_table <- table(string_factor)
print(factor_table)
unclass_factor <- unclass(string_factor)
print(unclass_factor)

# 21: Создание и вывод фрейма данных
transport_data <- data.frame(
  Vehicle = c("Car", "Bike", "Bus", "Truck", "Scooter", "Train", "Boat"),
  Wheels = c(4, 2, 4, 6, 2, 16, 0),
  Electric = c(FALSE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE),
  Capacity = c(5, 1, 50, 2, 2, 200, 20)
)
print(transport_data)

# 22: Вывод последнего значения из последнего столбца
last_value <- transport_data[nrow(transport_data), ncol(transport_data)]
print(last_value)

# 23: Вывод первой и последней строки фрейма данных
first_row <- transport_data[1, ]
print(first_row)
last_row <- transport_data[nrow(transport_data), ]
print(last_row)

# 24: Вывод столбца по имени
wheels_column <- transport_data[["Wheels"]]
print(wheels_column)

# 25: Вывод столбца в сокращенной форме
wheels_column_short <- transport_data$Wheels
print(wheels_column_short)

# 26: Подмножество четных строк
even_rows <- transport_data[seq(1, nrow(transport_data), by = 2), ]
print(even_rows)

# 27: Подмножество четных столбцов
even_columns <- transport_data[, seq(2, ncol(transport_data), by = 2)]
print(even_columns)

# 28: Подмножество первых 4 строк
first_four_rows <- transport_data[1:4, ]
print(first_four_rows)

# 29: Подмножество строк с условием
electric_vehicles <- transport_data[transport_data$Electric == TRUE, ]
print(electric_vehicles)

# 30: Подмножество строк с оператором соответствия
selected_vehicles <- transport_data[transport_data$Vehicle %in% c("Car", "Bike"), ]
print(selected_vehicles)