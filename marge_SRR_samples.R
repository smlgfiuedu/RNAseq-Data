setwd() # set working directory

library(edgeR)
library(tidyverse)

list_of_files <- list.files(path =, pattern = )

data_df <- 
  readDGE(list_of_files, path= "", columns=c(1,2), header = FALSE) 

gene_count_df <- data.frame(data_df$counts)


write.csv(
  gene_count_df, path = 
)

gene_count <- read.csv()

annotated_IDs <- read.delim() %>% # file contain gene name
  select()

gene_info <- 
  cbind(annotated_IDs, gene_count) %>% 
  select()


write.csv(
  file_name,
  path = 
)
