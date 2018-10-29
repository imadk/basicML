check_duplicates <- function(df, indices = FALSE)
{

	if(indices){
		which(duplicated(df) | duplicated(df[nrow(df):1, ])[nrow(df):1])
	}
	else{
		duplicated(df) | duplicated(df[nrow(df):1, ])[nrow(df):1]	
	}

}
