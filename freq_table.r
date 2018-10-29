freq_table <- function (ss, edit=FALSE, quiet=TRUE, code=FALSE){

  if(!code){
    
    ss<-unlist(stopwords(ss, strip=TRUE, unique=FALSE))   #REM: char.keep can also keep special punctuation    
    ss<- paste(ss, collapse=" ")
  }#if code leave text as is

	d<-data.frame(Words = ss)
	corp <- Corpus(DataframeSource(d))

  	if(!quiet){
		print(corp)
  	}
	
  if(!code){
  	dtm <- DocumentTermMatrix(corp)
  }
  else{#take 1 and 2- character tokens as well (like for the if keyword, etc...)
    
    dtm <- DocumentTermMatrix(corp, control=list(wordLengths=c(1, Inf)))
    
  }
	sdtm <- sort(colSums(as.matrix(dtm)), decreasing=T)
	tcf <- data.frame(sdtm)
	tcf <- data.frame(Term=rownames(tcf), Count=tcf$sdtm)
  
	#corp2<- tm_map(corp, stemDocument) # Stem words
	#dtm2 <- DocumentTermMatrix(corp2)
	#sdtm2 <- sort(colSums(as.matrix(dtm2)), decreasing=T)
	
	tcf <- data.frame(Stem=stemDocument(as.vector(tcf$Term)), tcf)
	
	if(edit){
		edit(tcf)
	}
	
	if(!quiet){
		print(tcf)
 	}
	else{
	   tcf;
	}
	

}