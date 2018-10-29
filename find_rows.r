find_rows <- function(dff, op1, value1, logicalop=NULL, op2=NULL, value2=NULL)
{

	if(is.character(value1)){
		which(dff == value1)
	}
	else if(is.numeric(value1)){
	
		if(is.null(logicalop)){
			if(op1 == ">"){
				which(dff > value1)
			}
			if(op1 == "<"){
				which(dff < value1)
			}
			if(op1 == "=="){
				which(dff == value1)
			}
		}
		else{
		
			if(logicalop == "and"){

				if(op1 == ">" && op2 == "<"){
					which(dff > value1 & dff < value2)
				}
				if(op1 == "<" && op2 == ">"){
					which(dff < value1 & dff > value2)
				}
				if(op1 == ">=" && op2 == "<"){
					which(dff >= value1 & dff < value2)
				}
				if(op1 == "<=" && op2 == ">"){
					which(dff <= value1 & dff > value2)
				}
				if(op1 == ">" && op2 == "<="){
					which(dff >= value1 & dff <= value2)
				}
				if(op1 == "<" && op2 == ">="){
					which(dff <= value1 & dff >= value2)
				}
				if(op1 == ">=" && op2 == "<="){
					which(dff >= value1 & dff <= value2)
				}
				if(op1 == "<=" && op2 == ">="){
					which(dff <= value1 & dff >= value2)
				}
				

			}
			else if (logicalop == "or"){
				if(op1 == ">" && op2 == "<"){
					which(dff > value1 | dff < value2)
				}
				if(op1 == "<" && op2 == ">"){
					which(dff < value1 | dff > value2)
				}
				if(op1 == ">=" && op2 == "<"){
					which(dff >= value1 | dff < value2)
				}
				if(op1 == "<=" && op2 == ">"){
					which(dff <= value1 | dff > value2)
				}
				if(op1 == ">" && op2 == "<="){
					which(dff >= value1 | dff <= value2)
				}
				if(op1 == "<" && op2 == ">="){
					which(dff <= value1 | dff >= value2)
				}
				if(op1 == ">=" && op2 == "<="){
					which(dff >= value1 | dff <= value2)
				}
				if(op1 == "<=" && op2 == ">="){
					which(dff <= value1 | dff >= value2)
				}
			
			}

		
		}
		
	}
	
}


