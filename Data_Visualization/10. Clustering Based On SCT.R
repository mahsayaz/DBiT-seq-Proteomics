#clustering based on SCT
pbmc <- PercentageFeatureSet(pbmc, pattern = "^MT-", col.name = "percent.mt")
pbmc <- SCTransform(pbmc, verbose = FALSE)#, vars.to.regress = "percent.mt"
pbmc <- RunPCA(pbmc, verbose = FALSE)
pbmc <- RunUMAP(pbmc, dims = 1:8, verbose = FALSE)

pbmc <- FindNeighbors(pbmc, dims = 1:8, verbose = FALSE)
pbmc <- FindClusters(pbmc, resolution=0.32, verbose = FALSE)
DimPlot(pbmc, label = TRUE) + NoLegend()

pbmc.markers <- FindAllMarkers(pbmc, only.pos = TRUE, min.pct = 0, logfc.threshold = 0.01)

pbmc <-ScaleData(object=pbmc, features = rownames(pbmc))

top10 <- pbmc.markers %>% group_by(cluster) %>% top_n(n = 5, wt = avg_log2FC)
DoHeatmap(pbmc, features = top10$gene) + scale_fill_gradientn(colors = c("red", "black","green")) 

#associates each cell ID with its respective cluster or identity
ident <- Idents(pbmc)
df <- data.frame(ident[])
df1 <-data.frame(X =row.names(df), count= df$ident..)
test <- df1 %>% separate(X, c("A", "B"),  sep = "x")

#dot size = 3

g <- rasterGrob(imported_raster, width=unit(1,"npc"), height=unit(1,"npc"), interpolate = FALSE)
pdf(file = paste("clustering_SCT.pdf",sep =""), width=8.6, height=8.6)
ggplot(test, aes(x = as.numeric(A), y = as.numeric(B), color=count)) +
  #scale_color_gradientn(colours = c("black", "green")) + 
  #scale_color_gradientn(colours = c("blue","green", "red"),
  #                      oob = scales::squish) +
  ggtitle("UMAP") +
  annotation_custom(g, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  geom_point(shape = 15, size = 2.5)+
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




#Combine Clusters on SCT
# Assuming the clusters have already been identified
# Let's combine clusters 0 and 2 and 3 and create a new combined identity

# First, extract the identities of the clusters
current.cluster.ids <- Idents(pbmc)

# Create a vector that will serve as the new identity, keeping all other clusters the same
new.cluster.ids <- as.character(current.cluster.ids)

# Combine clusters 0, 2, and 3 into a new combined cluster
new.cluster.ids[current.cluster.ids == 3] <- "Macrophages"
new.cluster.ids[current.cluster.ids == 5] <- "Macrophages"


new.cluster.ids[current.cluster.ids == 2] <- "Contractile Myofibroblasts"
new.cluster.ids[current.cluster.ids == 4] <- "Contractile Myofibroblasts"

new.cluster.ids[current.cluster.ids == 1] <- "Epithelials"

new.cluster.ids[current.cluster.ids == 0] <- "Pro-inflammatory Fibroblasts"

new.cluster.ids[current.cluster.ids == 6] <- "Basal Epithelial Cells"


# Set the new identities back to the Seurat object
pbmc <- SetIdent(pbmc, value = new.cluster.ids)

# Now, re-plot the combined clusters
DimPlot(pbmc, label = TRUE) + NoLegend()

# Optional: Run a marker analysis on the combined clusters
combined.markers <- FindAllMarkers(pbmc, only.pos = TRUE, min.pct = 0, logfc.threshold = 0.01)

# Optional: Save the updated clustering plot with the combined clusters
pdf(file = "clustering_combined_clusters.pdf", width=8.6, height=8.6)
DimPlot(pbmc, label = TRUE) + NoLegend()
dev.off()

#Heatmap
pdf(file = "Heatmap_combined_clusters.pdf", width=8.6, height=8.6)
top10 <- pbmc.markers %>% group_by(cluster) %>% top_n(n = 5, wt = avg_log2FC)
DoHeatmap(pbmc, features = top10$gene) + scale_fill_gradientn(colors = c("red", "black","green"))
dev.off()

#associates each cell ID with its respective cluster or identity
ident <- Idents(pbmc)
df <- data.frame(ident[])
df1 <-data.frame(X =row.names(df), count= df$ident..)
test <- df1 %>% separate(X, c("A", "B"),  sep = "x")

#dot size = 3

g <- rasterGrob(imported_raster, width=unit(1,"npc"), height=unit(1,"npc"), interpolate = FALSE)
pdf(file = paste("clustering_combines.pdf",sep =""), width=8.6, height=8.6)
ggplot(test, aes(x = as.numeric(A), y = as.numeric(B), color=count)) +
  #scale_color_gradientn(colours = c("black", "green")) + 
  #scale_color_gradientn(colours = c("blue","green", "red"),
  #                      oob = scales::squish) +
  ggtitle("UMAP") +
  annotation_custom(g, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  geom_point(shape = 15, size = 1)+
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
