#clustering based on CLR
pbmc          <- CreateSeuratObject(matrix1.data, min.cells = 10, min.features = 3, project = sample1.name)
pbmc <- NormalizeData(pbmc, normalization.method = 'CLR', margin = 2) 
pbmc <- FindVariableFeatures(pbmc, selection.method = "vst", nfeatures = 12)
pbmc <- ScaleData(pbmc)
pbmc <- RunPCA(pbmc, verbose = FALSE)
pbmc <- RunUMAP(pbmc, dims = 1:6, verbose = FALSE)

pbmc <- FindNeighbors(pbmc, dims = 1:6, verbose = FALSE)
pbmc <- FindClusters(pbmc, resolution=0.3, verbose = FALSE)
DimPlot(pbmc, label = TRUE) + NoLegend()

pbmc.markers <- FindAllMarkers(pbmc, only.pos = TRUE, min.pct = 0, logfc.threshold = 0.01)

pbmc <-ScaleData(object=pbmc, features = rownames(pbmc))

top10 <- pbmc.markers %>% group_by(cluster) %>% top_n(n = 5, wt = avg_log2FC)
DoHeatmap(pbmc, features = top10$gene) + scale_fill_gradientn(colors = c("red", "black","green")) 

ident <- Idents(pbmc)
df <- data.frame(ident[])
df1 <-data.frame(X =row.names(df), count= df$ident..)
test <- df1 %>% separate(X, c("A", "B"),  sep = "x")

pdf(file = paste("clustering-CLR.pdf",sep =""), width=8.6, height=8.6)
ggplot(test, aes(x = as.numeric(A), y = as.numeric(B), color=count)) +
  #scale_color_gradientn(colours = c("black", "green")) + 
  #scale_color_gradientn(colours = c("blue","green", "red"),
  #                      oob = scales::squish) +
  ggtitle("UMAP") +
  annotation_custom(g, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  geom_point(shape = 15, size = 3)+
  expand_limits(x = 0, y = 0) +
  scale_x_continuous(name="X", limits = c(NA, NA), expand = expansion(mult = c(-0.013, -0.013))) +
  scale_y_reverse(name="Y", limits = c(NA, NA), expand = expansion(mult = c(-0.013, 0.008))) +
  coord_equal(xlim=c(-1,50),ylim=c(50,0)) +
  theme(plot.title = element_text(hjust = 0.5, size = 25, face = "bold"),
        axis.text=element_text(size=20),
        axis.title=element_text(size=20,face="bold"),
        legend.text=element_text(size=20),
        legend.title = element_blank(),
        #legend.title = element_text(colour="black", size=15, face="bold"),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank())
dev.off()
