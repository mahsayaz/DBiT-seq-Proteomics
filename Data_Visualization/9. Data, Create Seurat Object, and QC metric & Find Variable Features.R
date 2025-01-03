##Data
#change filename1 to name of txt file you want to load
data1 <- read.table("Filtered_matrix_correct.tsv", header = TRUE, sep = "\t") #row.names = 1

# Make the first column values unique
data1[, 1] <- make.unique(as.character(data1[, 1]))

# Set the first column as row names after making it unique
rownames(data1) <- data1[, 1]

# Remove the first column from the data frame (since it's now used as row names)
data1 <- data1[, -1]

#verify uniqueness
anyDuplicated(rownames(data1))

data3 <- data.frame(X = rownames(data1), data1)
temp1 <- data3 %>% separate(X, c("A", "B"),  sep = "x")

# Preview the result
print(head(temp1))



##Create Seurat Object
temp1$A = NULL
temp1$B = NULL
temp1$tissue_avail = NULL
data2 <- t(temp1)
sample1.name <- "NIH90"
matrix1.data <- Matrix(as.matrix(data2), sparse = TRUE)
pbmc <- CreateSeuratObject(matrix1.data, min.cells = 10, min.features = 5, project = sample1.name)



##QC metrics and Find Variable Features
VlnPlot(pbmc, features = c("nFeature_RNA", "nCount_RNA"), ncol = 2, group.by="orig.ident")
