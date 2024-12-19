#UMI heatmap
pdf(file = paste("UMI_heatmap_prerun.pdf",sep =""), width=8.6, height=8.6)
ggplot(test , aes(x = as.numeric(A), y = as.numeric(B), color=count)) +
  
#if you wanna have the UMI for only specific ADT (Here V1), then run the next line instead:
# ggplot(test, aes(x = as.numeric(A), y = as.numeric(B), color=as.numeric(V1))) +#count
 
 #scale_color_gradientn(colours = c("black", "green")) + 
  scale_color_gradientn(colours = c("blue","green", "red"),limits=c(0,1500),
                        oob = scales::squish,) +
  ggtitle("UMI Heatmap") +
  #annotation_custom(g, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  guides(colour = guide_colourbar(barwidth = 1, barheight = 30)) +
  geom_point(shape = 15, size = 3.1)+
  expand_limits(x = 0, y = 0) +
  scale_x_continuous(name="X", limits = c(NA, NA), expand = expansion(mult = c(-0.013, -0.013))) +
  scale_y_reverse(name="Y", limits = c(NA, NA), expand = expansion(mult = c(-0.013, 0.008))) +
  coord_equal(xlim=c(-1,50),ylim=c(50,0)) +
  theme(plot.title = element_text(hjust = 0.5, size = 25, face = "bold"),
        axis.text=element_text(size=30),
        axis.title=element_text(size=30,face="bold"),
        legend.text=element_text(size=30),
        legend.title = element_blank(),
        #legend.title = element_text(colour="black", size=15, face="bold"),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank())
dev.off()


#Gene heatmap
pdf(file = paste("Protein_heatmap_prerun.pdf",sep =""), width=8.6, height=8.6)
ggplot(test, aes(x = as.numeric(A), y = as.numeric(B), color=gene_count)) +
  
#if you wanna have the UMI for only specific ADT (Here V1), then run the next line instead:
# ggplot(test, aes(x = as.numeric(A), y = as.numeric(B), color=as.numeric(V1))) +#count
  
  #scale_color_gradientn(colours = c("black", "green")) + 
  scale_color_gradientn(colours = c("blue","green", "red"),limits=c(0,10),
                        oob = scales::squish) +
  ggtitle("Protein") +
  #annotation_custom(g, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  guides(colour = guide_colourbar(barwidth = 1, barheight = 30)) +
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
