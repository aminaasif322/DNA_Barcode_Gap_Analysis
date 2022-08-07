
mos <- read.delim ("A_Total_Table_long_seq_reduced_long_no_taxa_no_digits.tsv", header=TRUE, sep="\t" )


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


