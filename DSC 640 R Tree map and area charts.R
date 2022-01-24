##Import required packages
library('magrittr')
library('readxl')
library('ggplot2')
library('treemap')
library("treemap")
library("portfolio")

##View Working Directory

getwd()

##Read in csv file
data <- read.csv("unemployement-rate-1948-2010.csv")

##View Data
head(data)

##Create treemap
treemap(data,
        index=c("Value","Year"),
        vSize = "Year",
        vColor= "Period", 
        type="categorical",
        palette = "Set1",  
        title="Unemployment by Year",
        fontsize.title = 14 
)

##Create Area Chart

ggplot2::ggplot(data, ggplot2::aes(x=Year , y=`Value`)) +
  ggplot2::geom_area( fill='blue', alpha=.2) +
  ggplot2::geom_line() +
  ggplot2::ggtitle('Unemployment by Year')

##Create Stacked Area Chart

ggplot2::ggplot(data, ggplot2::aes(x=Year, y=Value, fill=Period)) + 
  ggplot2::geom_area()