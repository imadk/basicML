extract_code_text <- function (text){
  
  text<-as.character(text);
  #Extracts all snippets between html "code" tags
  c<-unlist(regmatches(text, gregexpr("(?<=<code>).*?(?=</code>)", text, perl=TRUE)))
  
  if(length(c)!=0){
    ngs2<-NULL
    ngs3<-NULL
    
    #create ngrams 2 and 3 for each code snippet before recombining
    for(i in 1:length(c)){
      
      ngs2<-c(ngs2, as.vector(unlist(ngrams(c[i], n=2),recursive=F))$all_n.n_2)
      ngs3<-c(ngs3, as.vector(unlist(ngrams(c[i], n=3),recursive=F))$all_n.n_3)
      
      
    }
    
    ngs2<-unlist(ngs2)
    ngs3<-unlist(ngs3)
    
    ngs<-unlist(c(c,ngs2, ngs3))
    
    paste(ngs, collapse = " ")
  }
}
  