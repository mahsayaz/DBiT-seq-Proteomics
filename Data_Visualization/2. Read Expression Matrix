#Expression Matrix
#Read expression matrix
my_data1 <- Seurat::Read10X(data.dir = dir, gene.column = 1, unique.features = FALSE)
my_data1 <- as.matrix(my_data1)
my_data1 <-t(my_data1)
my_df <- as.data.frame(my_data1)
my_df <- data.frame(X = rownames(my_df), my_df)
my_df$X <- as.character(rownames(my_df))
look <- read.table(paste(dir, "/tissue_positions_list.csv", sep=""), sep =",", header = FALSE, dec =".", stringsAsFactors = F)
my_list <- my_df$X

#Removing the numbers at the end of barcode names
look$V1 <- gsub("\t\\d+", "", look$V1)

#After loading the tissue_positions_list.csv, change the V4 and V3 if the image is flipped
look$V5 <- paste(look$V4, look$V3, sep="x")
new <- look$V5[match(my_list, look$V1)]
tissue_avail <- look$V2[match(my_list, look$V1)]
my_df$X <- new
my_df$tissue_avail <- tissue_avail
data_filtered <- my_df

write.table(my_df, file = 'expression_matrix.tsv', sep = '\t',col.names=TRUE, row.names = FALSE,quote = FALSE)
