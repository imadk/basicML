
#INIT THOSE VARS #####################################

	ftrain<-"C:/Users/Imad/Documents/CKI/CKI Inc/workspaces/BramPaperman_workspace/!Dataset/all_utf_indicator.csv"
  filename = ftrain

	targetVar = NULL
	nopart = FALSE
	parttestonly = FALSE
	partvalandtest = TRUE

####################################################### 

	#rm(list = ls(all = TRUE)) #optional

	if(nopart){
		
		parttestonly = FALSE
		partvalandtest = FALSE
	}
	
	if(parttestonly){
		nopart = FALSE
		partvalandtest = FALSE	
	}
	if(partvalandtest){
	
		nopart = FALSE
		parttestonly = FALSE
	}

	library(RGtk2Extras)
	library(RGtk2)
	library(colorspace)


	building <- TRUE
	scoring  <- ! building
	proj<-NULL
	crv<-NULL

	# Random seed so that results are repeatable
	crv$seed <- 56 

	# Load data
	filestring = paste("file:///", filename, sep="")
	proj$dataset <- read.csv(filestring, na.strings=c(".", "NA", "", "?"), sep = ',', strip.white=TRUE)
  #proj$dataset <- rbind(proj$dataset, read.csv(...., skip=2e4, nrows=2e4))
  #proj$dataset <- rbind(proj$dataset, read.csv(...., skip=4e4, nrows=2e4))
  #proj$dataset <- rbind(proj$dataset, read.csv(...., skip=6e4))

	#80/20
	if(parttestonly){
	
		# Build training/validation/test data sets	
		set.seed(crv$seed) 
		proj$nobs <- nrow(proj$dataset)
		proj$sample <- proj$train <- sample(nrow(proj$dataset), 0.8*proj$nobs) 
		proj$validate <- NULL
		proj$test <- setdiff(setdiff(seq_len(nrow(proj$dataset)), proj$train), proj$validate) 

	
	}
	
	#70/15/15
	if(partvalandtest){
		# Build training/validation/test data sets
		set.seed(crv$seed) 
		proj$nobs <- nrow(proj$dataset) 
		proj$sample <- proj$train <- sample(nrow(proj$dataset), 0.7*proj$nobs) 
		proj$validate <- sample(setdiff(seq_len(nrow(proj$dataset)), proj$train), 0.15*proj$nobs) 
		proj$test <- setdiff(setdiff(seq_len(nrow(proj$dataset)), proj$train), proj$validate) 
	}
	
	#only training set
	if(nopart){		
		# Build training/validation/test data sets	
		set.seed(crv$seed) 
		proj$nobs <- nrow(proj$dataset) 
		proj$sample <- proj$train <- sample(nrow(proj$dataset), proj$nobs) 
		proj$validate <- NULL 
		proj$test <- NULL 
	}
	
	# Define the input and targets and params
	
	
	columnnames = colnames(proj$dataset)
	
	#Identity attribute
	
	proj$ident   <- NULL
	
	if(length(which(toupper(columnnames) == "ID")) > 0){
	
		proj$ident   <- columnnames[which(toupper(columnnames) == "ID")]
	
	}
		
		
	#remove id label since already assigned as ident	
	if(!is.null(proj$ident)){
	
		columnnames <- columnnames [-which (columnnames == proj$ident)]
		
	}
	
	

	proj$input <- columnnames
	
	proj$numeric <- NULL
	proj$categoric <- NULL

	for(i in 1:length(columnnames)){
		
		
		
		if((is.numeric(proj$dataset[,columnnames[i]]))){
	
			proj$numeric <- c(proj$numeric, columnnames[i])
		
		}
		if(is.factor(proj$dataset[,columnnames[i]])){
		
			proj$categoric <- c(proj$categoric, columnnames[i])
		}	
		
	}
		

	proj$target  <- targetVar

	proj$risk    <- NULL
	proj$ignore  <- NULL
	proj$weights <- NULL

	# View the dataset 
	#dfedit(proj$dataset, dataset.name="Dataset", size=c(800, 400))
	
