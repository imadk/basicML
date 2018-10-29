view_dataset_fancy <- function (df=proj$dataset){


	library(RGtk2Extras)
	library(RGtk2)
	library(colorspace)

	# View the dataset 
	
	dfedit(df, dataset.name="Dataset", size=c(800, 400))

}
