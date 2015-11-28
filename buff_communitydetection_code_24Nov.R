#################################
#################################
## Code & Notes to read in Community Detection Results
## And make circle figures
## Summary for Julie, 12-November-2015
#################################
#################################

#################################
# OUTLINE
#################################
# 1)	notes on how to integrate Julie's matricies with MATLAB
# 2) packages, dataflies, functions
# 3) How to prep matlab output for figure
# 4) Circle plots
#################################

setwd("~/Documents/postdoc_buffology/circlefigs_for_Julie")

#################################
#################################
# From raw matricies sent
# Data Matrix Requirements: 
# Want buffalo names in both first row and first column;
# So I don't confuse myself, made row/col names start with X
# First column fromfiles received is the rownumbers, so fix that...
# ONLY USE ON FIRST GO: 
#files= list.files(pattern= "MatrixDuration")[7:12]  # added 7-12 for future read ins. 
#datafiles<-list(NA); buffnames<-list(NA)
#for (i in 1:length(files)){
# read in, groom matricies, and rewrite as M_filename. 
#datafiles[[i]]<-read.csv(files[i], row.names=1)
#colnames(datafiles[[i]])<-rownames(datafiles[[i]])
#write.csv(datafiles[[i]], paste("M", files[i], sep="_"))  # if first go, leave as is. 

# save the order and names of buffalo in each list
#buffnames[[i]]<- data.frame(colnames(datafiles[[i]]))
#colnames(buffnames[[i]])<-paste("name", strsplit(files[i], "[[:punct:]]")[[1]][2], strsplit(files[i], "[[:punct:]]")[[1]][3], sep="_" )
#write.csv(buffnames[[i]], file=paste("names_", files[i], sep=""), row.names=TRUE)
#}
# Cell [1,1] is a placeholder but needs to be full to read in to MATLAB

# double check this- found names files incorrect on 2014_10+ 


# READ IN FILES FOR SECOND LOAD: 
files= list.files(pattern= "M_MatrixDuration")
 # added 7-12 for future read ins. 
datafiles<-list(NA)
for (i in 1:length(files)){
datafiles[[i]]<-read.csv(files[i], row.names=1)
colnames(datafiles[[i]])<-rownames(datafiles[[i]])
}

#################################
#################################
# Packages and Datafiles
#################################
#################################
library(igraph)
library(circlize)  # for circle plots
library(RColorBrewer)
library(plyr)
library(prettyR)
library(HiveR)
library(grid)

# source code here for making flows matrix (table with weights summed for each buffalo pair). 
source('~/Documents/postdoc_buffology/circlefigs_for_Julie/make_flows_matrix.R', chdir = TRUE)

# source code for the hive plot functions
source('~/Documents/postdoc_buffology/circlefigs_for_Julie/mod.edge2HPD.R', chdir=TRUE)
source('~/Documents/postdoc_buffology/circlefigs_for_Julie/make_hive_plot.R', chdir = TRUE)

# source code here for the circle plot functions; not yet finished
#source('~/Documents/postdoc_buffology/circlefigs_for_Julie/buffreorder.R', chdir = TRUE)
#source('~/Documents/postdoc_buffology/circlefigs_for_Julie/make_buffalo_circleplots.R', chdir = TRUE)

#################################
#################################
# Prep matlab output
#################################
#################################
# empty lists to hold matlab output:
	# community= vector of community id for each buffalo
	# names= buffalo id for each matrix, in same order as community id... to match up
	# buffalo and community= the matrix with buffalo ids as dimnames
	# this is called in teh make_flows_matrix function to make a contingency table. 
#community<-list(NA)
#communitylow<-list(NA)
#names<-list(NA)
#buffandcommunity<-list(NA)
#community[[1]]<-read.csv("~/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2014_06_m0.3287.csv", header=FALSE)
#communitylow[[1]]<-read.csv("~/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2014_06_m0.3106.csv", header=FALSE)
#names[[1]]<-read.csv("~/Documents/postdoc_buffology/circlefigs_for_Julie/names_MatrixDurationIndexCorrectedEven_2014_06.csv", row.names=1)
#names[[1]]$com<-community[[1]][,1]
#names[[1]]$comlow<-communitylow[[1]][,1]

#community[[2]]<-read.csv("~/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2014_08_m0.3270.csv", header=FALSE)
#communitylow[[2]]<-read.csv("~/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2014_08_m0.3170.csv", header=FALSE)
#names[[2]]<-read.csv("~/Documents/postdoc_buffology/circlefigs_for_Julie/names_MatrixDurationIndexCorrectedEven_2014_08.csv", row.names=1)
#names[[2]]$com<-community[[2]][,1]
#names[[2]]$comlow<-communitylow[[2]][,1]

#community[[3]]<-read.csv("~/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2014_10_m0.3056.csv", header=FALSE)
#communitylow[[3]]<-read.csv("~/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2014_10_m0.293.csv", header=FALSE)
#names[[3]]<-read.csv("~/Documents/postdoc_buffology/circlefigs_for_Julie/names_MatrixDurationIndexCorrectedEven_2014_10.csv", row.names=1)
#names[[3]]$com<-community[[3]][,1]
#names[[3]]$comlow<-communitylow[[3]][,1]

#community[[4]]<-read.csv("~/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2014_12_m0.2816.csv", header=FALSE)
#communitylow[[4]]<-read.csv("~/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2014_12_m0.2816.csv", header=FALSE)  # same for both
#names[[4]]<-read.csv("~/Documents/postdoc_buffology/circlefigs_for_Julie/names_MatrixDurationIndexCorrectedEven_2014_12.csv", row.names=1)
#names[[4]]$com<-community[[4]][,1]
#names[[4]]$comlow<-community[[4]][,1]

#community[[5]]<-read.csv("~/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2015_02_m0.2682.csv", header=FALSE)
#communitylow[[5]]<-read.csv("~/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2015_02_m0.2676.csv", header=FALSE)
#names[[5]]<-read.csv("~/Documents/postdoc_buffology/circlefigs_for_Julie/names_MatrixDurationIndexCorrectedEven_2015_02.csv", row.names=1)
#names[[5]]$com<-community[[5]][,1]
#names[[5]]$comlow<-communitylow[[5]][,1]

#community[[6]]<-read.csv("~/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2015_06_m0.2340.csv", header=FALSE)
#communitylow[[6]]<-read.csv("~/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2015_06_m0.2184.csv", header=FALSE)
#names[[6]]<-read.csv("~/Documents/postdoc_buffology/circlefigs_for_Julie/names_MatrixDurationIndexCorrectedEven_2015_06.csv", row.names=1)
#names[[6]]$com<-community[[6]][,1]
#names[[6]]$comlow<-communitylow[[6]][,1]

#saveRDS(names, file="communityIDs.rds")

names<-readRDS("communityIDs.rds")

# Write matricies that contain the flows between each community identified in each capture period. 
# output files are flows_matrix_sym; flows_matrix_
#files= list.files(pattern= "*M_MatrixDuration")
#namelist= c("2014_06", "2014_08", "2014_10", "2014_12", "2015_02", "2015_06")
#for (i in 1:6){
#  make_flows_matrix(datafiles[[i]], names[[i]], namelist[i])
#}

flowmatrix<-list(NA)
files= list.files(pattern="*flows_matrix_2")
for(i in 1:length(files)){
flowmatrix[[i]]<-read.csv(files[i], row.names=1)
}
#################################
#################################
# Figures- Circle plots
#################################
#################################
# not finished
#for (i in 1:6){
#make_buffalo_circlepots(flowmatrix[[i]], colmatch, names[[i]]) 
#}


#################################
#################################
# Figures2- Hive plots
#################################
#################################
col=c("firebrick4", "red3", "indianred2", "lightsalmon", "tan1", "orange2", "lightgoldenrod1", "yellow1", "yellowgreen","mediumseagreen", "seagreen", "steelblue1", "turquoise4", "steelblue4", "slateblue", "slateblue4", "darkslateblue")
plot(1:17, pch=CIRCLE<-16, cex=5, col=col)
colmatch=data.frame(com=seq(1:17), col=col)

# prep demographic data
demog1<-read.csv("~/Documents/postdoc_buffology/circlefigs_for_Julie/demogdata.csv")  # all demographic data
demog2<-data.frame(ID=demog1$nid, sex=demog1$sex, age1=demog1$age_0614, age2=demog1$age_0814,
                   age3=demog1$age_1014, age4=demog1$age_1214, age5=demog1$age_0215, age6=demog1$age_0615)
demog<-list(NA)
for (i in 1:6){
	demog[[i]]<-names[[i]]
	demog[[i]]$sex<-demog2$sex[match(demog[[i]][,1], demog2$ID)]
	demog[[i]]$age<-demog2[match(demog[[i]][,1], demog2$ID), 2+i]
	demog[[i]]$agecat<-ifelse(demog[[i]]$age <=1, "calf",  ifelse(demog[[i]]$age>1 & demog[[i]]$age<=3, "juvenile", "adult"))	
	colnames(demog[[i]])[1]<-"ID"
}

# test with one captures' data
testdemog<-demog[[1]]
testnames<-names[[1]]
testmatdata<-as.matrix(datafiles[[1]])
colnames(testmatdata)<-rownames(testmatdata)
make_hive_plot(matdata=testmatdata, demogdata=testdemog, save_nodedf=TRUE, name="_June_2014")

# test with second captures' data
testdemog<-demog[[2]]
testnames<-names[[2]]
testmatdata<-as.matrix(datafiles[[2]])
colnames(testmatdata)<-rownames(testmatdata)
make_hive_plot(matdata=testmatdata, demogdata=testdemog, save_nodedf=TRUE, name="_Aug_2014")

# test with third captures' data
testdemog<-demog[[3]]
testnames<-names[[3]]
testmatdata<-as.matrix(datafiles[[3]])
colnames(testmatdata)<-rownames(testmatdata)
make_hive_plot(matdata=testmatdata, demogdata=testdemog, save_nodedf=TRUE, name="_Oct_2014")



# test with fourth captures' data, only three communities
colmatch=data.frame(com=seq(1:3), col=col[c(2,7,11)])
testdemog<-demog[[4]]
testnames<-names[[4]]
testmatdata<-as.matrix(datafiles[[4]])
colnames(testmatdata)<-rownames(testmatdata)
# also changed axis labels to 1.4 for the plot
make_hive_plot(matdata=testmatdata, demogdata=testdemog, save_nodedf=TRUE, name="_Dec_2014")

# test with fifth captures' data, only seven communities
col=c("firebrick4", "red3", "indianred2", "lightsalmon", "tan1", "orange2", "lightgoldenrod1", "yellow1", "yellowgreen","mediumseagreen", "seagreen", "steelblue1", "turquoise4", "steelblue4", "slateblue", "slateblue4", "darkslateblue")
plot(1:17, pch=CIRCLE<-16, cex=5, col=col)
colmatch=data.frame(com=seq(1:7), col=col[c(1,3,5,8,9,13,15)])
testdemog<-demog[[5]]
testnames<-names[[5]]
testmatdata<-as.matrix(datafiles[[5]])
colnames(testmatdata)<-rownames(testmatdata)
make_hive_plot(matdata=testmatdata, demogdata=testdemog, save_nodedf=TRUE, name="_Feb_2015")


# sixth captures data, again only one calf, 
col=c("firebrick4", "red3", "indianred2", "lightsalmon", "tan1", "orange2", "lightgoldenrod1", "yellow1", "yellowgreen","mediumseagreen", "seagreen", "steelblue1", "turquoise4", "steelblue4", "slateblue", "slateblue4", "darkslateblue")
plot(1:17, pch=CIRCLE<-16, cex=5, col=col)
colmatch=data.frame(com=seq(1:10), col=col[c(1,3,5,8,9,11,12,14,15, 17)])
testdemog<-demog[[6]]
testnames<-names[[6]]
testmatdata<-as.matrix(datafiles[[6]])
colnames(testmatdata)<-rownames(testmatdata)
make_hive_plot(matdata=testmatdata, demogdata=testdemog, save_nodedf=TRUE, name="_June_2015")



for (i in 1:6){
	plot_matdata<-as.matrix(datafiles[[i]])
	colnames(plot_matdata)<-rownames(plot_matdata)
	#make_hive_plot_rank(matdata=plot_matdata, demogdata=demog[[i]])
	make_hive_plot(matdata=plot_matdata, demogdata=demog[[i]])
  rm(plot_matdata)
}
