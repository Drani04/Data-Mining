# Unit 1

## Content
- Practice 1
- Practice 2
- Practice 3
- Practice 4
- Practice 5
- Evaluation
- Colaborators


## Practice 1

Test the Law Of Large Numbers for N random normally distributed numbers with mean = 0, stdev=1:
Create an R script that will count how many of these numbers fall between -1 and 1 and divide by the total quantity of N
-You know that E(X) = 68.2%
-Check that Mean(Xn)->E(X) as you rerun your script while increasing N

Hint:
1. Initialize sample size
2. Initialize counter
3. loop for(i in rnorm(size))
4. Check if the iterated variable falls
5. Increase counter if the condition is true
6. return a result <- counter / N

```
N <- 30 #Initialize the sample in 30 but can be any number
counter <- 0 
for(i in rnorm(N)){ #rnorm generá numeros random
  if(i <= 1 & i >= -1){
    counter <- counter + 1
  }
}
result <- counter / N
result
```

## Practice 2

1. cat() - combine character values and print them to the screen or save them in a file directly 
```
cat('one',2,'three',4,'five') #one 2 three 4 five
```

2.identical() - test if 2 objects are exactly equal
```
identical(1, -1) ## FALSE 
identical(1, 1.) ## TRUE in R (both are stored as doubles)
```
3. range(x) - minimum and maximum
```
x <- c(2,7,1,-17,35,21,7)
range(x) #[1] -17  35
```
4. sort(x) - sort the vector x
```
x<-c(3,5,1,2,4,7) 
sort(x) #[1] 1 2 3 4 5 7
```
sorting with sort function in R: descending order 
```
sort(x,decreasing=TRUE) #[1] 7 5 4 3 2 1
```
5.rank() - returns the ranks of the values in a vector
```
x <- c(2,7,1,-17,NA,Inf,35,21)
rank(x) #[1] 3 4 2 1 8 7 6 5
```
6. sq() - generates a sequence of numbers
```
seq(5,10) #[1]  5  6  7  8  9 10
seq(from=0, to=20, length.out=5) #[1]  0  5 10 15 20
```

7.trunk() - rounds to the nearest integer in the direction of 0.
```
trunc(125.2395) #[1] 125
```
8. append() - add elements to a vector
```
append(1:5, 0:1, after = 3) # [1] 1 2 3 0 1 4 5
```
9. round a number with the indicated decimals, if not indicated an integer is given
```
round (6.78.1)
round (11.80)
```
10. cbind() - Combine vectors by row/column
```
m <- cbind(1, 1:7) 
```
11. strsplit() - split the string into substrings with the specified delimiter.
mysentence<- "india won the icc worldcup on 2011"
strsplit(mysentence," ") #[1] "india" "won" "the" "icc" "worldcup" "on" "2011" 

12. Argument (...)
```
inverse <- function (...) {
  v <- unlist (list (...)) # Assign the arguments to a vector
  x <- 1 / v
  return (x)
}
inverse (3)
```
13. text and output variable, \ n new line
```
x <- 5
and <- 2
cat (x, "raised to", y, "is", x ^ y, "\ n")
```
14. concatenate
```
x <- c (1,2,3)
t <- c ("one", "two", "three")
x; t
```
15. root
```
sqrt (25)
```
16. removes decimals
```
trunc (3.1416)
trunc (23.0987)
```
17. returns T if the condition is met
```
x <- runif (10, -10, 100)
if (any (x <0)) cat ("In x there are negative numbers \ n")
```
18. shows the number of elements
```
x <- 7:10
length (x)
```
19. generates random numbers
```
runif (3,1,10)
```
20. sum the vector elements
```
x <- runif (50,2,15)
sum (x)
```

## Practice 3

Data
```
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)
```
1 Calculate Profit As The Differences Between Revenue And Expenses
```
profit <- revenue - expenses
profit
```
2 Calculate Tax As 30% Of Profit And Round To 2 Decimal Points
```
tax <- round(0.30 * profit,2) #round(,3)used to decide some decimals will be used 
tax 
```
3 Calculate Profit Remaining After Tax Is Deducted
```
profit.after.tax <- profit - tax
profit.after.tax
```
4 Calculate The Profit Margin As Profit After Tax Over Revenue Round To 2 Decimal Points, Then Multiply By 100 To Get %
```
profit.margin <- round(profit.after.tax/revenue,2) *100
profit.margin <- paste(profit.margin,'%') 
profit.margin #to concatenate characters it is separated by commas and quotation marks are used in the deceased character
```
5 Calculate The Mean Profit After Tax For The 12 Months
```
mean_pat <- mean(profit.after.tax) #The mean is the average of the numbers
mean_pat
```
6 Find The Months With Above-Mean Profit After Tax
```
good.months <- profit.after.tax > mean_pat #with the character> the search for the months greater than the average was mean
good.months
```
7 Bad Months Are The Opposite Of Good Months !
```
bad.months <-  !good.months #!tells us otherwise
bad.months
```
8 The Best Month Is Where Profit After Tax Was Equal To The Maximum
```
best.month <- profit.after.tax == max(profit.after.tax)
best.month
```
9 The Worst Month Is Where Profit After Tax Was Equal To The Minimum
```
worst.month <- profit.after.tax == min (profit.after.tax)
worst.month
```
10 Convert All Calculations To Units Of One Thousand Dollars
```
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(expenses / 1000, 0)
profit.1000 <- round(profit / 1000, 0 )
profit.after.tax.1000 <- round(profit.after.tax / 1000, 0) 
```
11 Print Results
```
revenue.1000
expenses.1000
profit.1000
profit.after.tax.1000
profit.margin
good.months
bad.months
best.month
worst.month
```
12 BONUS: Preview Of What's Coming In The Next Section
```
M <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit.after.tax.1000,
  profit.margin,
  good.months,
  bad.months,
  best.month,
  worst.month
)
#Print The Matrix
M
```

## Practice 4
Dear Student, Welcome to the world of Basketball Data! I'm sure you will enjoy this section of the R Programming course.

Instructions for this dataset:
Simply select ALL the lines in this script by pressing, CTRL+A on Windows or CMND+A on a Mac and execute them, Once you have executed the commands the following objects, will be created:

Matrices:
- FieldGoalAttempts
- FieldGoals
- Games
- MinutesPlayed
- Salary

Vectors:
- Players
- Seasons

We will go understand these inside the course, Sincerely, Kirill Eremenko, www.superdatascience.com

Copyright: These datasets were prepared using publicly available data.
However, theses scripts are subject to Copyright Laws. 
If you wish to use these R scripts outside of the R Programming Course
by Kirill Eremenko, you may do so by referencing www.superdatascience.com in your work.

Comments:Seasons are labeled based on the first year in the season E.g. the 2012-2013 season is preseneted as simply 2012

Notes and Corrections to the data:
- Kevin Durant: 2006 - College Data Used
- Kevin Durant: 2005 - Proxied With 2006 Data
- Derrick Rose: 2012 - Did Not Play
- Derrick Rose: 2007 - College Data Used
- Derrick Rose: 2006 - Proxied With 2007 Data
- Derrick Rose: 2005 - Proxied With 2007 Data

Seasons
```
Seasons <- c("2005","2006","2007","2008","2009","2010","2011","2012","2013","2014")
```
Players
```
Players <- c("KobeBryant","JoeJohnson","LeBronJames","CarmeloAnthony","DwightHoward","ChrisBosh","ChrisPaul","KevinDurant","DerrickRose","DwayneWade")
```
Salaries
```
KobeBryant_Salary <- c(15946875,17718750,19490625,21262500,23034375,24806250,25244493,27849149,30453805,23500000)
JoeJohnson_Salary <- c(12000000,12744189,13488377,14232567,14976754,16324500,18038573,19752645,21466718,23180790)
LeBronJames_Salary <- c(4621800,5828090,13041250,14410581,15779912,14500000,16022500,17545000,19067500,20644400)
CarmeloAnthony_Salary <- c(3713640,4694041,13041250,14410581,15779912,17149243,18518574,19450000,22407474,22458000)
DwightHoward_Salary <- c(4493160,4806720,6061274,13758000,15202590,16647180,18091770,19536360,20513178,21436271)
ChrisBosh_Salary <- c(3348000,4235220,12455000,14410581,15779912,14500000,16022500,17545000,19067500,20644400)
ChrisPaul_Salary <- c(3144240,3380160,3615960,4574189,13520500,14940153,16359805,17779458,18668431,20068563)
KevinDurant_Salary <- c(0,0,4171200,4484040,4796880,6053663,15506632,16669630,17832627,18995624)
DerrickRose_Salary <- c(0,0,0,4822800,5184480,5546160,6993708,16402500,17632688,18862875)
DwayneWade_Salary <- c(3031920,3841443,13041250,14410581,15779912,14200000,15691000,17182000,18673000,15000000)
```
Matrix
```
Salary <- rbind(KobeBryant_Salary, JoeJohnson_Salary, LeBronJames_Salary, CarmeloAnthony_Salary, DwightHoward_Salary, ChrisBosh_Salary, ChrisPaul_Salary, KevinDurant_Salary, DerrickRose_Salary, DwayneWade_Salary)
rm(KobeBryant_Salary, JoeJohnson_Salary, CarmeloAnthony_Salary, DwightHoward_Salary, ChrisBosh_Salary, LeBronJames_Salary, ChrisPaul_Salary, DerrickRose_Salary, DwayneWade_Salary, KevinDurant_Salary)
colnames(Salary) <- Seasons
rownames(Salary) <- Players
```
Games 
```
KobeBryant_G <- c(80,77,82,82,73,82,58,78,6,35)
JoeJohnson_G <- c(82,57,82,79,76,72,60,72,79,80)
LeBronJames_G <- c(79,78,75,81,76,79,62,76,77,69)
CarmeloAnthony_G <- c(80,65,77,66,69,77,55,67,77,40)
DwightHoward_G <- c(82,82,82,79,82,78,54,76,71,41)
ChrisBosh_G <- c(70,69,67,77,70,77,57,74,79,44)
ChrisPaul_G <- c(78,64,80,78,45,80,60,70,62,82)
KevinDurant_G <- c(35,35,80,74,82,78,66,81,81,27)
DerrickRose_G <- c(40,40,40,81,78,81,39,0,10,51)
DwayneWade_G <- c(75,51,51,79,77,76,49,69,54,62)
```
Matrix
```
Games <- rbind(KobeBryant_G, JoeJohnson_G, LeBronJames_G, CarmeloAnthony_G, DwightHoward_G, ChrisBosh_G, ChrisPaul_G, KevinDurant_G, DerrickRose_G, DwayneWade_G)
rm(KobeBryant_G, JoeJohnson_G, CarmeloAnthony_G, DwightHoward_G, ChrisBosh_G, LeBronJames_G, ChrisPaul_G, DerrickRose_G, DwayneWade_G, KevinDurant_G)
colnames(Games) <- Seasons
rownames(Games) <- Players
```
Minutes Played
```
KobeBryant_MP <- c(3277,3140,3192,2960,2835,2779,2232,3013,177,1207)
JoeJohnson_MP <- c(3340,2359,3343,3124,2886,2554,2127,2642,2575,2791)
LeBronJames_MP <- c(3361,3190,3027,3054,2966,3063,2326,2877,2902,2493)
CarmeloAnthony_MP <- c(2941,2486,2806,2277,2634,2751,1876,2482,2982,1428)
DwightHoward_MP <- c(3021,3023,3088,2821,2843,2935,2070,2722,2396,1223)
ChrisBosh_MP <- c(2751,2658,2425,2928,2526,2795,2007,2454,2531,1556)
ChrisPaul_MP <- c(2808,2353,3006,3002,1712,2880,2181,2335,2171,2857)
KevinDurant_MP <- c(1255,1255,2768,2885,3239,3038,2546,3119,3122,913)
DerrickRose_MP <- c(1168,1168,1168,3000,2871,3026,1375,0,311,1530)
DwayneWade_MP <- c(2892,1931,1954,3048,2792,2823,1625,2391,1775,1971)
```
Matrix
```
MinutesPlayed <- rbind(KobeBryant_MP, JoeJohnson_MP, LeBronJames_MP, CarmeloAnthony_MP, DwightHoward_MP, ChrisBosh_MP, ChrisPaul_MP, KevinDurant_MP, DerrickRose_MP, DwayneWade_MP)
rm(KobeBryant_MP, JoeJohnson_MP, CarmeloAnthony_MP, DwightHoward_MP, ChrisBosh_MP, LeBronJames_MP, ChrisPaul_MP, DerrickRose_MP, DwayneWade_MP, KevinDurant_MP)
colnames(MinutesPlayed) <- Seasons
rownames(MinutesPlayed) <- Players
```
Field Goals
```
KobeBryant_FG <- c(978,813,775,800,716,740,574,738,31,266)
JoeJohnson_FG <- c(632,536,647,620,635,514,423,445,462,446)
LeBronJames_FG <- c(875,772,794,789,768,758,621,765,767,624)
CarmeloAnthony_FG <- c(756,691,728,535,688,684,441,669,743,358)
DwightHoward_FG <- c(468,526,583,560,510,619,416,470,473,251)
ChrisBosh_FG <- c(549,543,507,615,600,524,393,485,492,343)
ChrisPaul_FG <- c(407,381,630,631,314,430,425,412,406,568)
KevinDurant_FG <- c(306,306,587,661,794,711,643,731,849,238)
DerrickRose_FG <- c(208,208,208,574,672,711,302,0,58,338)
DwayneWade_FG <- c(699,472,439,854,719,692,416,569,415,509)
```
Matrix
```
FieldGoals <- rbind(KobeBryant_FG, JoeJohnson_FG, LeBronJames_FG, CarmeloAnthony_FG, DwightHoward_FG, ChrisBosh_FG, ChrisPaul_FG, KevinDurant_FG, DerrickRose_FG, DwayneWade_FG)
rm(KobeBryant_FG, JoeJohnson_FG, LeBronJames_FG, CarmeloAnthony_FG, DwightHoward_FG, ChrisBosh_FG, ChrisPaul_FG, KevinDurant_FG, DerrickRose_FG, DwayneWade_FG)
colnames(FieldGoals) <- Seasons
rownames(FieldGoals) <- Players
```
Field Goal Attempts
```
KobeBryant_FGA <- c(2173,1757,1690,1712,1569,1639,1336,1595,73,713)
JoeJohnson_FGA <- c(1395,1139,1497,1420,1386,1161,931,1052,1018,1025)
LeBronJames_FGA <- c(1823,1621,1642,1613,1528,1485,1169,1354,1353,1279)
CarmeloAnthony_FGA <- c(1572,1453,1481,1207,1502,1503,1025,1489,1643,806)
DwightHoward_FGA <- c(881,873,974,979,834,1044,726,813,800,423)
ChrisBosh_FGA <- c(1087,1094,1027,1263,1158,1056,807,907,953,745)
ChrisPaul_FGA <- c(947,871,1291,1255,637,928,890,856,870,1170)
KevinDurant_FGA <- c(647,647,1366,1390,1668,1538,1297,1433,1688,467)
DerrickRose_FGA <- c(436,436,436,1208,1373,1597,695,0,164,835)
DwayneWade_FGA <- c(1413,962,937,1739,1511,1384,837,1093,761,1084)
```
Matrix
```
FieldGoalAttempts <- rbind(KobeBryant_FGA, JoeJohnson_FGA, LeBronJames_FGA, CarmeloAnthony_FGA, DwightHoward_FGA, ChrisBosh_FGA, ChrisPaul_FGA, KevinDurant_FGA, DerrickRose_FGA, DwayneWade_FGA)
rm(KobeBryant_FGA, JoeJohnson_FGA, LeBronJames_FGA, CarmeloAnthony_FGA, DwightHoward_FGA, ChrisBosh_FGA, ChrisPaul_FGA, KevinDurant_FGA, DerrickRose_FGA, DwayneWade_FGA)
colnames(FieldGoalAttempts) <- Seasons
rownames(FieldGoalAttempts) <- Players
```
Points
```
KobeBryant_PTS <- c(2832,2430,2323,2201,1970,2078,1616,2133,83,782)
JoeJohnson_PTS <- c(1653,1426,1779,1688,1619,1312,1129,1170,1245,1154)
LeBronJames_PTS <- c(2478,2132,2250,2304,2258,2111,1683,2036,2089,1743)
CarmeloAnthony_PTS <- c(2122,1881,1978,1504,1943,1970,1245,1920,2112,966)
DwightHoward_PTS <- c(1292,1443,1695,1624,1503,1784,1113,1296,1297,646)
ChrisBosh_PTS <- c(1572,1561,1496,1746,1678,1438,1025,1232,1281,928)
ChrisPaul_PTS <- c(1258,1104,1684,1781,841,1268,1189,1186,1185,1564)
KevinDurant_PTS <- c(903,903,1624,1871,2472,2161,1850,2280,2593,686)
DerrickRose_PTS <- c(597,597,597,1361,1619,2026,852,0,159,904)
DwayneWade_PTS <- c(2040,1397,1254,2386,2045,1941,1082,1463,1028,1331)
```
Matrix
```
Points <- rbind(KobeBryant_PTS, JoeJohnson_PTS, LeBronJames_PTS, CarmeloAnthony_PTS, DwightHoward_PTS, ChrisBosh_PTS, ChrisPaul_PTS, KevinDurant_PTS, DerrickRose_PTS, DwayneWade_PTS)
rm(KobeBryant_PTS, JoeJohnson_PTS, LeBronJames_PTS, CarmeloAnthony_PTS, DwightHoward_PTS, ChrisBosh_PTS, ChrisPaul_PTS, KevinDurant_PTS, DerrickRose_PTS, DwayneWade_PTS)
colnames(Points) <- Seasons
rownames(Points) <- Players
```
Analysis
```
Games
rownames(Games)
colnames(Games)
Games["KevinDurant", "2013"]
Games["KobeBryant", "2013"]
```
Field goals
```
round(FieldGoals / Games, 1)
```
Minutes played
```
round(MinutesPlayed / Games)
```
Visualize the data
```
?matplot
matplot(t(FieldGoals/Games), type ="b", pch=15:18, col=c(1:4, 6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4, 6), pch=15:18, horiz=F)
matplot(t(FieldGoals/FieldGoalAttempts), type ="b", pch=15:18, col=c(1:4, 6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4, 6), pch=15:18, horiz=F)
```
Subsets
```
Games
Games[1:3, 6:10]
Games[c(1,10),]
Games[, c("2008", "2009")]
Games[1,]
Games[1, 5]

is.matrix(Games[1,])
is.vector(Games[1,])

Games[1,,drop=F]
Games[1,5, drop=F]
```
Visualizing Subsets
```
Data <- MinutesPlayed[1:3,, drop=F]

matplot(t(Data), type ="b", pch=15:18, col=c(1:4, 6))
legend("bottomleft", inset=0.01, legend=Players[1:3], col=c(1:4, 6), pch=15:18, horiz=F)

Data

Data <- MinutesPlayed[1,, drop=F]

matplot(t(Data), type ="b", pch=15:18, col=c(1:4, 6))
legend("bottomleft", inset=0.01, legend=Players[1], col=c(1:4, 6), pch=15:18, horiz=F)
Data

#Functions
myplot <- function(data, rows){
  Data <- data[rows,, drop=F]
  matplot(t(Data), type ="b", pch=15:18, col=c(1:4, 6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4, 6), pch=15:18, horiz=F)
}

myplot(MinutesPlayed,1:5)
myplot(Games,1:5)
myplot(Points,1:9)
myplot(Salary,1:5)
myplot(MinutesPlayed/Games, 1:3)

myplot(MinutesPlayed*Salary, 1:5)
myplot(Salary*Games,1:5)
myplot(MinutesPlayed/Salary,1:5)
myplot(Games/Salary,1:5)
myplot(Games/Points,1:6)
myplot(Games*Points,1:6)
myplot(Games*MinutesPlayed,1:5)
```
## Practice 5
```
?read.csv()
```
Method 1: Select the file manually
```
stats <- read.csv(file.choose())
stats
```
Method 2: Set Working Directory and Read Data
```
getwd()
```
windows
```
setwd("C:\\Users\\username\\Documents\\Rprojects")
```
Mac
```
setwd()
setwd('/home/chris/Documents/itt/Enero_Junio_2020/Mineria_de_datos/DataMining/Dataframes')
getwd()
rm(stats)
stats <- read.csv("Demographic-Data.csv")
```
Exploring the data
```
stats
is.data.frame(stats) #saber si existen datos cargados
nrow(stats) #numero de filas
ncol(stats) #numero de columnas
head(stats, n=10) #primeras 10 filas
tail(stats, n=8) #ultimas 8 filas
str(stats) #estructura de la base de datos
summary(stats) #resumen del contenido
```
Using the $ sing
```
stats #muestra el contenido
head(stats) #muestra filas
stats[3,3] #selecciona un dato de la tabla por coordenadas
stats[3, "Birth.rate"] #selecciona un dato de la tabla por coordenadas
typeof(stats) #menciona el tipo de dato de la variable stats
stats$Internet.users #muestra los internet users
stats$Internet.users[2] #muestra la segunda posicion del primer registro
stats[ , "Internet.users"] #muestra los internet users
levels(stats$Income.Group) #muestra los diferentes tipos de income
```
Basic operations with dataframes
```
stats[1:10, ] #subsetting despliega los registros del 1 al 10
stats[3:9, ] #despliega los registros del 3 al 9
stats[c(4, 100),] #despliega los registros 4 y 100
is.data.frame(stats[1, ]) #muestra si es data frame o no
is.data.frame(stats[,1]) #muesta si es data frame o no
is.data.frame(stats[,1, drop=F]) #muestra si es data frame o no
stats[,1, drop=F] #muestra registros que son dataframe
```
Multiply columns
```
stats$Birth.rate * stats$Internet.users #multiplica las columnas
stats$Birth.rate + stats$Internet.users #suma las columnas
```
Add Columns
```
head(stats) #muestra las columnas
stats$BRbyIU <- stats$Birth.rate * stats$Internet.users #agrega columna brbyiu
head(stats)
```
Thigs to know
```
stats$xyz <- 1:5 #agrega columna con datos del 1 al 5
head(stats, n=12) #muestra 12 registros
```
Remove columns
```
head(stats)
stats$BRbyIU <- NULL #elimina columna
stats$xyz <- NULL #elimina columna
```
Filtering Data Frames
```
head(stats) #muestra tabla
filter <- stats$Internet.users < 2 #TRUE muestra con un true los usuarios que sean menores a 2
filter #despliega el resultado de arriba
stats[filter,] #muestra lo de arriba con información
stats[stats$Birth.rate > 40,] #muestra los registros donde birth rate sea mayor a 40
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,] #muestra donde birthrate sea mayor a 40 y internet user menor a 2
stats[stats$Income.Group == "High income",] #muestra los registros donde income group sea high income
levels(stats$Income.Group) #muestra los diferentes tipos de income group
```
Practice
```
?filter
#Filter countries by Low income
stats[stats$Income.Group == "Low income", "Country.Name"]
#Filter countries by Lower middle income
stats[stats$Income.Group == "middle income", "Country.Name"]
#Filter countries by Upper middle income
stats[stats$Income.Group == "Upper middle income", "Country.Name"]
#Filter by countrie Malta
stats[stats$Country.Name == "Malta",]
#Filter by countrie Qatar
stats[stats$Country.Name == "Qatar",]

#Filter by countrie Netherlands
stats[stats$Country.Name == "Netherlands",]

#Filter by countrie Norway
stats[stats$Country.Name == "Norway",]
```
Intro to qplot()
```
#install.packages("ggplot2")
library(ggplot2)  #ejecutar libreria ggplot2
?qplot
qplot(data=stats, x=Internet.users) #despliega grafica con los datos de stats usando internet users
qplot(data=stats, x=Income.Group, y=Birth.rate) #despliega grafica con income group y birth rate
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(5)) #size= tamaño de los puntos
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(5), color=I("green")) # color=color de los puntos
qplot(data=stats, x=Income.Group, y=Birth.rate, geom="boxplot") #geom= forma de la grafica
```
Visualizing what we need
```
qplot(data=stats, x=Internet.users, y=Birth.rate) #despliega grafica de dispersion
qplot(data=stats, x=Internet.users, y=Birth.rate, color=I("blue"), size=I(1)) #color= color size=tamaño
qplot(data=stats, x=Internet.users, y=Birth.rate, color=Income.Group, size=I(1)) #asigna un color a cada tipo de income
```
Requirements changed
```
Countries_2012_Dataset <- c("Aruba","Afghanistan","Angola","Albania","United Arab Emirates","Argentina","Armenia","Antigua and Barbuda","Australia","Austria","Azerbaijan","Burundi","Belgium","Benin","Burkina Faso","Bangladesh","Bulgaria","Bahrain","Bahamas, The","Bosnia and Herzegovina","Belarus","Belize","Bermuda","Bolivia","Brazil","Barbados","Brunei Darussalam","Bhutan","Botswana","Central African Republic","Canada","Switzerland","Chile","China","Cote d'Ivoire","Cameroon","Congo, Rep.","Colombia","Comoros","Cabo Verde","Costa Rica","Cuba","Cayman Islands","Cyprus","Czech Republic","Germany","Djibouti","Denmark","Dominican Republic","Algeria","Ecuador","Egypt, Arab Rep.","Eritrea","Spain","Estonia","Ethiopia","Finland","Fiji","France","Micronesia, Fed. Sts.","Gabon","United Kingdom","Georgia","Ghana","Guinea","Gambia, The","Guinea-Bissau","Equatorial Guinea","Greece","Grenada","Greenland","Guatemala","Guam","Guyana","Hong Kong SAR, China","Honduras","Croatia","Haiti","Hungary","Indonesia","India","Ireland","Iran, Islamic Rep.","Iraq","Iceland","Israel","Italy","Jamaica","Jordan","Japan","Kazakhstan","Kenya","Kyrgyz Republic","Cambodia","Kiribati","Korea, Rep.","Kuwait","Lao PDR","Lebanon","Liberia","Libya","St. Lucia","Liechtenstein","Sri Lanka","Lesotho","Lithuania","Luxembourg","Latvia","Macao SAR, China","Morocco","Moldova","Madagascar","Maldives","Mexico","Macedonia, FYR","Mali","Malta","Myanmar","Montenegro","Mongolia","Mozambique","Mauritania","Mauritius","Malawi","Malaysia","Namibia","New Caledonia","Niger","Nigeria","Nicaragua","Netherlands","Norway","Nepal","New Zealand","Oman","Pakistan","Panama","Peru","Philippines","Papua New Guinea","Poland","Puerto Rico","Portugal","Paraguay","French Polynesia","Qatar","Romania","Russian Federation","Rwanda","Saudi Arabia","Sudan","Senegal","Singapore","Solomon Islands","Sierra Leone","El Salvador","Somalia","Serbia","South Sudan","Sao Tome and Principe","Suriname","Slovak Republic","Slovenia","Sweden","Swaziland","Seychelles","Syrian Arab Republic","Chad","Togo","Thailand","Tajikistan","Turkmenistan","Timor-Leste","Tonga","Trinidad and Tobago","Tunisia","Turkey","Tanzania","Uganda","Ukraine","Uruguay","United States","Uzbekistan","St. Vincent and the Grenadines","Venezuela, RB","Virgin Islands (U.S.)","Vietnam","Vanuatu","West Bank and Gaza","Samoa","Yemen, Rep.","South Africa","Congo, Dem. Rep.","Zambia","Zimbabwe")
Codes_2012_Dataset <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BMU","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYM","CYP","CZE","DEU","DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GRL","GTM","GUM","GUY","HKG","HND","HRV","HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ISR","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KHM","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LIE","LKA","LSO","LTU","LUX","LVA","MAC","MAR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","MWI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PHL","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","SLE","SLV","SOM","SRB","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYC","SYR","TCD","TGO","THA","TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR","VNM","VUT","PSE","WSM","YEM","ZAF","COD","ZMB","ZWE")
Regions_2012_Dataset <- c("The Americas","Asia","Africa","Europe","Middle East","The Americas","Asia","The Americas","Oceania","Europe","Asia","Africa","Europe","Africa","Africa","Asia","Europe","Middle East","The Americas","Europe","Europe","The Americas","The Americas","The Americas","The Americas","The Americas","Asia","Asia","Africa","Africa","The Americas","Europe","The Americas","Asia","Africa","Africa","Africa","The Americas","Africa","Africa","The Americas","The Americas","The Americas","Europe","Europe","Europe","Africa","Europe","The Americas","Africa","The Americas","Africa","Africa","Europe","Europe","Africa","Europe","Oceania","Europe","Oceania","Africa","Europe","Asia","Africa","Africa","Africa","Africa","Africa","Europe","The Americas","The Americas","The Americas","Oceania","The Americas","Asia","The Americas","Europe","The Americas","Europe","Asia","Asia","Europe","Middle East","Middle East","Europe","Middle East","Europe","The Americas","Middle East","Asia","Asia","Africa","Asia","Asia","Oceania","Asia","Middle East","Asia","Middle East","Africa","Africa","The Americas","Europe","Asia","Africa","Europe","Europe","Europe","Asia","Africa","Europe","Africa","Asia","The Americas","Europe","Africa","Europe","Asia","Europe","Asia","Africa","Africa","Africa","Africa","Asia","Africa","Oceania","Africa","Africa","The Americas","Europe","Europe","Asia","Oceania","Middle East","Asia","The Americas","The Americas","Asia","Oceania","Europe","The Americas","Europe","The Americas","Oceania","Middle East","Europe","Europe","Africa","Middle East","Africa","Africa","Asia","Oceania","Africa","The Americas","Africa","Europe","Africa","Africa","The Americas","Europe","Europe","Europe","Africa","Africa","Middle East","Africa","Africa","Asia","Asia","Asia","Asia","Oceania","The Americas","Africa","Europe","Africa","Africa","Europe","The Americas","The Americas","Asia","The Americas","The Americas","The Americas","Asia","Oceania","Middle East","Oceania","Middle East","Africa","Africa","Africa","Africa")
#se creo bd nueva
```
Creating Data Frames
```
mydf <- data.frame(Country= Countries_2012_Dataset, Code= Codes_2012_Dataset,
                   Region= Regions_2012_Dataset)
head(mydf) #primeros 6 renglones
tail(mydf) #ultimos 3 renglones
summary(mydf) #resumen 
Marging(unir) Data Frames
head(stats)
head(mydf)
merged <- merge(stats, mydf, by.x = "Country.Code", by.y = "Code") #derecha,izquierda eje x y eje y
head(merged)

merged$Country <- NULL #elimina columna country
str(merged)
tail(merged)
```
Visualizing With new Split
```
qplot(data = merged, x = Internet.users, y = Birth.rate,
      color = Region, size=I(3), shape=I(19), alpha =I(.4), 
      main = "Birth Rate vs Internet Users by Country")
#shape 0-25 formas
#alpha 0-1 transparencia
#main for adding title to the plot
```
Outcome
1. Importing Data into R
2. Exploring Datasets: head(), tail(), summary(), str()
3. Using the $ sing
4. Basic operations with Data Frames
5. Filtering a Date Frame
6. Introduction to qplot
7. Visualizing with qplot: Part I
8. Buildign Data Frames: data.frame()
9. Marging Data Frames: marge()
10. Visualizing with qplot: Part II

## Evaluation 1

Elegimos la base de datos a trabajar y lo almacenamos en stats
```
stats <- read.csv(file.choose())
stats
```
Visualizamos la base de datos
```
head(stats)
```
Ejecutamos lo siguiente para generar nuevos valores
```
Country_Code <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYP","CZE","DEU","DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GTM","GUM","GUY","HKG","HND","HRV","HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KHM","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LKA","LSO","LTU","LUX","LVA","MAC","MAR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","MWI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PHL","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","SLE","SLV","SOM","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYR","TCD","TGO","THA","TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR","VNM","VUT","WSM","YEM","ZAF","COD","ZMB","ZWE")
Life_Expectancy_At_Birth_1960 <- c(65.5693658536586,32.328512195122,32.9848292682927,62.2543658536585,52.2432195121951,65.2155365853659,65.8634634146342,61.7827317073171,70.8170731707317,68.5856097560976,60.836243902439,41.2360487804878,69.7019512195122,37.2782682926829,34.4779024390244,45.8293170731707,69.2475609756098,52.0893658536585,62.7290487804878,60.2762195121951,67.7080975609756,59.9613658536585,42.1183170731707,54.2054634146342,60.7380487804878,62.5003658536585,32.3593658536585,50.5477317073171,36.4826341463415,71.1331707317073,71.3134146341463,57.4582926829268,43.4658048780488,36.8724146341463,41.523756097561,48.5816341463415,56.716756097561,41.4424390243903,48.8564146341463,60.5761951219512,63.9046585365854,69.5939268292683,70.3487804878049,69.3129512195122,44.0212682926829,72.1765853658537,51.8452682926829,46.1351219512195,53.215,48.0137073170732,37.3629024390244,69.1092682926829,67.9059756097561,38.4057073170732,68.819756097561,55.9584878048781,69.8682926829268,57.5865853658537,39.5701219512195,71.1268292682927,63.4318536585366,45.8314634146342,34.8863902439024,32.0422195121951,37.8404390243902,36.7330487804878,68.1639024390244,59.8159268292683,45.5316341463415,61.2263414634146,60.2787317073171,66.9997073170732,46.2883170731707,64.6086585365854,42.1000975609756,68.0031707317073,48.6403170731707,41.1719512195122,69.691756097561,44.945512195122,48.0306829268293,73.4286585365854,69.1239024390244,64.1918292682927,52.6852682926829,67.6660975609756,58.3675853658537,46.3624146341463,56.1280731707317,41.2320243902439,49.2159756097561,53.0013170731707,60.3479512195122,43.2044634146342,63.2801219512195,34.7831707317073,42.6411951219512,57.303756097561,59.7471463414634,46.5107073170732,69.8473170731707,68.4463902439024,69.7868292682927,64.6609268292683,48.4466341463415,61.8127804878049,39.9746829268293,37.2686341463415,57.0656341463415,60.6228048780488,28.2116097560976,67.6017804878049,42.7363902439024,63.7056097560976,48.3688048780488,35.0037073170732,43.4830975609756,58.7452195121951,37.7736341463415,59.4753414634146,46.8803902439024,58.6390243902439,35.5150487804878,37.1829512195122,46.9988292682927,73.3926829268293,73.549756097561,35.1708292682927,71.2365853658537,42.6670731707317,45.2904634146342,60.8817073170732,47.6915853658537,57.8119268292683,38.462243902439,67.6804878048781,68.7196097560976,62.8089268292683,63.7937073170732,56.3570487804878,61.2060731707317,65.6424390243903,66.0552926829268,42.2492926829268,45.6662682926829,48.1876341463415,38.206,65.6598292682927,49.3817073170732,30.3315365853659,49.9479268292683,36.9658780487805,31.6767073170732,50.4513658536585,59.6801219512195,69.9759268292683,68.9780487804878,73.0056097560976,44.2337804878049,52.768243902439,38.0161219512195,40.2728292682927,54.6993170731707,56.1535365853659,54.4586829268293,33.7271219512195,61.3645365853659,62.6575853658537,42.009756097561,45.3844146341463,43.6538780487805,43.9835609756098,68.2995365853659,67.8963902439025,69.7707317073171,58.8855365853659,57.7238780487805,59.2851219512195,63.7302195121951,59.0670243902439,46.4874878048781,49.969512195122,34.3638048780488,49.0362926829268,41.0180487804878,45.1098048780488,51.5424634146342)
Life_Expectancy_At_Birth_2013 <- c(75.3286585365854,60.0282682926829,51.8661707317073,77.537243902439,77.1956341463415,75.9860975609756,74.5613658536585,75.7786585365854,82.1975609756098,80.890243902439,70.6931463414634,56.2516097560976,80.3853658536585,59.3120243902439,58.2406341463415,71.245243902439,74.4658536585366,76.5459512195122,75.0735365853659,76.2769268292683,72.4707317073171,69.9820487804878,67.9134390243903,74.1224390243903,75.3339512195122,78.5466585365854,69.1029268292683,64.3608048780488,49.8798780487805,81.4011219512195,82.7487804878049,81.1979268292683,75.3530243902439,51.2084634146342,55.0418048780488,61.6663902439024,73.8097317073171,62.9321707317073,72.9723658536585,79.2252195121951,79.2563902439025,79.9497804878049,78.2780487804878,81.0439024390244,61.6864634146342,80.3024390243903,73.3199024390244,74.5689512195122,75.648512195122,70.9257804878049,63.1778780487805,82.4268292682927,76.4243902439025,63.4421951219512,80.8317073170732,69.9179268292683,81.9682926829268,68.9733902439024,63.8435853658537,80.9560975609756,74.079512195122,61.1420731707317,58.216487804878,59.9992682926829,54.8384146341464,57.2908292682927,80.6341463414634,73.1935609756098,71.4863902439024,78.872512195122,66.3100243902439,83.8317073170732,72.9428536585366,77.1268292682927,62.4011463414634,75.2682926829268,68.7046097560976,67.6604146341463,81.0439024390244,75.1259756097561,69.4716829268293,83.1170731707317,82.290243902439,73.4689268292683,73.9014146341463,83.3319512195122,70.45,60.9537804878049,70.2024390243902,67.7720487804878,65.7665853658537,81.459756097561,74.462756097561,65.687243902439,80.1288780487805,60.5203902439024,71.6576829268293,74.9127073170732,74.2402926829268,49.3314634146342,74.1634146341464,81.7975609756098,73.9804878048781,80.3391463414634,73.7090487804878,68.811512195122,64.6739024390244,76.6026097560976,76.5326585365854,75.1870487804878,57.5351951219512,80.7463414634146,65.6540975609756,74.7583658536585,69.0618048780488,54.641512195122,62.8027073170732,74.46,61.466,74.567512195122,64.3438780487805,77.1219512195122,60.8281463414634,52.4421463414634,74.514756097561,81.1048780487805,81.4512195121951,69.222,81.4073170731707,76.8410487804878,65.9636829268293,77.4192195121951,74.2838536585366,68.1315609756097,62.4491707317073,76.8487804878049,78.7111951219512,80.3731707317073,72.7991707317073,76.3340731707317,78.4184878048781,74.4634146341463,71.0731707317073,63.3948292682927,74.1776341463415,63.1670487804878,65.878756097561,82.3463414634146,67.7189268292683,50.3631219512195,72.4981463414634,55.0230243902439,55.2209024390244,66.259512195122,70.99,76.2609756097561,80.2780487804878,81.7048780487805,48.9379268292683,74.7157804878049,51.1914878048781,59.1323658536585,74.2469268292683,69.4001707317073,65.4565609756098,67.5223658536585,72.6403414634147,70.3052926829268,73.6463414634147,75.1759512195122,64.2918292682927,57.7676829268293,71.159512195122,76.8361951219512,78.8414634146341,68.2275853658537,72.8108780487805,74.0744146341464,79.6243902439024,75.756487804878,71.669243902439,73.2503902439024,63.583512195122,56.7365853658537,58.2719268292683,59.2373658536585,55.633)
```
Creamos data frames con los valores pasados
```
life1960 <- data.frame( Code= Country_Code,
                      Life.Exp= Life_Expectancy_At_Birth_1960)
life2013 <- data.frame( Code= Country_Code,
                      Life.Exp= Life_Expectancy_At_Birth_2013)
```
visualizamos el contenido de los dataframes recien creados
```
head(life1960)
head(life2013)
```
Juntamos los dataframes por columnas o por renglones
```
merged1960 <- merge(stats, life1960, by.x="Country.Code", by.y="Code")
merged2013 <- merge(stats, life2013, by.x="Country.Code", by.y="Code")

#ggplot
library(ggplot2)
```
Ploteo del año 1960
```
qplot(data=merged1960, x=Fertility.Rate, y=Life.Exp, color=Region, size=I(2), shape=I(0.7),                               
main = "Ploteo de dispersión de Expectancy vs Fertility en 1960")
```
Ploteo del año 2013
```
qplot(data=merged2013, x=Fertility.Rate, y=Life.Exp, color=Region, size=I(2), shape=I(0.7),                               
main = "Ploteo de dispersión de Expectancy vs Fertility en 2013")
```

## Analisis
En África La esperanza de vida aumentó de 35-50 años a 45-75 años, mientras que la fertilidad se mantiene con un promedio de 4 a 8 hijos.
En Asia Aumentó la esperanza de vida de 50 a 70-80 años y la fertilidad sigue siendo muy dispersa de 1 a 8 hijos en ambas gráficas.
La región de europa aumentó su esperanza de vida mediante avanzaron los años, en cuanto a la fertilidad se mantuvo donde la mayoría de personas tienen de 2 a 4 años.
En middle east aumentó la esperanza de vida de 70 a 80 años y la fertilidad aumentó bastante.
En Oceanía la esperanza de vida aumentó de 60 a 80 años promedio y la fertilidad se mantuvo similar.
En las américas la esperanza de vida aumentó en promedio 10 años y la fertilidad aumentó de 6 a 8 hijos.

## Colaborators
- [Luis Daniel Lopez Valencia](https://github.com/Drani04)
- [Fernando Ordaz Zamora](https://github.com/fernando-123)
