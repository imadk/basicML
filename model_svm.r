model_svm <- function(){

	require(kernlab, quietly=TRUE)

	set.seed(crv$seed)
	proj$ksvm <- ksvm(as.factor(y) ~ .,
	      data=proj$dataset[proj$train,c(proj$input, proj$target)],
	      kernel="rbfdot",
	      C=100,
	      prob.model=TRUE)

}