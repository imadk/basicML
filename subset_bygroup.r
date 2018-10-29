subset_bygroup <- function (feature, value){

	proj$dataset[which(proj$dataset[feature] == value),]

}