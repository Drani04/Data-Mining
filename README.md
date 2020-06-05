# Unit 2

## Content


- Homework 1
- Homework 2
- Homework 3
- Homework 4
- Homework 5
- Practice 1
- Practice 2
- Practice 3
- Practice 4
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
### P Value
A p value (probability value) is a statistical measurement between 0 and 1. The p value is used to answer a hypothesis. A hypothesis is a question that admits a yes or no, or a false or true answer.
A null hypothesis is the opposite of what our research is. A result is statistically significant (and allows the null hypothesis to be rejected) if it corresponds to a p value equal to or less than the significance level. This is usually expressed as p ≤ 0.05. A p <0.05 means that the null hypothesis is false and a p> 0.05 that the null hypothesis is true:
To calculate the p-value, it is first assumed that there really is no difference between the two theories. 
Then, if the assumption is true, the probability is calculated that the observed difference is due only to chance.
This is the p-value. Therefore, the p-value is the probability of observing effects of the same importance as those observed in the study.
If the p-value is low, the results are unlikely to be due to chance and the idea that there is no difference is rejected (the null hypothesis is rejected).
If the p-value is high, the observed difference is probably a fluke. Once the value of P has been determined, the conclusion at any particular level results from comparing the value of P with the level of significance.

## Homework 3
### ElemStatLearn
It is a set of tools to model and understand complex data sets. It is a recently developed area in statistics and combines parallel developments in computing and, in particular, machine learning. The field encompasses many methods, such as looping and sparse regression, classification and regression trees, and reinforcement and support vector machines. It refers to a vast set of tools for understanding data. These tools can be classified as supervised or unsupervised. In general terms, supervised SL involves the construction of a statistical model to predict or estimate a product based on one or more inputs. Problems of this nature occur in fields as diverse as business, medicine, astrophysics, and public policy. With unsupervised SL, there are inputs, but there is no supervisory output; however, we can learn relationships and structure from such data.

## Homework 4
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

Upgrade R to version 3.6

## Practice 3

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

## Practice 4

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
