extract_p_text <- function (text){
  
  text<-as.character(text);
  
  #Extracts all snippets between html "p" tags while remove "code" snippets
  p<-paste(unlist(regmatches(text, gregexpr("(?<=<p>).*?(?=</p>)", text, perl=TRUE))), collapse="");
  p<-gsub("<code>.*?</code>","",p)
  
  
  
  
}
