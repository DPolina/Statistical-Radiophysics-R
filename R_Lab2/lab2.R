# 1. Загрузить файл с данными data.csv;

risk <- read.csv("Risk.csv")

# 2. Просмотреть структуру данных с помощью функций head() или View(). Результат 
# с описанием структуры данных включить в отчёт;

head(risk)
View(risk)

# 3. Загрузить библиотеку RColorBrew и создать цветовую палитру (палитра Set2 с 3 цветами);

library(RColorBrewer)
palette <- brewer.pal(3, "Set2")

# 4. Преобразовать категориальные признаки в фактор; Преобразование их в факторы 
# необходимо для многих методов машинного обучения, так как они позволяют правильно 
# обрабатывать категориальные данные.

risk$Gender <- as.factor(risk$Gender)
risk$State <- as.factor(risk$State)
risk$Risk<- as.factor(risk$Risk)

# 5. Визуализировать данные в виде цветной матрицы рассеивания, применив 
# созданную палитру;

plot( 
  x = risk[1:8],  
  col = palette[as.numeric(risk$Risk)], 
  pch = 10)
                                                                
# 6. Создать диаграмму рассеивания возраста от BMI, используя созданную палитру.
# Цвет точек на графике соответствует уровню риска, что позволяет визуально оценить, 
# есть ли какая-то связь между этими переменными и уровнем риска.

plot( 
  x = risk$BMI,  
  y = risk$Age,  
  col = palette[as.numeric(risk$Risk)], 
  pch = 19) 
legend( 
  x = "topright", 
  legend = levels(risk$Risk), 
  col = palette, 
  pch = 16 
)

# 7. Для функции set.seed() установить аргумент, равный 42. Объяснить для чего 
# используется данная функция в работе; (Установка начального значения для 
# генератора случайных чисел).

set.seed(42)
# Функция set.seed() используется для того, чтобы результаты анализа были воспроизводимы. 
# Если мы запустим этот код несколько раз, результаты будут одинаковыми, так как 
# генератор случайных чисел будет всегда начинать с одного и того же значения.

# Разделение данных

# 8. Создать индексы для обучающей и тестовой выборок с помощью функции 
# createDataPartition(), с параметрами p=0.8 и list=FALSE; Загрузить пакет caret;

# Обучающая выборка используется для обучения модели, а тестовая — для оценки 
# ее качества. Функция createDataPartition() случайным образом выбирает индексы 
# для каждой выборки.

library(caret)
indexes <- createDataPartition(risk$Risk, p = 0.8, list = FALSE)

# 9. Используя созданные индексы создать обучающую и тестовую выборки;

train <- risk[indexes, ]
test <- risk[-indexes, ]

# 10. Определить количество строк в обучающей и тестовой выборках с помощью 
# функции nrow();

nrow(train)
nrow(test)

# 12. Обучить модель методом k-ближайших соседей, используя при этом формулу 
# data~Age+BMI+Gender+State.Rate. Объяснить выбранное количество соседей?

knnModel <- knn3(
  formula = Risk ~ Age + BMI + Gender + State.Rate,
  data = train,
  k = 3
)

# 13. Спрогнозировать результаты модели на основе тестовой выборки. 

knnPredictions <- predict(
  object = knnModel, 
  newdata = test, 
  type = "class")

table( 
  x = knnPredictions,  
  y = test$Risk) 

# 14. Создать матрицу ошибок и вывести результаты. Какова точность модели?

knnMatrix <- confusionMatrix(
  data = knnPredictions, 
  reference = test$Risk)
print(knnMatrix)

# 15. Загрузить библиотеку для классификации с помощью деревьев решений;

library(tree) 

# 16. Обучить модель, используя следующую формулу data ~ Age + BMI + Gender +
#   State.Rate;

treeModel <- tree(
  formula = Risk ~ Age + BMI + Gender + State.Rate, 
  data = train, 
  method = "class")

summary(treeModel)

# 17. Визуализировать данную модель;

plot(treeModel) 
text(treeModel) 

# 18. Построить дерево модели;
# 19. Спрогнозировать результаты модели на основе тестовой выборки;

treePredictions <- predict(
  object = treeModel, 
  newdata = test, 
  type = "class")

# 20. Создать матрицу ошибок;

treeMatrix <- confusionMatrix(
  data = treePredictions, 
  reference = test$Risk)

# 21. Вывести результаты. Какова точность модели?

print(treeMatrix)

# 22. Загрузить пакет для классификации с помощью нейронных сетей;

library(nnet)

# 23. Обучить модель, используя формулу data ~ Age + BMI + Gender + State.Rate и 
# следующие параметры: size = 10, decay = 0.00001, maxit = 500;

neuralModel <- nnet( 
  formula = Risk ~ Age + BMI + Gender + State.Rate, 
  data = train, 
  size = 10, 
  decay = 0.00001, 
  maxit = 500)

# 24. Визуализировать модель;
# 25. Загрузить библиотеку для NeuralNetTools визуализации нейронной сети;

library(NeuralNetTools) 

# 26. Построить модель нейронной сети;

plotnet(neuralModel, alpha = 0.5)

# 27. Спрогнозировать результаты модели на основе тестовой выборки;

neuralPredictions <- predict( 
  object = neuralModel, 
  newdata = test[, 1:8], 
  type = "class")

# 28. Создать матрицу ошибок;

neuralMatrix <- confusionMatrix( 
  data = as.factor(neuralPredictions),  
  reference = test$Risk) 
  print(neuralMatrix)

# 29. Вывести результаты модели. Какова точность модели?
  
  print(knnMatrix$overall[1]) 
  print(treeMatrix$overall[1])
  print(neuralMatrix$overall[1])
  
# 30. Сравнить результаты рассмотренных классификаторов и выбрать лучший.