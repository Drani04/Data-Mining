# Unit 4

* Evaluation
* Colaborators

## Evaluation
```
setwd("C:/Users/Daniel/Desktop/mineria drive")
getwd()
```
Importing the dataset
```
dataset = read.csv('iris.csv')
dataset = dataset[1:2]
```
Using the elbow method to find the optimal number of clusters
```
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')
```
Fitting K-Means to the dataset
```
set.seed(20)
kmeans = kmeans(x = dataset, centers = 5)
y_kmeans = kmeans$cluster
```
Visualización de la distribución de los datos en los centros
```
kmeans$cluster
```
Visualising the clusters
```
install.packages('cluster')
library(cluster)
clusplot(dataset,
         y_kmeans)

clusplot(dataset,
         y_kmeans,
         lines = 1,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of Sepal length and Sepal Width'),
         xlab = 'Sepal length',
         ylab = 'Sepal Width')
```

## Colaborators
- [Luis Daniel Lopez Valencia](https://github.com/Drani04)
- [Fernando Ordaz Zamora](https://github.com/fernando-123)
