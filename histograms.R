
library(tidyverse)  
library(ggplot2)
library(ggpubr)
library(gridExtra)
library(grid)


#---------------------
aphis <- read.csv("aphis.csv")

#run following command to get data ready for plots 
gg_aphis <- aphis %>% pivot_longer(cols=everything()) 

colnames(gg_aphis) <- c("Group", "Values")

#convert into percentage
gg_aphis$Values <- gg_aphis$Values*100
#remove na's 
p_2aphis <- gg_aphis[rowSums(is.na(gg_aphis[ , 2])) == 0, ]


# Change histogram plot line colors by groups
p_aphis <- ggplot(p_2aphis, aes(x=Values, color=Group)) +
  geom_histogram(fill="white") +
  xlab("Frequency") +
  ggtitle("Aphis")+
  xlim(0,15) +
  ylim(0,40)
p_aphis



#----------------
culex <- read.csv("culex.csv")

#run following command to get data ready for plots 
gg_culex <- culex %>% pivot_longer(cols=everything()) 

colnames(gg_culex) <- c("Group", "Values")

#convert to as.numeric 
gg_culex$Values <- as.numeric(gg_culex$Values)
#convert into percentage
gg_culex$Values <- gg_culex$Values*100
#remove na's 
p_2culex <- gg_culex[rowSums(is.na(gg_culex[ , 2])) == 0, ]


# Change histogram plot line colors by groups
p_culex <- ggplot(p_2culex, aes(x=Values, color=Group)) +
  geom_histogram(fill="white") +
  xlab("Frequency") +
  ggtitle("Culex") +
  xlim(0,15) +
  ylim(0,40)
p_culex

#--------------------

theme_update(plot.title = element_text(hjust = 0.5))

figure <- ggarrange(p_culex + rremove("ylab") + rremove("xlab"), p_aphis + rremove("ylab") + rremove("xlab")) # remove axis labels from plots

annotate_figure(figure, left = textGrob("Frequency", rot = 90, vjust = 1, gp = gpar(cex = 1.3)),
                bottom = textGrob("Density", gp = gpar(cex = 1.3)))


