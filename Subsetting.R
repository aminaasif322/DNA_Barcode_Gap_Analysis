#Subsetting datasets based on of intrerspecific divergence, as we are looking for species who falls between 4-6% which is cutoff for DNA barcode gap analysis in terms of interspecific differences. 

#subsetting for aphids 
#selecting range of percentages so that we can have access to only those records 
aphids <- final_data_aphids_percent$Interspecific >= 4 & final_data_aphids_percent$Interspecific <=6

subset_aphids <- final_data_aphids_percent[aphids, ]

# have a look
subset_aphids$Interspecific

view(subset_aphids)

#subsetting for mosquitoes 
#selecting range of percentages so that we can have access to only those records
mos <- final_data_mos_percent$Interspecific >= 4 & final_data_mos_percent$Interspecific <=6

subset_mos <- final_data_mos_percent[mos, ]

#have a look 
subset_mos$Interspecific

view(subset_mos)

#looking for instances that below mentioned no of species is present in data frame and in this way we can say that the inter and intra distances for this species are calculated based on its this much instances, which eventually indicates that how incomplete sampling is.

aphis <- read.delim("Aphis_COI_5P_MAFFT_Trimmed_data_table.dat")
aphis2 <- aphis %>% filter(aphis$Species == "rumicis")

#checking no of NA's in both datasets as it represents for how much species we got no result in terms of barcode gap

sum(apply(data_mos, 1, anyNA))
sum(!complete.cases(data_aphids))

# subset dataframe to see no of records who has maximum intraspecific distance less than cutoff 2%
mos2percent <- final_data_mos_percent$Intraspecific < 2
subset_mos2percent <- final_data_mos_percent[mos2percent, ]

#check for between barcode gap
mos6 <- final_data_mos_percent$Barcode_Gap == "YES"

subset_mos6 <- final_data_mos_percent[mos6, ]

nrow(subset_mos6)

