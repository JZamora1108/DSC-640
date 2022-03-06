##Import required packages
library('magrittr')
library('dplyr')
library('ggplot2')
library('plotly')

##View Working Directory

getwd()

##Read in csv file
birthrate <- read.csv("birth-rate.csv")

education <- read.csv("education.csv")

##View Data
head(birthrate)

##View Data
head(education)

##Remove the lead x in the years
colnames(birthrate) <- gsub("X", "", colnames(birthrate))

colnames(birthrate)

##Set up Histogram 

education %>% ggplot(aes(x = math)) + geom_histogram()

##Box plot to show comparison of birth rates between United States and Italy

birthrate %>%
ggplot(aes("United States", "Italy")) + geom_boxplot()

##Education bullet chart set up

crime_bullet <- crime %>% 
  dplyr::filter(stringr::str_trim(state, "both") == "United States") %>% 
  dplyr::select(c(state, burglary))

bulletgraph(x=crime_bullet$burglary,ref=650,limits=c(0,500,750,1000),
            name= "USA Crime metrics",subname="Burglary",
            col="steelblue4",shades="firebrick")

##Create bubble plot
ggplot(education, aes(x = percent_graduates_sat
, y = pupil_staff_ratio
, size = percent_graduates_sat
)) +
  geom_point(alpha = 0.5)