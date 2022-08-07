


filter_no_taxa<-function(fileLoc = NULL){
  #Get the initial working directory
  start_wd <- getwd()
  on.exit(setwd(start_wd))
  #load in the output table
  if (is.null(fileLoc)){
    print(paste0("Select a file"))
    fileLoc <- file.choose()
  }
  setwd(dirname(fileLoc))
  
  #Read in the BLAST results for the file in this loop
  mos <- read.delim(fileLoc, header = TRUE, sep = "\t")
  
  mos <- mos[mos$Flags != 'No_Taxa', ]
  write.table(as.data.frame(mos), file = paste0(sub("\\..*","",as.vector(fileLoc)), "_long_no_taxa.tsv"), row.names = FALSE, col.names=TRUE, append = FALSE, sep="\t", quote = FALSE)
  
}