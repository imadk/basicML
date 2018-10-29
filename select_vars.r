select_vars <- function(operation = "ignore", var = NULL, quiet = TRUE){


	columnnames = colnames(proj$dataset)
	if(!length(which(columnnames == var))){
		stop("Variable is not a dataset feature!")
	}

	if(operation == "ignore"){
	
		if(!length(which(proj$ignore == var))){
			proj$ignore  <<- c(proj$ignore, var)  
		}

		if(length(which(proj$input == var))> 0){
	
			proj$input <<- proj$input [-which (proj$input == var)]
		}
		if(length(which(proj$numeric == var))> 0){
			proj$numeric <<- proj$numeric [-which (proj$numeric == var)]
		}
		if(length(which(proj$categoric == var))> 0){
			proj$categoric <<- proj$categoric [-which (proj$categoric == var)]
		}
		if(length(which(proj$ident == var))> 0){
			proj$ident <<- proj$ident [-which (proj$ident == var)]
		}
		if(length(which(proj$target == var))> 0){
			
			proj$target <<- proj$target [-which (proj$target == var)]
		}
	
		if(length(which(proj$risk == var))> 0){
			
			proj$risk  <<- proj$risk [-which (proj$risk== var)]
		}
		if(length(which(proj$weights== var))> 0){
			
			proj$weights <<- proj$weights[-which (proj$weights== var)]
		}
			
	}
	
	else if(operation == "input"){
	
		if(length(which(proj$ignore == var))>0){
			proj$ignore <<- proj$ignore [-which (proj$ignore== var)]
		}
		if(!length(which(proj$input == var))){
			proj$input  <<- c(proj$input, var)  
		}
		if(!length(which(proj$numeric == var))){

			if((is.numeric(proj$dataset[,var]))){
	
				proj$numeric <<- c(proj$numeric, var)  
			}
		}
		if(!length(which(proj$categoric == var))){

			if((is.factor(proj$dataset[,var]))){

				proj$categoric <<- c(proj$categoric, var)  
			}
		}
		
		if(length(which(proj$ident == var))> 0){
			proj$ident <<- proj$ident [-which (proj$ident == var)]
		}
		
		if(length(which(proj$target == var))> 0){

			proj$target <<- proj$target [-which (proj$target == var)]
		}

		if(length(which(proj$risk == var))> 0){

			proj$risk  <<- proj$risk [-which (proj$risk== var)]
		}
		if(length(which(proj$weights== var))> 0){

			proj$weights <<- proj$weights[-which (proj$weights== var)]
		}

		
	}
	else if(operation == "target"){
	
		if(!length(which(proj$target == var))){
			proj$target  <<- c(proj$target, var)  
		}

		if(length(which(proj$input == var))> 0){
	
			proj$input <<- proj$input [-which (proj$input == var)]
		}
		if(length(which(proj$numeric == var))> 0){
			proj$numeric <<- proj$numeric [-which (proj$numeric == var)]
		}
		if(length(which(proj$categoric == var))> 0){
			proj$categoric <<- proj$categoric [-which (proj$categoric == var)]
		}
		if(length(which(proj$ident == var))> 0){
			proj$ident <<- proj$ident [-which (proj$ident == var)]
		}
		if(length(which(proj$ignore == var))> 0){
			
			proj$ignore <<- proj$ignore[-which (proj$ignore == var)]
		}
	
		if(length(which(proj$risk == var))> 0){
			
			proj$risk  <<- proj$risk [-which (proj$risk== var)]
		}
		if(length(which(proj$weights== var))> 0){
			
			proj$weights <<- proj$weights[-which (proj$weights== var)]
		}
			
		
	
	
	}
	else if(operation == "risk"){
	
		
	
	
	}
	else if(operation == "ident"){

		if(!length(which(proj$ident == var))){
			proj$ident <<- c(proj$ident, var)  
		}

		if(length(which(proj$input == var))> 0){

			proj$input <<- proj$input [-which (proj$input == var)]
		}
		if(length(which(proj$numeric == var))> 0){
			proj$numeric <<- proj$numeric [-which (proj$numeric == var)]
		}
		if(length(which(proj$categoric == var))> 0){
			proj$categoric <<- proj$categoric [-which (proj$categoric == var)]
		}
		if(length(which(proj$target == var))> 0){
			proj$target <<- proj$target [-which (proj$target == var)]
		}
		if(length(which(proj$ignore == var))> 0){

			proj$ignore <<- proj$ignore[-which (proj$ignore == var)]
		}

		if(length(which(proj$risk == var))> 0){

			proj$risk  <<- proj$risk [-which (proj$risk== var)]
		}
		if(length(which(proj$weights== var))> 0){

			proj$weights <<- proj$weights[-which (proj$weights== var)]
		}


		
	}
	else if(operation == "weights"){
	
		
		
	}
	
	else{
	
		stop("The operation you provided is invalid")
	
	}



	#display updates
	if(!quiet){
		str(proj)
	}
	
}