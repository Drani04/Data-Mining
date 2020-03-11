?read.csv()

# Method 1: Select the file manually
stats <- read.csv(file.choose())
stats

# Method 2: Set Working Directory and Read Data
getwd()
#windows
setwd("C:\\Users\\username\\Documents\\Rprojects")
#Mac
setwd()
setwd('/home/chris/Documents/itt/Enero_Junio_2020/Mineria_de_datos/DataMining/Dataframes')
getwd()
rm(stats)
stats <- read.csv("Demographic-Data.csv")

#------Exploring the data
stats
is.data.frame(stats) #saber si existen datos cargados
nrow(stats) #numero de filas
ncol(stats) #numero de columnas
head(stats, n=10) #primeras 10 filas
tail(stats, n=8) #ultimas 8 filas
str(stats) #estructura de la base de datos
summary(stats) #resumen del contenido

#------Using the $ sing
stats #muestra el contenido
head(stats) #muestra filas
stats[3,3] #selecciona un dato de la tabla por coordenadas
stats[3, "Birth.rate"] #selecciona un dato de la tabla por coordenadas
typeof(stats) #menciona el tipo de dato de la variable stats
stats$Internet.users #muestra los internet users
stats$Internet.users[2] #muestra la segunda posicion del primer registro
stats[ , "Internet.users"] #muestra los internet users
levels(stats$Income.Group) #muestra los diferentes tipos de income
#------Basic operations with dataframes-----------------------
stats[1:10, ] #subsetting despliega los registros del 1 al 10
stats[3:9, ] #despliega los registros del 3 al 9
stats[c(4, 100),] #despliega los registros 4 y 100
is.data.frame(stats[1, ]) #muestra si es data frame o no
is.data.frame(stats[,1]) #muesta si es data frame o no
is.data.frame(stats[,1, drop=F]) #muestra si es data frame o no
stats[,1, drop=F] #muestra registros que son dataframe
#-------Multiply columns
stats$Birth.rate * stats$Internet.users #multiplica las columnas
stats$Birth.rate + stats$Internet.users #suma las columnas
#-------Add Columns
head(stats) #muestra las columnas
stats$BRbyIU <- stats$Birth.rate * stats$Internet.users #agrega columna brbyiu
head(stats)
#------Thigs to know
stats$xyz <- 1:5 #agrega columna con datos del 1 al 5
head(stats, n=12) #muestra 12 registros
#------Remove columns
head(stats)
stats$BRbyIU <- NULL #elimina columna
stats$xyz <- NULL #elimina columna
#------Filtering Data Frames -----------------------
head(stats) #muestra tabla
filter <- stats$Internet.users < 2 #TRUE muestra con un true los usuarios que sean menores a 2
filter #despliega el resultado de arriba
stats[filter,] #muestra lo de arriba con información
stats[stats$Birth.rate > 40,] #muestra los registros donde birth rate sea mayor a 40
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,] #muestra donde birthrate sea mayor a 40 y internet user menor a 2
stats[stats$Income.Group == "High income",] #muestra los registros donde income group sea high income
levels(stats$Income.Group) #muestra los diferentes tipos de income group
#Practice
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

#------Intro to qplot()----------------------
#install.packages("ggplot2")
library(ggplot2)  #ejecutar libreria ggplot2
?qplot
qplot(data=stats, x=Internet.users) #despliega grafica con los datos de stats usando internet users
qplot(data=stats, x=Income.Group, y=Birth.rate) #despliega grafica con income group y birth rate
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(5)) #size= tamaño de los puntos
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(5), color=I("green")) # color=color de los puntos
qplot(data=stats, x=Income.Group, y=Birth.rate, geom="boxplot") #geom= forma de la grafica

#---------Visualizing what we need -----------------
qplot(data=stats, x=Internet.users, y=Birth.rate) #despliega grafica de dispersion
qplot(data=stats, x=Internet.users, y=Birth.rate, color=I("blue"), size=I(1)) #color= color size=tamaño
qplot(data=stats, x=Internet.users, y=Birth.rate, color=Income.Group, size=I(1)) #asigna un color a cada tipo de income


#--------Requirements changed
Countries_2012_Dataset <- c("Aruba","Afghanistan","Angola","Albania","United Arab Emirates","Argentina","Armenia","Antigua and Barbuda","Australia","Austria","Azerbaijan","Burundi","Belgium","Benin","Burkina Faso","Bangladesh","Bulgaria","Bahrain","Bahamas, The","Bosnia and Herzegovina","Belarus","Belize","Bermuda","Bolivia","Brazil","Barbados","Brunei Darussalam","Bhutan","Botswana","Central African Republic","Canada","Switzerland","Chile","China","Cote d'Ivoire","Cameroon","Congo, Rep.","Colombia","Comoros","Cabo Verde","Costa Rica","Cuba","Cayman Islands","Cyprus","Czech Republic","Germany","Djibouti","Denmark","Dominican Republic","Algeria","Ecuador","Egypt, Arab Rep.","Eritrea","Spain","Estonia","Ethiopia","Finland","Fiji","France","Micronesia, Fed. Sts.","Gabon","United Kingdom","Georgia","Ghana","Guinea","Gambia, The","Guinea-Bissau","Equatorial Guinea","Greece","Grenada","Greenland","Guatemala","Guam","Guyana","Hong Kong SAR, China","Honduras","Croatia","Haiti","Hungary","Indonesia","India","Ireland","Iran, Islamic Rep.","Iraq","Iceland","Israel","Italy","Jamaica","Jordan","Japan","Kazakhstan","Kenya","Kyrgyz Republic","Cambodia","Kiribati","Korea, Rep.","Kuwait","Lao PDR","Lebanon","Liberia","Libya","St. Lucia","Liechtenstein","Sri Lanka","Lesotho","Lithuania","Luxembourg","Latvia","Macao SAR, China","Morocco","Moldova","Madagascar","Maldives","Mexico","Macedonia, FYR","Mali","Malta","Myanmar","Montenegro","Mongolia","Mozambique","Mauritania","Mauritius","Malawi","Malaysia","Namibia","New Caledonia","Niger","Nigeria","Nicaragua","Netherlands","Norway","Nepal","New Zealand","Oman","Pakistan","Panama","Peru","Philippines","Papua New Guinea","Poland","Puerto Rico","Portugal","Paraguay","French Polynesia","Qatar","Romania","Russian Federation","Rwanda","Saudi Arabia","Sudan","Senegal","Singapore","Solomon Islands","Sierra Leone","El Salvador","Somalia","Serbia","South Sudan","Sao Tome and Principe","Suriname","Slovak Republic","Slovenia","Sweden","Swaziland","Seychelles","Syrian Arab Republic","Chad","Togo","Thailand","Tajikistan","Turkmenistan","Timor-Leste","Tonga","Trinidad and Tobago","Tunisia","Turkey","Tanzania","Uganda","Ukraine","Uruguay","United States","Uzbekistan","St. Vincent and the Grenadines","Venezuela, RB","Virgin Islands (U.S.)","Vietnam","Vanuatu","West Bank and Gaza","Samoa","Yemen, Rep.","South Africa","Congo, Dem. Rep.","Zambia","Zimbabwe")
Codes_2012_Dataset <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BMU","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYM","CYP","CZE","DEU","DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GRL","GTM","GUM","GUY","HKG","HND","HRV","HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ISR","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KHM","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LIE","LKA","LSO","LTU","LUX","LVA","MAC","MAR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","MWI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PHL","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","SLE","SLV","SOM","SRB","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYC","SYR","TCD","TGO","THA","TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR","VNM","VUT","PSE","WSM","YEM","ZAF","COD","ZMB","ZWE")
Regions_2012_Dataset <- c("The Americas","Asia","Africa","Europe","Middle East","The Americas","Asia","The Americas","Oceania","Europe","Asia","Africa","Europe","Africa","Africa","Asia","Europe","Middle East","The Americas","Europe","Europe","The Americas","The Americas","The Americas","The Americas","The Americas","Asia","Asia","Africa","Africa","The Americas","Europe","The Americas","Asia","Africa","Africa","Africa","The Americas","Africa","Africa","The Americas","The Americas","The Americas","Europe","Europe","Europe","Africa","Europe","The Americas","Africa","The Americas","Africa","Africa","Europe","Europe","Africa","Europe","Oceania","Europe","Oceania","Africa","Europe","Asia","Africa","Africa","Africa","Africa","Africa","Europe","The Americas","The Americas","The Americas","Oceania","The Americas","Asia","The Americas","Europe","The Americas","Europe","Asia","Asia","Europe","Middle East","Middle East","Europe","Middle East","Europe","The Americas","Middle East","Asia","Asia","Africa","Asia","Asia","Oceania","Asia","Middle East","Asia","Middle East","Africa","Africa","The Americas","Europe","Asia","Africa","Europe","Europe","Europe","Asia","Africa","Europe","Africa","Asia","The Americas","Europe","Africa","Europe","Asia","Europe","Asia","Africa","Africa","Africa","Africa","Asia","Africa","Oceania","Africa","Africa","The Americas","Europe","Europe","Asia","Oceania","Middle East","Asia","The Americas","The Americas","Asia","Oceania","Europe","The Americas","Europe","The Americas","Oceania","Middle East","Europe","Europe","Africa","Middle East","Africa","Africa","Asia","Oceania","Africa","The Americas","Africa","Europe","Africa","Africa","The Americas","Europe","Europe","Europe","Africa","Africa","Middle East","Africa","Africa","Asia","Asia","Asia","Asia","Oceania","The Americas","Africa","Europe","Africa","Africa","Europe","The Americas","The Americas","Asia","The Americas","The Americas","The Americas","Asia","Oceania","Middle East","Oceania","Middle East","Africa","Africa","Africa","Africa")
#se creo bd nueva
#--------- Creating Data Frames
mydf <- data.frame(Country= Countries_2012_Dataset, Code= Codes_2012_Dataset,
                   Region= Regions_2012_Dataset)
head(mydf) #primeros 6 renglones
tail(mydf) #ultimos 3 renglones
summary(mydf) #resumen 

#---------- Marging(unir) Data Frames
head(stats)
head(mydf)
merged <- merge(stats, mydf, by.x = "Country.Code", by.y = "Code") #derecha,izquierda eje x y eje y
head(merged)

merged$Country <- NULL #elimina columna country
str(merged)
tail(merged)

#----------Visualizing With new Split
qplot(data = merged, x = Internet.users, y = Birth.rate,
      color = Region, size=I(3), shape=I(19), alpha =I(.4), 
      main = "Birth Rate vs Internet Users by Country")
#shape 0-25 formas
#alpha 0-1 transparencia
#main for adding title to the plot

#----------Outcome
#1. Importing Data into R
#2. Exploring Datasets: head(), tail(), summary(), str()
#3. Using the $ sing
#4. Basic operations with Data Frames
#5. Filtering a Date Frame
#6. Introduction to qplot
#7. Visualizing with qplot: Part I
#8. Buildign Data Frames: data.frame()
#9. Marging Data Frames: marge()
#10. Visualizing with qplot: Part II
