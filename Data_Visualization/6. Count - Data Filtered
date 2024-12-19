data_filtered <- temp1#[temp1$X %in% x,]
write.table(data_filtered, file = 'Filtered_matrix_correct.tsv', sep = '\t',col.names=TRUE, row.names = FALSE,quote = FALSE)


##read expression matrix
my_data <- read.table(file = 'Filtered_matrix_correct.tsv', sep = '\t', header = TRUE, stringsAsFactors=FALSE)
data_filtered <- my_data

#calculate the sum of values in each row, but only for a subset of columns in the data_filtered data frame.
# Select from the 2nd column to the second-to-last column
count <- rowSums(data_filtered[, 2:(ncol(data_filtered) - 1)])

# Create a binary matrix, excluding the first and last columns
data_filtered_binary <- data_filtered[, 2:(ncol(data_filtered) - 1)] %>% mutate_all(as.logical)

# Calculate the number of non-zero (TRUE) values for each row
gene_count <- rowSums(data_filtered_binary)

#log_count <- log(count)
