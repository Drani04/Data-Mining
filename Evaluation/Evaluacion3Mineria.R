setwd("C:/Users/Daniel/Desktop/mineria drive")

#importamos los paquetes necesarios
install.packages('caTools')
library(caTools)
install.packages('e1071')
library(e1071)

dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

#transformamos los datos en factor para poder implementarlos
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
dataset

#dividimos nuestro dataset en entrenamiento y testeo en este caso 60% y 40%
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.60)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Ajustamos el rango de los datos en -3 para el entrenamiento y testeo de los datos
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

#implementamos el algoritmo de naivebayes ajustando nuestros parametros
                 #en funcion de todos los datos     60% de los datos   tipo clasificatorio    nucleo de tipo lineal
classifier = naiveBayes(formula = Purchased ~ .,data = training_set,type = 'C-classification',kernel = 'linear')

#                                       raw= devuelve las probabilidades condicionales, 
classifier = naiveBayes(formula = Purchased ~ .,data = training_set,type = 'raw', laplace=4)
?naiveBayes

#1,-1 .1 +1
#2,-2.2+1
#visualizamos nuestro modelo de entrenamiento con el 60% de los datos
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 2, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)

plot(set[, -3], main = 'naive Bayes (Training Set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))

#Diseño
#insertamos parabola
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)

#aplicamos color a la grafica separando la parabola del fondo
points(grid_set, pch = '.', col = ifelse(y_grid == 1, '#F7FE2E', '#FFBF00'))

#aplicamos color a los puntos
points(set, pch = 22, bg = ifelse(set[, 3] == 1, '#0000FF', '#FF0000'))
?points


#testeo de modelo con el 40% de los datos
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)

plot(set[, -3], main = 'naive Bayes (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, '#F7FE2E', '#FFBF00'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, '#0000FF', '#FF0000'))

