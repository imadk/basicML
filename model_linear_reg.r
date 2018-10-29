model_linear_reg <- function(){

	# Linear Regression model 
	proj$glm <- lm(y ~ ., data=proj$dataset[proj$train,c(proj$input, proj$target)])

	# Linear model as text
	print(summary(proj$glm))
	cat('==== ANOVA ====
	')
	print(anova(proj$glm))

	# Plot the model evaluation
	ttl <- genPlotTitleCmd("Linear Model",proj$dataname,vector=TRUE)
	plot(proj$glm, main=ttl[1])

}