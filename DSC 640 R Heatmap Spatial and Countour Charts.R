##Import required packages
library('magrittr')
library('readxl')
library('ggplot2')
library('ggmap')
library('usmap')

getwd()

##Read in csv file
costco <- read.csv("costcos-geocoded.csv")
ppg <- read.csv("ppg2008.csv")


##View Data Costco
head(costco)

##View Data ppg
head(ppg)

##Heatmap for ppg
heatmap(as.matrix(ppg[,2:ncol(ppg)]))

##Spatial Map for costco

##Create a statewide count of Costco

costco_sum <- costco %>% 
  dplyr::mutate(state = State) %>% 
  dplyr::group_by(state) %>%
  dplyr::summarise(store_count = dplyr::n())

##plot costco stores nationwide

options(repr.plot.width = 4, repr.plot.height = 3)

plot_usmap(data = costco_sum, values = "store_count", lines = "white") + 
  scale_fill_continuous(name = "Number of Costco Stores", label = scales::comma) + 
  theme(legend.position = "right")

##Create Countour Chart

ggplot(ppg, aes(x=FTM, y=FTA))+
  theme_bw()+
  geom_point(alpha=0.1, col='green')+
  geom_density2d(color='black')+
  ggtitle('Contour Chart')+
  theme(plot.title = element_text(hjust = 0.5))+
  labs(x='Free Throws Made', y='Free Throws Attempted')