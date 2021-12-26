
options( show.error.messages=F, error = function () { cat( geterrmessage(), file=stderr() ); q( "no", 1, F ) } )

loc <- Sys.setlocale("LC_MESSAGES", "en_US.UTF-8")

id_type <- "ENSEMBL"
organism <- "Hs"
output_cols <- "ENSEMBL,ENTREZID,SYMBOL,GENENAME"
file_has_header <- FALSE
remove_dups <- TRUE

input <- read.table('/corral4/main/objects/0/5/5/dataset_05532803-5f22-451f-8471-57987bdc7182.dat', header=file_has_header, sep="\t", quote="")
ids <- as.character(input[, 1])

if(organism == "Hs"){
    suppressPackageStartupMessages(library(org.Hs.eg.db))
    db <- org.Hs.eg.db
} else if (organism == "Mm"){
    suppressPackageStartupMessages(library(org.Mm.eg.db))
    db <- org.Mm.eg.db
} else if (organism == "Dm"){
    suppressPackageStartupMessages(library(org.Dm.eg.db))
    db <- org.Dm.eg.db
} else if (organism == "Dr"){
    suppressPackageStartupMessages(library(org.Dr.eg.db))
    db <- org.Dr.eg.db
} else if (organism == "Rn"){
    suppressPackageStartupMessages(library(org.Rn.eg.db))
    db <- org.Rn.eg.db
} else {
    cat(paste("Organism type not supported", organism))
}

cols <- unlist(strsplit(output_cols, ","))
result <- select(db, keys=ids, keytype=id_type, columns=cols)

if(remove_dups) {
    result <- result[!duplicated(result$ENSEMBL),]
}

write.table(result, file='/corral4/main/jobs/039/255/39255278/outputs/galaxy_dataset_4877ee9c-1c07-48df-aa3a-718b7bed825f.dat', sep="\t", row.names=FALSE, quote=FALSE)

    
