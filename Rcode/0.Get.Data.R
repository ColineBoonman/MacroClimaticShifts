# define directions paths
SaveDir = "TREECHANGE_Data/"
source ("GetDataFunction.R")
raster::rasterOptions(tmpdir = "rasterTF")

# build species list
sp.list = read.csv ('SpeciesList.csv') # this file can be requested from the main author
sp.list = sp.list[which(sp.list$delete=="FALSE"),"species"]

# load general data
db.registry = read.csv ('TREECHANGE/Occurrences/DataRegistry.csv') # this file can be requested from the main author
db.source.datarights = db.registry[db.registry$RIGHTS == 'Public','ACRONYM']

for(x in 1:length(sp.list)){
  GetData(i=sp.list[x],sp.list,SaveDir,db.source.datarights)
}

# get data on AOO per species
exclude = raster::raster ("MOD44W/data/land5.2km.tif")
if(!file.exists(paste0(SaveDir,"AOO.txt"))) write(c("Species","AOO"), ncolumns=2, sep=",", file=paste0(SaveDir,"AOO.txt"))

for(i in 1:length(sp.list)){
  sp = sp.list[i]
  # what data is available for this species?
  path = paste0 ('TREECHANGE/Occurrences/IntegratedDB/',sp)
  p = list.files (path = path, pattern = '_long_GeoScrub__allDB_',full.names = T)
  if(length (p) >= 1){
    p = p[length(p)]
    # read data and filter observation points on quality label
    p = read.csv (p, fileEncoding="latin1")
    p.occ = subset (p,subset = source_record_db %in% db.source.datarights)
    p.occ.Geo.OK = subset (p.occ,subset = quality.grade %in% c('AAA','AA','A','C'))
    p.occ.Geo.KO = subset (p.occ,subset = quality.grade %in% c('B'))
    p.occ = rbind (p.occ.Geo.OK, p.occ.Geo.KO)
    n = nrow (p.occ)
    if(n >= 5){
      ## POINTS # create dataset of points with all selected labels (AAA - C)
      xy = data.frame(x = p.occ[,'x'], y= p.occ[,'y'])
      aoo = raster::rasterize(xy, exclude, fun='count')
      aoo = raster::crop(aoo, raster::extent(min(xy$x)-1, max(xy$x)+1, min(xy$y)-1, max(xy$y)+1)) #xmin xmax ymin ymax
      AOO = sum(raster::as.data.frame(raster::area(aoo, na.rm=T)),na.rm=T) # add sizes of the 2km resolution cells with an occurrence
    }else{AOO=0}
  }else{AOO=0} # if p>0
  AOO = floor(AOO)
  write(c(sp,AOO),file=paste0(SaveDir,"AOO.txt"),ncolumns=2, sep=",", append=TRUE)
}

# get data on number of observations per species
if(!file.exists(paste0(SaveDir,"NrOcc.txt"))) write(c("Species","n"), ncolumns=2, sep=",", file=paste0(SaveDir,"NrOcc.txt"))
for(i in 1:length(sp.list)){
  sp = sp.list[i]
  # what data is available for this species?
  path = paste0 ('TREECHANGE/Occurrences/IntegratedDB/',sp)
  p = list.files (path = path, pattern = '_long_GeoScrub__allDB_',full.names = T)
  if(length (p) >= 1){
    p = p[length(p)]
    # read data and filter observation points on quality label
    p = read.csv (p, fileEncoding="latin1")
    p.occ = subset (p,subset = source_record_db %in% db.source.datarights)
    p.occ.Geo.OK = subset (p.occ,subset = quality.grade %in% c('AAA','AA','A','C'))
    p.occ.Geo.KO = subset (p.occ,subset = quality.grade %in% c('B'))
    p.occ = rbind (p.occ.Geo.OK, p.occ.Geo.KO)
    n = nrow (p.occ)
  }else{n=0} # if p>0
  write(c(sp,n),file=paste0(SaveDir,"NrOcc.txt"),ncolumns=2, sep=",", append=TRUE)
}
