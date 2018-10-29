###
# Saysome - CKI
# Sentence analysis, comparisons, and more.	
# @author Imad Khoury - October 2013
# remove_rows.r
# 	All rights reserved - Copyright Imad Khoury 2013
#
###

remove_rows <- function(df, indices)
{	
	ds[-indices,]
}


