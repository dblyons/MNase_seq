#plot linear fit of dyad-to-dyad peaks for visualization of regression calculation

filenames <- list.files("/path/to/your/numap/output/",
                        pattern="phasogram", full.names=TRUE)

your_input <- lapply(filenames, read.table)

resultlis<-list()

for (i in 1:length(filenames)) {  

  resultlis[[i]]<-your_input[[i]][,3]
  
}

together<-do.call(cbind, c(resultlis))
together<-as.data.frame(together)
names(together)<-basename(filenames)
together<-data.frame(pos=seq(1,3001), together)

together<-data.frame(pos=c(1:(length(resultlis[[1]]))), together)
melt.together<-melt(together, id='pos')

#user-defined variables determined by basename - in the end, you want genotype and replicate to be combined for color ID
melt_thing<-str_split_fixed(melt.together$variable, '\\.', 10)
meltbig<-data.frame(melt.together, genotype=melt_thing[,1], replicate=melt_thing[,2], exp.level=melt_thing[,5])

meltbig<-data.frame(meltbig, genotypeByreplicate=paste(meltbig$genotype, 
                                                       meltbig$replicate))

ggplot(meltbig, aes(pos, value, color=genotypeByreplicate))+
  geom_line( )+
  theme_bw(base_size = 15)+
  facet_wrap(~exp.level, 1,4, scales="free_y")+
  xlim(0,750)+
  scale_color_manual(values =
                       c(  "blue3", "steelblue",
                           "forestgreen", "mediumseagreen"
                       ))

