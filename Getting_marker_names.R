# a short script to get unique names of molecular markers and sorting them alphabetically. So that we can view them and write them into excel to make a list exact into the same format which is required as input to create_fastas() function of MACER.


#red in the file 
mos <- read.delim ("A_Total_Table.tsv", header=TRUE, sep="\t" )


#extracting molecular marker names for next step in MACER   
#extracting required columns 

mol <- as.data.frame(mos$Gene)
mol_mark <- as.data.frame(mos$Genus)

#binding two columns in one dataframe

mol_mark2 <- cbind(mol, mol_mark)

#removing unnecessary objects from environment

rm(mol, mol_mark)

#changing column name
colnames(mol_mark2)[which(names(mol_mark2) == "mos$Gene")] <- "Gene"
colnames(mol_mark2)[which(names(mol_mark2) == "mos$Genus")] <- "Genus"

#removing duplicate marker names 

unique_mark <- unique(mol_mark2, by = "Gene")

#sorting them alphabetically

unique <- unique_mark[order(unique_mark$Gene),]

rm(unique_mark)


