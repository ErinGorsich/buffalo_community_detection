## FUNCTION TO MAKE HIVE PLOTS
make_hive_plot<-function(matdata, demogdata, save_nodedf, name) {
	########################
	########################
	## INPUT: matdata: data matricies from julie; with individual ID as row & col names
	## demogdata= dataframe containing community, age, sex information for each individual
  ## save_nodedf= TRUE/FALSE, should the nodedata frame be saved. 
	## OUTPUT: hiveplot image- use R studio for now
	## need to set up saving and high res photo output sections
	########################
	########################		
	# turn adjacency matrix into an i-graph object
	ga<-graph.adjacency(matdata, mode="upper", weighted=TRUE)	
	is.simple(ga)  # should be a simple dataframe

	# calculated weighted degree for each node; assign color based on community ID; assign to axis based on agecategoryy
	wtdegree<-graph.strength(ga, vids=V(ga), mode="all")  # calculated as symmetric...
	nodedf<- data.frame(name=V(ga)$name, degree=wtdegree, color=NA, axis= NA, 
					symbol=NA, malefemale=NA, agecat=NA, com=NA, 	size=NA)

	# specify node information (circle size= total degree *1.5; axis by age category)
	nodedf$agecat<-demogdata$agecat[match(nodedf$name, demogdata$ID)]
	nodedf$malefemale<-demogdata$sex[match(nodedf$name, demogdata$ID)]
	nodedf$com<- demogdata$comlow[match(nodedf$name, demogdata$ID)]
	nodedf$color<- colmatch$col[match(nodedf$com, colmatch$com)]
	nodedf$axis[nodedf$agecat=="calf"]<-1
	nodedf$axis[nodedf$agecat=="juvenile"]<-2
	nodedf$axis[nodedf$agecat=="adult"]<-3
	nodedf$axis<- as.integer(nodedf$axis)
	nodedf$symbol[nodedf$sex=="female"]<-19
	nodedf$symbol[nodedf$agecat=="male"]<-17
	nodedf$size<-wtdegree*1.2
	nodedf<-nodedf[order(nodedf$axis, nodedf$degree),]
	
	# specify location of node on each axis as the sum of the total size.
	nodedf$radius<-NA
	nodedf$radius[1]<-nodedf$size[1]
	nodedf$radius[length(nodedf$agecat[nodedf$agecat=="calf"])+1]<-nodedf$size[length( 
					nodedf$agecat[nodedf$agecat=="calf"])+1]
	nodedf$radius[length(nodedf$agecat[nodedf$agecat=="calf"| nodedf$agecat=="juvenile"])+1]<-
					nodedf$size[length(nodedf$agecat[nodedf$agecat=="calf"| nodedf$agecat=="juvenile"])+1]

  if (length(nodedf$agecat[nodedf$agecat=="calf"])>1){
	for (i in 2:length(nodedf$agecat[nodedf$agecat=="calf"])){
		nodedf$radius[i]<-nodedf$size[i]+ nodedf$radius[i-1]
	}
  }  # end if more than one calf. 
  
	if (length(nodedf$agecat[nodedf$agecat=="juvenile"])>1){
	for (i in (length(nodedf$agecat[nodedf$agecat=="calf"])+2):((length(nodedf$agecat[nodedf$agecat=="calf"]))+  
		length(nodedf$agecat[nodedf$agecat=="juvenile"])) ){
		nodedf$radius[i]<-nodedf$size[i]+ nodedf$radius[i-1]
	}
	}   # end if more than one juvenile
  
	for (i in (length(nodedf$agecat[nodedf$agecat=="calf"])+2 + (length(nodedf$agecat[nodedf$agecat=="juvenile"])) ):  
		length(nodedf$agecat) ){
		nodedf$radius[i]<-nodedf$size[i]+ nodedf$radius[i-1]
	}
  if (save_nodedf){
  write.csv(nodedf, paste("nodedf", name, ".csv", sep=""))
  }

	# make an edge-list with weight attributes
	edgelist<-get.edgelist(ga)
	edf<-data.frame(onode=edgelist[,1], dnode=edgelist[,2], ocom=NA, dcom=NA, wt=E(ga)$weight, color=NA)
	edf$ocom<- demogdata$comlow[match(edf$onode, demogdata$ID)]
	edf$dcom<- demogdata$comlow[match(edf$dnode, demogdata$ID)]
	for (i in 1:length(edf[,1])){
		if (edf$ocom[i]==edf$dcom[i]){
			edf$color[i]<-as.character(colmatch$col[match(edf$ocom[i], colmatch$com)])}
			else {edf$color[i]<-"grey70"}  # dark gray for btwn communities connections
	}

	edf3<-edf[order(edf$ocom, edf$dcom, edf$wt),]
	edf3$wt2<-edf3$wt*25

	hive1<-mod.edge2HPD(edge_df= edf3[,1:2], edge.weight=edf3$wt2, edge.color=edf3$color, 
			node.color= nodedf[,c("name", "color")], 	node.size=nodedf[, c("name", "size")], 
			node.radius= nodedf[,c("name", "radius")], node.axis=nodedf[,c("name", "axis")] )

  par(mai=c(2,2,2,1))
  plotHive(hive1, bkgnd = "white", axLabs=c("calf", "juv", "adult"), axLab.pos = 2.4, axLab.gpar = gpar(col = "black"))
		
  rm(ga, nodedf)
}
