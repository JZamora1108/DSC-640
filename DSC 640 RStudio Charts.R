getwd()
# Import Required Packages
library('magrittr')
library('readxl')
library('ggplot2')

# Import Excel
obama = read_excel("obama-approval-ratings.xls")


# Examine Excel
print(obama)

# Print and Set Up Bar Chart
obama %>%
  dplyr::select(Issue, Disapprove) %>%
  dplyr::arrange(-Disapprove) %>%
  dplyr::mutate(SortOrder = factor(Issue, Issue)) %>% 
  ggplot2::ggplot(ggplot2::aes(x=SortOrder, y=Disapprove, fill=Issue)) +
  ggplot2::geom_bar(stat='identity', color='black') + 
  ggplot2::xlab('Issue') + ggplot2::ylab('Dissapproval Count') +
  ggplot2::ggtitle('Disapproval Rating of Obama')

# Stacked Bar Chart
data_long = obama %>%
  tidyr::gather('Reaction','Ratings', Approve, Disapprove, None)

# Plot stacked
ggplot2::ggplot(data_long, ggplot2::aes(x = Issue, y = Ratings, fill = Reaction)) + 
  ggplot2:: geom_bar(stat='identity') + 
  ggplot2::theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
  ggplot2::scale_fill_brewer(palette = "Accent")

#Pie Chart

data_long %>%
  dplyr::filter(Issue=='Economy') %>%
  ggplot2::ggplot(ggplot2::aes(x="", y=Ratings, fill=Reaction))+
  ggplot2::geom_bar(width = 1, stat = 'identity') +
  ggplot2::coord_polar('y', start=0) + 
  ggplot2::geom_text(aes(label = Ratings), position = position_stack(vjust = 0.5)) +
  ggplot2::ggtitle(label = 'Obama Economy Ratings') +
  ggplot2::scale_fill_brewer(palette='Blues') + 
  ggplot2::theme(axis.line = element_blank(),
                 axis.text = element_blank(),
                 axis.ticks = element_blank(),
                 plot.title = element_text(hjust = 0.5))

# Donut Chart

data_long %>%
  dplyr::filter(Issue=='Terrorism') %>%
  dplyr::mutate(ymax=cumsum(Ratings),
                ymin=c(0,ymax[1:length(ymax)-1])) %>%
  ggplot2::ggplot(ggplot2::aes(fill=Reaction, ymax=ymax, ymin=ymin, xmax=4, xmin=3)) +
  ggplot2::geom_rect() +
  ggplot2::coord_polar(theta='y') +
  ggplot2::xlim(c(0, 4)) +
  ggplot2::theme(panel.grid=element_blank()) +
  ggplot2::theme(axis.text=element_blank()) +
  ggplot2::theme(axis.ticks=element_blank()) +
  ggplot2::annotate('text', x = 0, y = 0, label = 'Obama Terrorism Rathings') +
  ggplot2::labs(title='')