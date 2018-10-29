evaluate_tree_score <- function (all = FALSE, ind=1){

	 #Score a dataset
 
  
	 
		ftest<-"C:/Users/Imad/Documents/CKI/CKI Inc/workspaces/BramPaperman_workspace/OUTPUTS/"
  #proj$testset <- read.csv(ftest, na.strings=c(".", "NA", "", "?"), header=TRUE, sep="\t", encoding="UTF-8")
  
    proj$testset <- proj$dataset[proj$test,];
    
		# Ensure the levels are the same as the training data for variable `summary'.
		
		#levels(crs$testset[["summary"]]) <- 
		#  c(levels(crs$testset[["summary"]]), 
		#    setdiff(levels(crs$dataset[["summary"]]), 
		#               levels(crs$testset[["summary"]])))
		
		
		
		proj$pr <- predict(proj$rpart, proj$testset[,c(proj$input)])

		if(!all){ #ident only
		  
    sdata <- subset(proj$testset[,], select=c(proj$ident))
		}else{
      
		  sdata <- proj$testset[,]
		  
		}
    
		write.csv(cbind(sdata, proj$dataset[as.vector(as.numeric(sdata[,1])),1], proj$pr), file=paste(ftest,ind,as.character(proj$target),"test_score_tree_id.csv",sep=""), row.names=FALSE)
	
		
	
	}
	
























	# Obtain predictions for the DT model on the validation dataset
#	proj$pr <- predict(proj$rpart, proj$dataset[proj$validate, c(proj$input)])

#	sdata <- subset(proj$dataset[proj$validate,], select=c(proj$target))

#	sdata2 <- proj$dataset[proj$validate,]

#	write.csv(cbind(sdata, proj$pr), file="C:\\Users\\Imad\\Documents\\CKI\\CKI Inc\\workspaces\\iPerceptions2_workspace\\Code\\workspace\\Dataset Prediction Project 1\\data_validate_score_idents.csv", row.names=FALSE)

#	write.csv(cbind(sdata2, proj$pr), file="C:\\Users\\Imad\\Documents\\CKI\\CKI Inc\\workspaces\\iPerceptions2_workspace\\Code\\workspace\\Dataset Prediction Project 1\\data_validate_score_all.csv", row.names=FALSE)


	# Obtain predictions for the DT model on the test dataset
#	proj$pr <- predict(proj$rpart, proj$dataset[proj$test, c(proj$input)])

#	sdata <- subset(proj$dataset[proj$test,], select=c(proj$target))

#	sdata2 <- proj$dataset[proj$test,]

#	write.csv(cbind(sdata, proj$pr), file="C:\\Users\\Imad\\Documents\\CKI\\CKI Inc\\workspaces\\iPerceptions2_workspace\\Code\\workspace\\Dataset Prediction Project 1\\data_test_score_idents.csv", row.names=FALSE)

#	write.csv(cbind(sdata2, proj$pr), file="C:\\Users\\Imad\\Documents\\CKI\\CKI Inc\\workspaces\\iPerceptions2_workspace\\Code\\workspace\\Dataset Prediction Project 1\\data_test_score_all.csv", row.names=FALSE)
	
