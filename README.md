# Unit 2

## Content

- Homework 1
- Homework 2
- Homework 3
- Homework 4
- Homework 5
- Homework 6
- Homework 7
- Practice 1
- Practice 2
- Practice 3
- Practice 4
- Practice 5
- Practice 6
- Evaluation
- Colaborators


## Homework 1 
### Geometric cape
The ggplot2 layers are also called geom. Once the base configuration is done, you can add the geoms on top of each other. Example: a variable X is positioned on the X axis, a variable Y is positioned on the Y axis, it uses a third variable for the color fill of the final geometric figures. In the two additional lines it is established: first, the argument geom_point () indicates that one of the geometric elements to be positioned are points, without additional configurations; second, a smoothed trend line (using a linear regression procedure) that will display the linear trend of the point cloud is positioned - using the geom_smooth command (method = lm, linetype = 2). Do not forget that after the first line, the geometry functions must be added indicating a + sign.

### Graph grammar
It means that instead of building the graph what I know how to do is describe what the components are that make it up. The basic idea is to independently specify the building blocks and combine them to create virtually any type of graphic display you want. The building blocks of a graph include:
- Data 
- Aesthetic mapping 
- Statistical transformations 
- Scales 
- Coordinate system
- Position adjustments 
- Appearance 
- Geometric object

## Homework 2
### Funcion geom_jitter()
The jitter geom is a convenient shortcut for geom_point(position = "jitter"). It adds a
small amount of random variation to the location of each point, and is a useful way of
handling overplotting caused by discreteness in smaller datasets.

 ```
geom_jitter(
 mapping = NULL,
 data = NULL,
 stat = "identity",
 position = "jitter",
 ...,
 width = NULL,
 height = NULL,
 na.rm = FALSE,
 show.legend = NA,
 inherit.aes = TRUE
)
```

## Homework 3
### P Value
A p value (probability value) is a statistical measurement between 0 and 1. The p value is used to answer a hypothesis. A hypothesis is a question that admits a yes or no, or a false or true answer.
A null hypothesis is the opposite of what our research is. A result is statistically significant (and allows the null hypothesis to be rejected) if it corresponds to a p value equal to or less than the significance level. This is usually expressed as p ≤ 0.05. A p <0.05 means that the null hypothesis is false and a p> 0.05 that the null hypothesis is true:
To calculate the p-value, it is first assumed that there really is no difference between the two theories. 
Then, if the assumption is true, the probability is calculated that the observed difference is due only to chance.
This is the p-value. Therefore, the p-value is the probability of observing effects of the same importance as those observed in the study.
If the p-value is low, the results are unlikely to be due to chance and the idea that there is no difference is rejected (the null hypothesis is rejected).
If the p-value is high, the observed difference is probably a fluke. Once the value of P has been determined, the conclusion at any particular level results from comparing the value of P with the level of significance.

## Homework 4
### Function SplitRatio() and lm()
Split data from vector Y into two sets in predefined ratio while preserving relative ratios of different labels in Y. Used to split the data used during classification into train and test subsets.
```
sample.split( Y, SplitRatio = 2/3, group = NULL )
```
lm is used to fit linear models. It can be used to carry out regression, single stratum analysis of variance and analysis of covariance (although aov may provide a more convenient interface for these).
```
lm(formula, data, subset, weights, na.action,
   method = "qr", model = TRUE, x = FALSE, y = FALSE, qr = TRUE,
   singular.ok = TRUE, contrasts = NULL, offset, …)
```

## Homework 5
### Function gml()
glm is used to fit generalized linear models, specified by giving a symbolic description of the linear predictor and a description of the error distribution.
```
glm(formula, family = gaussian, data, weights, subset,
    na.action, start = NULL, etastart, mustart, offset,
    control = list(…), model = TRUE, method = "glm.fit",
    x = FALSE, y = TRUE, singular.ok = TRUE, contrasts = NULL, …)
glm.fit(x, y, weights = rep(1, nobs),
        start = NULL, etastart = NULL, mustart = NULL,
        offset = rep(0, nobs), family = gaussian(),
        control = list(), intercept = TRUE, singular.ok = TRUE)

 S3 method for glm
weights(object, type = c("prior", "working"), …)
```
## Homework 6
### ElemStatLearn
It is a set of tools to model and understand complex data sets. It is a recently developed area in statistics and combines parallel developments in computing and, in particular, machine learning. The field encompasses many methods, such as looping and sparse regression, classification and regression trees, and reinforcement and support vector machines. It refers to a vast set of tools for understanding data. These tools can be classified as supervised or unsupervised. In general terms, supervised SL involves the construction of a statistical model to predict or estimate a product based on one or more inputs. Problems of this nature occur in fields as diverse as business, medicine, astrophysics, and public policy. With unsupervised SL, there are inputs, but there is no supervisory output; however, we can learn relationships and structure from such data.

## Homework 7
### BodyPartRecognition

## Practice 1
we specify the work area
```
setwd("C:/Users/Daniel/Desktop/Practicas R")
getwd()
```
we choose our database to use
```
dataset <- read.csv(file.choose())
dataset
```
installing caTools library
```
install.packages('caTools')
library(caTools)
```
Splitting the dataset into the Training set and Test set
```
set.seed(123)
split <- sample.split(dataset$comision, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```
Fitting Simple Linear Regression to the Training set
```
regressor = lm(formula = comision ~ Ventas,
               data = dataset)
summary(regressor)
```
Predicting the Test set results
```
y_pred = predict(regressor, newdata = test_set)
```
Visualising the Training set results
```
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$Ventas, y=training_set$comision),
             color = 'red') +
  geom_line(aes(x = training_set$Ventas, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('ventas vs comision (Training Set)') +
  xlab('Ventas') +
  ylab('Comision')
  ```
 ![img](https://github.com/Drani04/Data-Mining/blob/Unit-2/Images/img1.png) 
  
  Visualising the Test set results
  ```
  ggplot() +
  geom_point(aes(x=test_set$Ventas, y=test_set$comision),
             color = 'red') +
  geom_line(aes(x = training_set$Ventas, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('ventas vs comision (Test Set)') +
  xlab('Ventas') +
  ylab('Comision')
  ```
  ![img](https://github.com/Drani04/Data-Mining/blob/Unit-2/Images/img2.png) 
  
## Practice 2
```
setwd("C:/Users/Daniel/Desktop/Practicas R")
getwd()
```
Importing the dataset
```
dataset <- read.csv(file.choose())
```

Encoding categorical data 
```
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))
dataset
```

Splitting the dataset into the Training set and Test set
```
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```
Fitting Multiple Linear Regression to the Training set
```
#regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)
regressor = lm(formula = Profit ~ .,
               data = training_set )
summary(regressor)
```

Prediction the Test set results
```
y_pred = predict(regressor, newdata = test_set)
y_pred
```
Building the optimal model using Backward Elimination, the regression formula is declared using the following formula, returns the data summary of the function 
```
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, data = dataset ) 
summary(regressor)  
```
The regression formula is declared using the following formula, returns the summary of data of the function 
```
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend, data = dataset )
summary(regressor)  
```
The regression formula is declared using the following formula, returns the summary of data of the function
```
regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend, data = dataset )
summary(regressor)   
```
The regression formula is declared using the following formula, returns the summary of data of the function
```
regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend, data = dataset )
summary(regressor)   
```
The method for prediction is performed with 2 parameters, the result of the prediction is printed
```
y_pred = predict(regressor, newdata = test_set) 
y_pred
```

## Practice 3
1. First, we need to select a level of significance to stay in the model. (SL = 0.05)
2. Fit the complete model with all possible predictors / independent variables.
3. Choose the predictor that has the highest P value, such that, if the P value> SL, go to step 4.
4. Remove that predictor.
5. Reconstruct and fit the model with the remaining variables.
```
backwardElimination <- function(x, sl) {  
  numVars = length(x) 
  for (i in c(1:numVars)){ 
    regressor = lm(formula = Profit ~ ., data = x) 
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    numVars = numVars - 1
  }
  return(summary(regressor))
}

SL = 0.05 #nivel de significancia
#dataset = dataset[, c(1,2,3,4,5)]
training_set
backwardElimination(training_set, SL) 
``` 
## Practice 4
``` 
setwd("C:/Users/Daniel/Desktop/mineria drive")
getwd()
``` 
Importing the dataset
``` 
dataset <- read.csv('Mall_Customers.csv')
dataset <- dataset[, 3:5]
``` 
Splitting the dataset into the Training set and Test set
``` 
Install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
``` 
Feature scaling
``` 
training_set[, 1:2] <- scale(training_set[, 1:2])
test_set[, 1:2] <- scale(test_set[, 1:2])
``` 
Fitting Logistic Regression to Training set
``` 
classifier = glm(formula = Purchased ~ .,
                 family = binomial,
                 data = training_set)
``` 

Predicting the Test set results
``` 
prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])
prob_pred
y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred
``` 
Making the Confusion Metrix
``` 
cm = table(test_set[, 3], y_pred)
cm
library(ggplot2)
ggplot(training_set, aes(x=Annual Income, y=Spending Score)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(training_set, aes(x=Age, y=Spending Score)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(test_set, aes(x=Annual Income, y=Spending Score)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(test_set, aes(x=Age, y=Spending Score)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'Annual Income')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Training set)',
     xlab = 'Age', ylab = 'Annual Income',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
``` 
Visualising the Test set results
``` 
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'Annual Income')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Test set)',
     xlab = 'Age', ylab = 'Annual Income',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
``` 
## Practice 5
Support Vector Machine (SVM)
Set our workspace
```
setwd("C:/Users/Daniel/Desktop/mineria drive")
getwd()
```
Importing the dataset
```
dataset <- read.csv('Mall_Customers.csv')
dataset = dataset[3:5]
```

Encoding the target feature as factor
```
dataset$Spending Score = factor(dataset$Spending Score, levels = c(0, 1))
```
Splitting the dataset into the Training set and Test set
```
install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Spending Score, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```
Feature Scaling
```
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```
Fitting SVM to the Training set
```
install.packages('e1071')
library(e1071)
classifier = svm(formula = Spending Score ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')
svm
```
Predicting the Test set results
```
y_pred = predict(classifier, newdata = test_set[-3])
y_pred
```
Making the Confusion Matrix
```
cm = table(test_set[, 3], y_pred)
cm
```
Visualising the Training set results
```
install.packages("ElemStatLearn")
library(ElemStatLearn)
```
set = training_set
```
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'Annual Income')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'SVM (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
Visualising the Test set results
```
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'Annual Income')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'SVM (Test set)',
     xlab = 'Age', ylab = 'Annual Income',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
## Practice 6
Decision Tree Classification
```
setwd("C:/Users/Daniel/Desktop/mineria drive")
getwd()
```
Importing the dataset
```
dataset <- read.csv('Mall_Customers.csv')
dataset = dataset[3:5]
```
Encoding the target feature as factor
```
dataset$Spending Score = factor(dataset$Spending Score, levels = c(0, 1))
```
Splitting the dataset into the Training set and Test set
```
install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Spending Score, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```
Feature Scaling
```
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```
Fitting Decision Tree Classification to the Training set
```
install.packages('rpart')
library(rpart)
classifier = rpart(formula = Spending Score ~ .,
                   data = training_set)
```
Predicting the Test set results
```
y_pred = predict(classifier, newdata = test_set[-3], type = 'class')
y_pred
```
Making the Confusion Matrix
```
cm = table(test_set[, 3], y_pred)
cm
```
Visualising the Training set results
```
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'Annual Income')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3],
     main = 'Decision Tree Classification (Training set)',
     xlab = 'Age', ylab = 'Annual Income',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
Visualising the Test set results
```
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'Annual Income')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3], main = 'Decision Tree Classification (Test set)',
     xlab = 'Age', ylab = 'Annual Income',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
Plotting the tree
```
plot(classifier)
text(classifier, cex=0.6)
```


## Evaluation

Dataset is imported and declared as movies
``` 
movies <- read.csv(file.choose())
movies
``` 
Dataset analysis
``` 
head(movies)#Muestra los primeros datos
``` 
Filter data by gender
``` 
gen <- movies[movies$Genre %in% c("action", "adventure", "animation", "comedy", "drama"),]
``` 
Filter data by recording studio 
``` 
stu <- gen[gen$Studio %in% c("Buena Vista Studios", "WB", "Fox", "Universal", "Paramount Pictures"),]
``` 
We use the ggplot2 library to graph
``` 
library(ggplot2)
```
We create a variable to save the ggplot structure
``` 
mp <- ggplot(data = stu, aes(x = Genre, y=Gross...US))
mp +geom_boxplot()
``` 
![img](https://github.com/Drani04/Data-Mining/blob/Unit-2/Images/ex1.png) 

Add jitter or noise or fluctuation in the data to scatter the data
``` 
p <- mp + geom_jitter() + geom_boxplot()
p
``` 
![img](https://github.com/Drani04/Data-Mining/blob/Unit-2/Images/ex2.png) 

Adjust the size and color to the study genre
``` 
p <- mp +geom_jitter(aes(size = Budget...mill., color=Studio)) + 
  geom_boxplot() 
p
``` 
![img](https://github.com/Drani04/Data-Mining/blob/Unit-2/Images/ex3.png) 

Black spots removed and boxplot transparent
``` 
p <- mp +geom_jitter(aes(size = Budget...mill., color=Studio)) +
  geom_boxplot(alpha=0.10, outlier.colour =NA)
p
```
![img](https://github.com/Drani04/Data-Mining/blob/Unit-2/Images/ex4.png) 

Title added to x, y axes to plot
``` 
p <- p +xlab("Genre") + ylab("Gross % US") + ggtitle("Domestic Gross % by Genre")
p
``` 
![img](https://github.com/Drani04/Data-Mining/blob/Unit-2/Images/ex5.png) 

Color, size and font are changed 
``` 
p <- p + theme(axis.title.x = element_text(color = "Blue", size = 18) ,
               axis.title.y = element_text(color = "Blue", size = 18) ,
               axis.text.x  = element_text(size = 12),
               axis.text.y  = element_text(size = 12),
               plot.title   = element_text(size = 18),
               legend.title = element_text(size = 18),
               text = element_text(family = "Bodoni 72 Smallcaps"))
p
``` 
![img](https://github.com/Drani04/Data-Mining/blob/Unit-2/Images/ex6.png) 
## Colaborators
- [Luis Daniel Lopez Valencia](https://github.com/Drani04)
- [Fernando Ordaz Zamora](https://github.com/fernando-123)
