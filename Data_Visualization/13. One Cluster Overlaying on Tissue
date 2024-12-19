#associates each cell ID with its respective cluster or identity
#need to change "SCT_snn_res.0.3" accordingly
df1 <- pbmc@meta.data %>% dplyr::select(SCT_snn_res.0.32) %>% 
  tibble::rownames_to_column(var="X") %>% dplyr::rename(cluster= "SCT_snn_res.0.32")

#if using raw data, you can use "pbmc@assays$RNA@layers$counts", 
#if using normalized data, you can use "pbmc@assays$SCT@data", 

df_counts <- data.frame(pbmc@assays$SCT@data) %>% 
  data.table::transpose() 
colnames(df_counts) <- Features(pbmc)
df_counts <- df_counts %>% dplyr::mutate(X=df1$X)

df1 <- df1 %>% left_join(df_counts, by = "X")


# c(2) and color=V12 are representing cluster 2 and marker V12 
test <- df1 %>% separate(X, c("A", "B"),  sep = "x")
test <- test %>% filter(cluster %in% c(0))
g <- rasterGrob(imported_raster, width=unit(1,"npc"), height=unit(1,"npc"), interpolate = FALSE)
pdf(file = paste("cluster 0-FAP.pdf",sep =""), width=8.6, height=8.6)
ggplot(test, aes(x = as.numeric(A), y = as.numeric(B), color=V7)) +
  #scale_color_gradientn(colours = c("black", "green")) + 
  #scale_color_gradientn(colours = c("blue","green", "red"),
  #                      oob = scales::squish) +
  ggtitle("UMAP - FAP") +
  annotation_custom(g, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  geom_point(shape = 15, size = 3)+
  expand_limits(x = 0, y = 0) +
  #adjust the limit based on the amount  "#76448A"
  scale_color_gradient(low="#999999", high = "#3381c8", limits=c(4, 6)) +
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
