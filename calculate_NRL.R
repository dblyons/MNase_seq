#calculate NRL estimate
#use your phasogram output directory

filenames <- list.files("/path/to/your/numap/phaso_output/",
                        pattern=".peak_pos.txt$", full.names=TRUE)

your_input <- lapply(filenames, read.table)

resultlis<-list()
nrl.result<-list()
stderr.result<-list()


for (i in 1:length(filenames)) {  

  resultlis[[i]]<-summary(lm(c(0, your_input[[i]]$V2[c(1:4)]) ~ c(1:5)))
  nrl.result[[i]]<- c(resultlis[[i]]$coefficient[2])
  stderr.result[[i]]<-c(resultlis[[i]]$coefficient[4])
  
}

together.nrl<-do.call(cbind, nrl.result)
together.err<-do.call(cbind, stderr.result)
#use together for generating barplot with error bars
together<-data.frame(id=basename(filenames), nrl=as.vector(together.nrl), err=as.vector(together.err))



