#install packages 

install.packages("ggplot2")
install.packages("gridExtra")

#load libraries 

library(ggplot2)
library(gridExtra)

#aphid_visualization
#-------------------------------------
data_aphids <- read.csv("vis_aphids.csv")

#lets remove NA's
final_data_aphids <- data_aphids[rowSums(is.na(data_aphids[ , 8:9])) == 0, ]
final_data_aphids_percent <- final_data_aphids

#convert into numeric class 
final_data_aphids$Intraspecific <- as.numeric(final_data_aphids$Intraspecific)
final_data_aphids$Interspecific <- as.numeric(final_data_aphids$Interspecific)

#convert variation as percentages
final_data_aphids_percent$Interspecific <- final_data_aphids$Interspecific*100
final_data_aphids_percent$Intraspecific <- final_data_aphids$Intraspecific*100

#Dotplot through GGPLOT

p_aphids <- ggplot(final_data_aphids_percent, aes(x= Intraspecific, y= Interspecific))
p_aphids2 <- p_aphids+  geom_point(colour = "blue", shape = 1) + theme_gray() + 
  labs(y= "Minimum Interspecific Distance (%)", 
       x = "Maximum Intraspecific Distance (%)")+ 
  labs(title = "DNA Barcode Gap Analysis Of Aphids") +
  geom_abline(intercept = 0, slope = 1, size = 0.5, color = "red") +
  xlim(0,30) +
  ylim(0,30)


#mos_visualization
#----------------------------------------------
data_mos <- read.csv("mos_vis.csv")

#lets remove NA's
final_data_mos <- data_mos[rowSums(is.na(data_mos[ , 4:9])) == 0, ]
final_data_mos_percent <- final_data_mos

#change intra and interspecific variation from character to numeric
final_data_mos$Intraspecific <- as.numeric(final_data_mos$Intraspecific)
final_data_mos$Interspecific <- as.numeric(final_data_mos$Interspecific)

#convert variation as percentages
final_data_mos_percent$Interspecific <- final_data_mos$Interspecific*100
final_data_mos_percent$Intraspecific <- final_data_mos$Intraspecific*100

#Dotplot through GGPLOT

p_mos <- ggplot(final_data_mos_percent, aes(x= Intraspecific, y= Interspecific))
p_mos2 <- p_mos +  geom_point(colour = "blue", shape = 1) + theme_gray() + 
  labs(y= "Minimum Interspecific Distance (%)", 
       x = "Maximum Intraspecific Distance (%)")+ 
  labs(title = "DNA Barcode Gap Analysis Of Mosquitoes") +
  geom_abline(intercept = 0, slope = 1, size = 0.5, color = "red") +
  xlim(0,30)+
  ylim(0,30)

#plot both plots side by side 

grid.arrange(p_aphids2, p_mos2, ncol=2)

