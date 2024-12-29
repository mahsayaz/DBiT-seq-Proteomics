##UMI Count
region <- 2000  #change the x axis maxium
test <- data_filtered %>% separate(X, c("A", "B"),  sep = "x")
df <- data.frame(number=1, c=count)
pdf(file = paste("UMI-filtered.pdf",sep =""), width=8.6, height=8.6)
ggplot(df,aes(x=c),color='blue', xlab="Gene") + 
  geom_histogram(aes(y=..density..),binwidth=region/20, color="black", fill="white",size=1)+ 
  geom_density(alpha=.2, fill="#FF6666",size=1,color ="red") +
  scale_x_continuous(name="UMI",limits = c(0,region)) + 
  scale_y_continuous(name="Density", expand = c(0, 0)) + 
  #xlim(0,4000) +
  #expand_limits(x = 0, y = 0) +
  theme(plot.title = element_text(hjust = 0.5, size = 25, face = "bold"),
        axis.text=element_text(colour="black",size=20),
        axis.title=element_text(colour="black",size=25,face="bold"),
        legend.text=element_text(colour="black",size=20),
        legend.title = element_text(colour="black", size=20, face="bold"),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line.x = element_line(colour = 'black', size=0.5, linetype='solid'),
        axis.line.y = element_line(colour = 'black', size=0.5, linetype='solid'))
dev.off()



##Protein Count
df <- data.frame(number=1, c=gene_count)
region = 20 #change the x axis maxium
pdf(file = paste("Protein-filtered.pdf",sep =""), width=8.6, height=8.6)
ggplot(df,aes(x=c),color='blue', xlab="Protein") + 
  geom_histogram(aes(y=..density..),binwidth=region/20, color="black", fill="white",size=1)+ 
  geom_density(alpha=.2, fill="#FF6666",size=1,color ="red") +
  scale_x_continuous(name="Protein",limits = c(0,region)) + 
  scale_y_continuous(name="Density", expand = c(0, 0)) + 
  #xlim(0,4000) +
  #expand_limits(x = 0, y = 0) +
  theme(plot.title = element_text(hjust = 0.5, size = 25, face = "bold"),
        axis.text=element_text(colour="black",size=20),
        axis.title=element_text(colour="black",size=25,face="bold"),
        legend.text=element_text(colour="black",size=20),
        legend.title = element_text(colour="black", size=20, face="bold"),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line.x = element_line(colour = 'black', size=0.5, linetype='solid'),
        axis.line.y = element_line(colour = 'black', size=0.5, linetype='solid'))
dev.off()
