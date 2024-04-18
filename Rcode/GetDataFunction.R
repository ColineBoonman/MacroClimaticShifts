'%!in%' <- function(x,y)!('%in%'(x,y))

# GetData 
GetData = function(i,sp.list,SaveDir,db.source.datarights){
  # select species and create output directory
  sp = sp.list[i]
  
  # what data is available for this species?
  path = paste0 ('TREECHANGE/Occurrences/IntegratedDB/',sp)
  p = list.files (path = path, pattern = '_long_GeoScrub__allDB_',full.names = T)
  if(length (p) == 0){
    write(c(sp,"NoData"),file=paste0(SaveDir,"no.data.species.txt"),ncolumns=2, sep=",", append=TRUE)# add species name to list
  }
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
      coords = cbind(p.occ$x,p.occ$y)   
      
      ## POINTS # create dataset of points with all selected labels (AAA - C)
      sppoints = sp::SpatialPointsDataFrame(data=data.frame (species = rep(sp,nrow(coords))),coords=coords,proj4string = sp::CRS("+init=epsg:4326"))
      rgdal::writeOGR(sppoints, paste0(SaveDir,"points"), paste0("DataPoints_all_",sp), driver="ESRI Shapefile",check_exists = T,overwrite_layer = T)
      
      ## HULL - ALL LABELS # create convex hull with all selected labels (AAA - C)
      chull = try(adehabitatHR::mcp(sppoints,percent=95),silent = T)
      if(class(chull)!="try-error"){raster::shapefile(x = chull, file = paste0(SaveDir,"polygons/Hull_allpoints_convex_",sp,".shp"), overwrite=T)}
    }
  } 
  return(i)
}



