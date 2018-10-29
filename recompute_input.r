recompute_inputs <- function(quiet = TRUE){



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
	
	
	
	#display updates
	if(!quiet){
		str(proj)
	}

}