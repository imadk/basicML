explore_PCA_svd <- function(){

	# PCA svd (numeric only)

	if(nopart){	
		pc <- prcomp(na.omit(proj$dataset[, proj$numeric]), scale=TRUE, center=TRUE, tol=0)
		
	}

	if(parttestonly){
	
		pc <- prcomp(na.omit(proj$dataset[proj$sample, proj$numeric]), scale=TRUE, center=TRUE, tol=0)
	
	}
	
	if(partvalandtest){
	
		pc <- prcomp(na.omit(proj$dataset[proj$sample, proj$numeric]), scale=TRUE, center=TRUE, tol=0)
	
	}
	

	# Show the output of the analysis.
	print(pc)

	# Summarise the importance of the components found.
	print(summary(pc))

	# Display a plot showing the relative importance of the components.
	plot(pc, main="")
	title(main="Principal Components Importance data.csv",
	    sub=paste("", format(Sys.time(), "%Y-%b-%d %H:%M:%S"), Sys.info()["user"]))
	axis(1, at=seq(0.7, ncol(pc$rotation)*1.2, 1.2), labels=colnames(pc$rotation), lty=0)

	dev.new()

	# Display a plot showing the two most principal components.
	biplot(pc, main="")
	title(main="Principal Components data.csv",
	    sub=paste("", format(Sys.time(), "%Y-%b-%d %H:%M:%S"), Sys.info()["user"]))


}
