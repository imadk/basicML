model_tree <- function(){

	# Decision Tree 

	require(rpart, quietly=TRUE)

	set.seed(crv$seed)

	# Create the DT

	proj$rpart <- rpart(y ~ .,
	    data=proj$dataset[proj$train, c(proj$input, proj$target)],
	    method="class",
	    parms=list(split="information"),
	    control=rpart.control(usesurrogate=0, 
		maxsurrogate=0))

		#can add to control arg: cp = 0.010000, 
		#can make method anova for numeric y

	#Include Missing - uncomment
	#proj$rpart <- rpart(y ~ .,
	#data=proj$dataset[proj$train, c(proj$input, proj$target)],
	#method="class",
	#parms=list(split="information"))

	# Decision Tree model as text
	print(proj$rpart)
	printcp(proj$rpart)

	# Plot a fancy-verison tree 
	fancyRpartPlot(proj$rpart, main="Decision Tree data.csv $ y")

}