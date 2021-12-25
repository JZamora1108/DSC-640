# Import required packages
library('magrittr')
library('readxl')
library('ggplot2')

## View Working Directory

getwd()

# Import Excel
world_pop = read_excel("world-population.xlsm")

# View data
print(world_pop)

options(repr.plot.width = 4, repr.plot.height = 3)

ggplot() + geom_line(aes(y = Population, x = Year),
                     data = world_pop)

ggplot() + geom_step(aes(y = Population, x = Year),
                     data = world_pop)