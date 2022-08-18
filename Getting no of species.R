#looking for no of species 

#for mosquitoes

library(tidyverse)
ano_fasta <- read.delim("Anopheles_COI_MAFFT_Trimmed_data_table.dat")
ano_fas2 <- ano_fasta %>% filter(ano_fasta$Species == "quadrimaculatus")

#we will see no of rows as each row has unique records
nrow(ano_fas2)

#for culi

culi_fasta <- read.delim("Culiseta_COI_MAFFT_Trimmed_data_table.dat")
culi_fas2 <- culi_fasta %>% filter(culi_fasta$Species == "melanura")
nrow(culi_fas2)

#for culex

culex_fasta <- read.delim("Culex_COI_MAFFT_Trimmed_data_table.dat")
culex_fas2 <- culex_fasta %>% filter(culex_fasta$Species == "restuans")
nrow(culex_fas2)

#for ochlerotatus

ochle_fasta <- read.delim("Ochlerotatus_COI_MAFFT_Trimmed_data_table.dat")
ochle_fas2 <- ochle_fasta %>% filter(ochle_fasta$Species == "dorsalis")
nrow(ochle_fas2)



### for aphids 

#for aphis

aphi_fasta <- read.delim("Aphis_COI_5P_MAFFT_Trimmed_data_table.dat")
aphi_fas2 <- aphi_fasta %>% filter(aphi_fasta$Species == "glycines")
nrow(aphi_fas2)


#for brachy

brachy_fasta <- read.delim("Brachycaudus_COI_5P_MAFFT_Trimmed_data_table.dat")
brachy_fas2 <- brachy_fasta %>% filter(brachy_fasta$Species == "persicae")
nrow(brachy_fas2)

#for capi

capi_fasta <- read.delim("Capitophorus_COI_5P_MAFFT_Trimmed_data_table.dat")
capi_fas2 <- capi_fasta %>% filter(capi_fasta$Species == "elaeagni")
nrow(capi_fas2)




