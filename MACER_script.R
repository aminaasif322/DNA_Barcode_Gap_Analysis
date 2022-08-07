#install.packages("devtools")
library(devtools)
#devtools::install_github("rgyoung6/MACER")
library(MACER)
auto_seq_download()
create_fastas()
align_to_ref(op = 10)
barcode_clean()


