##Import required packages
library('magrittr')
library('readxl')
library('ggplot2')


##View Working Directory

getwd()

##Read in csv file
data <- read.csv("birth-rates-yearly.csv")

##View Data
head(data)

##Create scatter plot
plot(x = data$year, 
     y = data$rate,
     xlab = "Year",
     ylab = "Rate",
     main = "Birth Rate by Year")

##Create bubble plot
ggplot(data, aes(x = year, y = rate, size = year)) +
  geom_point(alpha = 0.5)

##Create density plot
ggplot(data, aes(x = year)) +
  geom_density(alpha = 0.5)