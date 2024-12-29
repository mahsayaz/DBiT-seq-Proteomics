# Assuming your expression matrix is stored in the variable 'data_filtered'
# Replace 'V13' with the actual column name containing unmapped proteins

# Identify the column index of unmapped proteins
unmapped_index <- which(colnames(data_filtered) == "V13")

#If there is any of ADTs that we want to get rid of: 
#remove V5 (Thy1)
thy1_index <- which(colnames(data_filtered) == "V5")

# Remove the column corresponding to unmapped/unwanted proteins
data_filtered <- data_filtered[, -unmapped_index]
data_filtered <- data_filtered[, -thy1_index]

# Save the modified expression matrix
write.table(data_filtered, file = 'expression_matrix_filtered.tsv', sep = '\t', col.names = TRUE, row.names = FALSE, quote = FALSE)



#If we made the expression matrix using the "tissue_positions_list.csv" file form AtlasXBrowser
#Data with tissue_avail==1
#Add %>% filter(tissue_avail==1) to keep only the pixel with tissue ON
data_filtered <- data_filtered %>% filter(tissue_avail==1)

#make count
count <- rowSums(data_filtered[,2:(ncol(data_filtered)-1)])
data_filtered_binary <- data_filtered[,2:(ncol(data_filtered)-1)] %>% mutate_all(as.logical)
gene_count <- rowSums(data_filtered_binary)

#create test for the panel generation
test <- data_filtered %>% separate("X", c("A", "B"),  sep = "x")
