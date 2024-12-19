spotlight_y <- data_filtered %>% select(-c("X", "tissue_avail"))
row.names(spotlight_y) <- data_filtered$X

#scale data of each pixel to sum of 1
spotlight_y$V1 <- spotlight_y$V1/count
spotlight_y$V2 <- spotlight_y$V2/count
spotlight_y$V3 <- spotlight_y$V3/count
spotlight_y$V4 <- spotlight_y$V4/count
#spotlight_y$V5 <- spotlight_y$V5/count
spotlight_y$V6 <- spotlight_y$V6/count
spotlight_y$V7 <- spotlight_y$V7/count
spotlight_y$V8 <- spotlight_y$V8/count
spotlight_y$V9 <- spotlight_y$V9/count
spotlight_y$V10 <- spotlight_y$V10/count
spotlight_y$V11 <- spotlight_y$V11/count
spotlight_y$V12 <- spotlight_y$V12/count

spotlight_y[is.na(spotlight_y)] <- 0

mean_tissues <- as.data.frame(lapply(spotlight_y, mean))



#Generating Spatial Pie Chart
#set the position column(X) as first column and remove the barcode list in data_filtered
spotlight_y <- data_filtered %>% select(-c("X", "tissue_avail"))
row.names(spotlight_y) <- data_filtered$X

#scale data of each pixel to sum of 1
spotlight_y$V1 <- spotlight_y$V1/count
spotlight_y$V2 <- spotlight_y$V2/count
spotlight_y$V3 <- spotlight_y$V3/count
spotlight_y$V4 <- spotlight_y$V4/count
#spotlight_y$V5 <- spotlight_y$V5/count
spotlight_y$V6 <- spotlight_y$V6/count
spotlight_y$V7 <- spotlight_y$V7/count
spotlight_y$V8 <- spotlight_y$V8/count
spotlight_y$V9 <- spotlight_y$V9/count
spotlight_y$V10 <- spotlight_y$V10/count
spotlight_y$V11 <- spotlight_y$V11/count
spotlight_y$V12 <- spotlight_y$V12/count

spotlight_y[is.na(spotlight_y)] <- 0

#spot coordinates
position_xy <- row.names(spotlight_y) %>% as.data.frame() %>% 
  separate(".", into=c("imagecol", "imagerow"), sep="x", remove=FALSE) %>% tibble::column_to_rownames(var=".")
position_xy$imagecol <- as.numeric(position_xy$imagecol)
position_xy$imagerow <- as.numeric(position_xy$imagerow)
pdf(file = paste("Pie Chart - citeseq.pdf",sep =""), width=8.6, height=8.6)
plotSpatialScatterpie(x=position_xy, y=spotlight_y) +
  scale_fill_manual(values =c("#F7DC6F", "#A93226", "#46DFD1", "#76448A","#c90076","#3381c8", "#7f6000", "#ea9999", "#8fce00", "#999999", "#274e13" )) 
dev.off()
