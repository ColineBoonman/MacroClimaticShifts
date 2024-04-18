
# note: the word 'lost' or equivalent indicates the exposure to macroclimatic shifts

rm(list = ls())

#-------- directories and data
#setwd("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/")
#setwd(ifelse(Sys.info()[["nodename"]] == "GIS09", "E:/Coline_au710911/","/Volumes/Documenten/Aarhus University 2022-2023/Odrive_ColineBoonman_au710911/"))
setwd("M:/Aarhus University 2022-2023/Odrive_ColineBoonman_au710911/")
InputDir  = "ClimateRefugia.paper/Output/FilesReceivedSelwyn/ShareRasters_2023_10_02/"
OutputDir = "ClimateRefugia.paper/Output/"
FigureDir = "ClimateRefugia.paper/Figures/"
df = read.table(paste0(OutputDir,"ClimateRefugia.txt"),sep=",",dec=".",header=T,check.names = F)
DF = read.table(paste0(OutputDir,"ClimateRefugia_NonAnalogue.txt"),sep=",",dec=".",header=T,check.names = F)

nrow(df[df$stable_climate_percent_ssp370==100,])/nrow(df)*100

#
nrow(df[df$stable_climate_percent_ssp370>90,])/nrow(df)*100
nrow(df[df$lost_area_percent_ssp370>10,])/nrow(df)*100
nrow(df[df$lost_area_percent_ssp370>10,])
nrow(df[df$lost_area_percent_ssp370>50,])/nrow(df)*100
nrow(df[df$lost_area_percent_ssp370>50,])
nrow(df[df$lost_area_percent_ssp370>90,])/nrow(df)*100
nrow(df[df$lost_area_percent_ssp370>90,])

#
nrow(df[df$stable_climate_percent_ssp126>90,])/nrow(df)*100
nrow(df[df$lost_area_percent_ssp126>10,])/nrow(df)*100
nrow(df[df$lost_area_percent_ssp126>10,])
nrow(df[df$lost_area_percent_ssp126>50,])/nrow(df)*100
nrow(df[df$lost_area_percent_ssp126>50,])
nrow(df[df$lost_area_percent_ssp126>90,])/nrow(df)*100
nrow(df[df$lost_area_percent_ssp126>90,])

#
nrow(df[df$stable_climate_percent_ssp585>90,])/nrow(df)*100
nrow(df[df$lost_area_percent_ssp585>10,])/nrow(df)*100
nrow(df[df$lost_area_percent_ssp585>10,])
nrow(df[df$lost_area_percent_ssp585>50,])/nrow(df)*100
nrow(df[df$lost_area_percent_ssp585>50,])
nrow(df[df$lost_area_percent_ssp585>90,])/nrow(df)*100
nrow(df[df$lost_area_percent_ssp585>90,])

#####

nrow(DF[DF$stable_climate_percent_ssp370>90,])/nrow(DF)*100
nrow(DF[DF$lost_area_percent_ssp370>10,])/nrow(DF)*100
nrow(DF[DF$lost_area_percent_ssp370>10,])
nrow(DF[DF$lost_area_percent_ssp370>50,])/nrow(DF)*100
nrow(DF[DF$lost_area_percent_ssp370>50,])
nrow(DF[DF$lost_area_percent_ssp370>90,])/nrow(DF)*100
nrow(DF[DF$lost_area_percent_ssp370>90,])

#
nrow(DF[DF$stable_climate_percent_ssp126>90,])/nrow(DF)*100
nrow(DF[DF$lost_area_percent_ssp126>10,])/nrow(DF)*100
nrow(DF[DF$lost_area_percent_ssp126>10,])
nrow(DF[DF$lost_area_percent_ssp126>50,])/nrow(DF)*100
nrow(DF[DF$lost_area_percent_ssp126>50,])
nrow(DF[DF$lost_area_percent_ssp126>90,])/nrow(DF)*100
nrow(DF[DF$lost_area_percent_ssp126>90,])

#
nrow(DF[DF$stable_climate_percent_ssp585>90,])/nrow(DF)*100
nrow(DF[DF$lost_area_percent_ssp585>10,])/nrow(DF)*100
nrow(DF[DF$lost_area_percent_ssp585>10,])
nrow(DF[DF$lost_area_percent_ssp585>50,])/nrow(DF)*100
nrow(DF[DF$lost_area_percent_ssp585>50,])
nrow(DF[DF$lost_area_percent_ssp585>90,])/nrow(DF)*100
nrow(DF[DF$lost_area_percent_ssp585>90,])

#####

y=c()
x=df$`lost_area_m2_ssp126_GFDL-ESM4`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=df$`lost_area_m2_ssp126_IPSL-CM6A-LR`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=df$`lost_area_m2_ssp126_MPI-ESM1-2-HR`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=df$`lost_area_m2_ssp126_MRI-ESM2-0`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=df$`lost_area_m2_ssp126_UKESM1-0-LL`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
print("difference 126 original <10 exposed");max(y)-min(y)
#
y=c()
x=df$`lost_area_m2_ssp370_GFDL-ESM4`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=df$`lost_area_m2_ssp370_IPSL-CM6A-LR`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=df$`lost_area_m2_ssp370_MPI-ESM1-2-HR`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=df$`lost_area_m2_ssp370_MRI-ESM2-0`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=df$`lost_area_m2_ssp370_UKESM1-0-LL`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
print("difference 370 original <10 exposed");max(y)-min(y)
#
y=c()
x=df$`lost_area_m2_ssp585_GFDL-ESM4`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=df$`lost_area_m2_ssp585_IPSL-CM6A-LR`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=df$`lost_area_m2_ssp585_MPI-ESM1-2-HR`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=df$`lost_area_m2_ssp585_MRI-ESM2-0`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=df$`lost_area_m2_ssp585_UKESM1-0-LL`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
print("difference 585 original <10 exposed");max(y)-min(y)
#
###
y=c()
x=DF$`lost_area_m2_ssp126_GFDL-ESM4`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=DF$`lost_area_m2_ssp126_IPSL-CM6A-LR`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=DF$`lost_area_m2_ssp126_MPI-ESM1-2-HR`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=DF$`lost_area_m2_ssp126_MRI-ESM2-0`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=DF$`lost_area_m2_ssp126_UKESM1-0-LL`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
print("difference 126 NAH <10 exposed");max(y)-min(y)
#
y=c()
x=DF$`lost_area_m2_ssp370_GFDL-ESM4`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=DF$`lost_area_m2_ssp370_IPSL-CM6A-LR`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=DF$`lost_area_m2_ssp370_MPI-ESM1-2-HR`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=DF$`lost_area_m2_ssp370_MRI-ESM2-0`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=DF$`lost_area_m2_ssp370_UKESM1-0-LL`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
print("difference 370 NAH <10 exposed");max(y)-min(y)
#
y=c()
x=DF$`lost_area_m2_ssp585_GFDL-ESM4`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=DF$`lost_area_m2_ssp585_IPSL-CM6A-LR`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=DF$`lost_area_m2_ssp585_MPI-ESM1-2-HR`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=DF$`lost_area_m2_ssp585_MRI-ESM2-0`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
x=DF$`lost_area_m2_ssp585_UKESM1-0-LL`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<10]))
print("difference 585 NAH <10 exposed");max(y)-min(y)
#
###

y=c()
x=df$`lost_area_m2_ssp126_GFDL-ESM4`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=df$`lost_area_m2_ssp126_IPSL-CM6A-LR`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=df$`lost_area_m2_ssp126_MPI-ESM1-2-HR`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=df$`lost_area_m2_ssp126_MRI-ESM2-0`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=df$`lost_area_m2_ssp126_UKESM1-0-LL`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
print("difference 126 original <90 exposed");max(y)-min(y)
#
y=c()
x=df$`lost_area_m2_ssp370_GFDL-ESM4`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=df$`lost_area_m2_ssp370_IPSL-CM6A-LR`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=df$`lost_area_m2_ssp370_MPI-ESM1-2-HR`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=df$`lost_area_m2_ssp370_MRI-ESM2-0`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=df$`lost_area_m2_ssp370_UKESM1-0-LL`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
print("difference 370 original <90 exposed");max(y)-min(y)
#
y=c()
x=df$`lost_area_m2_ssp585_GFDL-ESM4`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=df$`lost_area_m2_ssp585_IPSL-CM6A-LR`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=df$`lost_area_m2_ssp585_MPI-ESM1-2-HR`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=df$`lost_area_m2_ssp585_MRI-ESM2-0`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=df$`lost_area_m2_ssp585_UKESM1-0-LL`*100/df$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
print("difference 585 original <90 exposed");max(y)-min(y)
#
###
y=c()
x=DF$`lost_area_m2_ssp126_GFDL-ESM4`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=DF$`lost_area_m2_ssp126_IPSL-CM6A-LR`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=DF$`lost_area_m2_ssp126_MPI-ESM1-2-HR`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=DF$`lost_area_m2_ssp126_MRI-ESM2-0`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=DF$`lost_area_m2_ssp126_UKESM1-0-LL`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
print("difference 126 NAH <90 exposed");max(y)-min(y)
#
y=c()
x=DF$`lost_area_m2_ssp370_GFDL-ESM4`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=DF$`lost_area_m2_ssp370_IPSL-CM6A-LR`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=DF$`lost_area_m2_ssp370_MPI-ESM1-2-HR`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=DF$`lost_area_m2_ssp370_MRI-ESM2-0`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=DF$`lost_area_m2_ssp370_UKESM1-0-LL`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
print("difference 370 NAH <90 exposed");max(y)-min(y)
#
y=c()
x=DF$`lost_area_m2_ssp585_GFDL-ESM4`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=DF$`lost_area_m2_ssp585_IPSL-CM6A-LR`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=DF$`lost_area_m2_ssp585_MPI-ESM1-2-HR`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=DF$`lost_area_m2_ssp585_MRI-ESM2-0`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
x=DF$`lost_area_m2_ssp585_UKESM1-0-LL`*100/DF$suitable_climate_InRange_m2;y=c(y,length(x[x<90]))
print("difference 585 NAH <90 exposed");max(y)-min(y)
#
###












# --- Discussion section
nrow(df[df$lost_area_m2_ssp370>0,])/nrow(df)
nrow(df[df$lost_area_m2_ssp370>0,])
nrow(df[df$stable_climate_percent_ssp370<50,])/nrow(df)
nrow(df[df$stable_climate_percent_ssp370<50,])
nrow(df[df$stable_climate_percent_ssp126<50,])
nrow(df[df$stable_climate_percent_ssp126<1,])
global.poly = sf::read_sf(paste0(OutputDir,"Global.polygon.shp"))
plot.poly = global.poly[global.poly$id %in% df[df$stable_climate_percent_ssp126<50,"species"],]
sPDF <- rworldmap::getMap();sPDF <- cleangeo::clgeo_Clean(sPDF)  ## Needed to fix up some non-closed polygons 
cont <-sapply(levels(sPDF$continent),
              FUN = function(i) {
                      poly <- rgeos::gUnionCascaded(subset(sPDF, continent==i))## Merge polygons within a continent
                      poly <- sp::spChFIDs(poly, i)## Give each polygon a unique ID
                      sp::SpatialPolygonsDataFrame(poly,data.frame(continent=i, row.names=i))## Make SPDF from SpatialPolygons object
              },USE.NAMES=TRUE)
cont <- Reduce(maptools::spRbind, cont)
raster::plot(cont)
raster::plot(plot.poly,add=T,border="red",col=NA)



# ---------- map locations with 0% species loss
spp370_spLossMapRelative_Original = terra::rast(paste0(OutputDir,"ProcessedMaps/spp370_spLossMapRelative_Original.tif"))
spp370_spLossMapRelative_Original_0 = terra::ifel(spp370_spLossMapRelative_Original>0,0,1)
par(mfrow=c(1,1))
terra::plot((spp370_spLossMapRelative_Original_0),legend = T,  plg=list(cex=2), 
            colNA="white", col=c("lightgreen","red"),axes=FALSE, box=T,
            main=">0%loss ssp370 Species Loss (#)")
terra::summary(spp370_spLossMapRelative_Original_0)

spp370_spLossMapRelative_Original_0larger = terra::ifel(spp370_spLossMapRelative_Original>0,1,NA)
terra::plot(spp370_spLossMapRelative_Original_0larger)
larger0cellsize=terra::cellSize(spp370_spLossMapRelative_Original_0larger, mask=T, unit="km")
terra::plot(larger0cellsize)
terra::global(larger0cellsize,fun="sum",na.rm=T)
expanse(spp370_spLossMapRelative_Original_0larger, unit="km", transform=TRUE, byValue=FALSE) #56564112

spp370_spLossMapRelative_Original_0less = terra::ifel(spp370_spLossMapRelative_Original==0,1,NA)
terra::plot(spp370_spLossMapRelative_Original_0less)
less0cellsize=terra::cellSize(spp370_spLossMapRelative_Original_0less, mask=T, unit="km")
terra::global(less0cellsize,fun="sum",na.rm=T)
expanse(spp370_spLossMapRelative_Original_0less, unit="km", transform=TRUE, byValue=FALSE) #57356031

148326000 #km2 land area according to https://www.nationsonline.org/oneworld/earth.htm#:~:text=Total%20Surface%20Area%3A%20about%20509,total%20surface%20of%20the%20Earth.
#earth terrestrial area (excluding urban in 2019 and cropland in 2020) = 57356031+56564112
56564112*100/148326000 # 38.1% of land area shows an impat of tree diversity fue to macroclimatic shifts




# ---------- biomes of locations with >90% species exposed to macroclimatic shifts
spp370_spLossMapRelative_Original = terra::rast(paste0(OutputDir,"ProcessedMaps/spp370_spLossMapRelative_Original.tif"))
loc90 = terra::ifel(spp370_spLossMapRelative_Original<90,NA,1)
loc90.res0.1.sum = terra::aggregate(loc90,fact=10,fun=function(x){sum(x,na.rm = T)})
loc90.res0.1.sum = terra::ifel(loc90.res0.1.sum==0,NA,loc90.res0.1.sum)
df = terra::as.data.frame(loc90.res0.1.sum,xy=T, na.rm=T)

biomes<-sf::read_sf(dsn = "ClimateRefugia.paper/Input/WWF_biomes",layer="wwf_terr_ecos") #shapefile of Olson biome map
# https://lifesciences.datastations.nl/file.xhtml?fileId=6762&version=2.0
# Olson, D. M., Dinerstein, E., Wikramanayake, E. D., Burgess, N. D., Powell, G. V. N., Underwood, E. C., D'Amico, J. A., Itoua, I., Strand, H. E., Morrison, J. C., Loucks, C. J., Allnutt, T. F., Ricketts, T. H., Kura, Y., Lamoreux, J. F., Wettengel, W. W., Hedao, P., Kassem, K. R. 2001. Terrestrial ecoregions of the world: a new map of life on Earth. Bioscience 51(11):933-938.
biom.map=terra::rasterize(biomes,loc90.res0.1.sum,field="BIOME")

loc90.biomes=terra::extract(biom.map, df[,c("x","y")])#extract ID of the polygons from the new raster

df$biome<-loc90.biomes$BIOME
df$biome[df$biome==1]<-"Tropical and Subtropical Moist Broadleaf Forest"#""
df$biome[df$biome==2]<-"Tropical and Subtropical Dry Broadleaf Forests"#""""
df$biome[df$biome==3]<-"Tropical and Subtropical Coniferous Forests"#""""
df$biome[df$biome==4]<-"Temperate Broadleaf and Mixed Forests"#""
df$biome[df$biome==5]<-"Temperate Coniferous Forests"#""""
df$biome[df$biome==6]<-"Boreal Forests/Taiga"
df$biome[df$biome==7]<-"Tropical and subtropical grasslands, savannas, and shrublands"#""
df$biome[df$biome==8]<-"Temperate Grasslands, Savannas, and Shrublands"#""
df$biome[df$biome==9]<-"Flooded Grasslands and Savannas"#""
df$biome[df$biome==10]<-"Montane Grasslands and Shrublands"#""
df$biome[df$biome==11]<-"Tundra"
df$biome[df$biome==12]<-"Mediterranean Forests, Woodlands, and Scrub"
df$biome[df$biome==13]<-"Deserts and Xeric Shrublands"
df$biome[df$biome==14]<-"Mangroves"
df$biome[df$biome==98]<-"Lakes"
df$biome[df$biome==99]<-"Rock and Ice"
df$biome<-as.factor(df$biome)
x=aggregate(df$X0_water_mask,by=list(df$biome),FUN="sum")
x[order(x$x),]


#-------- Global maps
library(rworldmap)
library(cleangeo)
library(terra)
library(geodata)
countries <- world(resolution = 5, path = "maps")  # you may choose a smaller (more detailed) resolution for the polygon borders, and a different folder path to save the imported map
countries <- merge(countries, country_codes(), by.x = "GID_0", by.y = "ISO3", all.x = TRUE)
cont <- aggregate(countries, by = "continent")
cont<-cont[!cont$continent=="Antarctica",]## Bind the 6 continent-level SPDFs into a single SPDF
# general plotting
plglist = list(x="bottomleft", bg="white", cex=0.68)

biomes = c(
  
  
  "Tundra","Taiga","Temp. Coniferous F.","Lakes",
  "Rock/Ice","Temp. Grassland","Temp. Broadleaf F.","Mont. Grassland",
  "Flooded Grassland","Xeric Shrubland","Mediterranean F.",
  "Trop. Moist Broadleaf F.", "Trop. Coniferous F.","Trop. Dry Broadleaf F.",
  "Trop. Grassland","Mangroves"
)

biomes = biomes[c(12,14,13,7,3,2,15,6,9,8,1,11,10,16,4,5)]


colors = rep("red",16)
colors[1+1] = "#058f03";colors[2+1] = "#07c204";colors[3+1] = "#57f754";colors[4+1] = "#fa7fea";
colors[5+1] = "#c704ae"; colors[6+1] = "#8049de"; colors[7+1] = "yellow"; colors[8+1] = "#f2f2ae";
colors[9+1]  = "#90f5f3"; colors[10+1] = "#d1d108"; colors[11+1] = "#cdb9f0"; 
colors[12+1] = "orange"; colors[13+1] = "#c9780e"; colors[14+1] = "#2fa3a1"; 
colors[15+1] = "#48f7f4"; colors[16+1] = "#3dd4d1"

biom.map = as.factor(biom.map)
loc.point = df[,c("x","y")]
pdf(paste0(FigureDir,"SI.Fig.biomemap.more90percExposure.pdf"),height=5,width=7)
m = c(1.5, 1.5, 1.5, 1.5)
par(mfrow=c(1,1),mar=m, mgp=c(0, 0, 0))
## image 1
setMinMax(biom.map)
levels(biom.map) = data.frame(value=minmax(biom.map)[1]:minmax(biom.map)[2],
                                  category=biomes[minmax(biom.map)[1]:minmax(biom.map)[2]])
terra::coltab(biom.map)[[1]] = data.frame(value=1:16,cols=colors[2:17])
terra::plot(biom.map,colNA="white", plg = plglist, pax=list(las=1), mar = m,legend=T)
terra::points(loc.point, bg="white",col="black", pch=1, cex=0.1)
#terra::plot(cont, border="black", lwd=0.5, add=T, col=NA)
dev.off()




# ---------- map locations with >90% species exposed to macroclimatic shifts
spp370_spLossMapRelative_Original = terra::rast(paste0(OutputDir,"ProcessedMaps/spp370_spLossMapRelative_Original.tif"))
spp370_spLossMapRelative_Original_90 = terra::ifel(spp370_spLossMapRelative_Original<90,0,1)
par(mfrow=c(1,1))
terra::plot((spp370_spLossMapRelative_Original_90),legend = T,  plg=list(cex=2), colNA="white", col=c("lightgreen","red"),axes=FALSE, box=T,main=">90%loss ssp370 Species Loss (#)");terra::plot(cont,add=T)

# ---------- map locations with >90% species exposed to macroclimatic shifts
spp126_spLossMapRelative_Original = terra::rast(paste0(OutputDir,"ProcessedMaps/spp126_spLossMapRelative_Original.tif"))
spp126_spLossMapRelative_Original_90 = terra::ifel(spp126_spLossMapRelative_Original<90,0,1)
par(mfrow=c(1,1))
terra::plot((spp126_spLossMapRelative_Original_90),legend = T,  plg=list(cex=2), colNA="white", col=c("lightgreen","red"),axes=FALSE, box=T,main=">90%loss ssp126 Species Loss (#)");terra::plot(cont,add=T)
max(spp126_spLossMapRelative_Original)
spp126_spLossMapRelative_Original_99 = terra::ifel(spp126_spLossMapRelative_Original<99.5,0,1)
terra::plot((spp126_spLossMapRelative_Original_99),legend = T,  plg=list(cex=2), colNA="white", col=c("lightgreen","red"),axes=FALSE, box=T,main=">99.5%loss ssp126 Species Loss (#)");terra::plot(cont,add=T)


# ---------- map locations with >300 (absolute) species exposed to macroclimatic shifts
ssp370_abs = terra::rast(paste0(OutputDir,"ProcessedMaps/ssp370_absoluteSpLoss.tif"))
ssp370_abs_300 = terra::ifel(ssp370_abs<300,NA,1)
par(mfrow=c(1,1))
terra::plot((ssp370_abs_300),legend = T,  plg=list(cex=2), colNA="white", col=c("red"),axes=FALSE, box=T,main="300 threshold ssp370 Absolute Species Loss (#)");terra::plot(cont,add=T)

# ---------- map locations with >300 (absolute) species exposed to macroclimatic shifts, difference with NAH
spp370_NonAna_spLossMapAbsolute = terra::rast(paste0(OutputDir,"ProcessedMaps/spp370_NonAna_spLossMapAbsolute.tif"))
ssp370_abs_300NAH = terra::ifel(spp370_NonAna_spLossMapAbsolute<300,NA,spp370_NonAna_spLossMapAbsolute)
par(mfrow=c(1,1))
terra::plot((ssp370_abs_300NAH),legend = T,  plg=list(cex=2), colNA="white",axes=FALSE, box=T,main="300 threshold NonAnalogue ssp370 Absolute Species Loss (#)");terra::plot(cont,add=T)
check = ssp370_abs_300NAH * ssp370_abs_300
summary(check[])

# ---------- correlate uncertainty with relative exposed to macroclimatic shifts
loss = terra::rast(paste0(OutputDir,"ProcessedMaps/spp370_spLossMapRelative_Original.tif"))
lossNA = terra::rast(paste0(OutputDir,"ProcessedMaps/spp370_NonAna_spLossMapRelative_Original.tif"))
CI = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp370_spLossMapRelative.tif"))
SE = terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp370_spLossMapRelative.tif"))
#raster_stack = c(spp370_spLossMapRelative_Original,CI_spp370_spLossMapRelative)
#jnk=terra::layerCor(raster_stack, 'pearson', na.rm=T)
#jnk
r_stack <- c(loss,lossNA, CI,SE)
cor_NA <- terra::layerCor(r_stack, "pearson", na.rm=TRUE)
colnames(cor_NA$pearson)=rownames(cor_NA$pearson)=c("loss","lossNA", "CI","SE")
cor_NA


# ---------- Amazon zoom in
crop_maps = function(x) terra::crop(x, terra::ext(c(-80, -40, -20, 12)), snap="near")
library(terra)
library(geodata)
countries <- world(resolution = 5, path = "maps")  # you may choose a smaller (more detailed) resolution for the polygon borders, and a different folder path to save the imported map
countries <- merge(countries, country_codes(), by.x = "GID_0", by.y = "ISO3", all.x = TRUE)
cont <- aggregate(countries, by = "continent")
cont<-cont[!cont$continent=="Antarctica",]## Bind the 6 continent-level SPDFs into a single SPDF

setwd("M:/Aarhus University 2022-2023/Odrive_ColineBoonman_au710911/")
InputDir  = "ClimateRefugia.paper/Output/FilesReceivedSelwyn/ShareRasters_2023_10_02/"
FigureDir = "ClimateRefugia.paper/Figures/"
spp370_spLossMapRelative= terra::rast(paste0(InputDir,"spp370_spLossMapRelative_mean_masked.tif"))
spp370_NonAna_spLossMapRelative= terra::rast(paste0(InputDir,"spp370_NonAna_spLossMapRelative_mean_masked.tif"))
terra::plot(spp370_NonAna_spLossMapRelative)
original = crop_maps(spp370_spLossMapRelative)
NaH = crop_maps(spp370_NonAna_spLossMapRelative)

original = terra::ifel(original==0,NA,original)
NaH = terra::ifel(NaH==0,NA,NaH)

pdf(paste0(FigureDir,"SI.Fig.Amazon.zoomin.pdf"),height=3,width=7)
par(mfrow=c(1,2))
terra::plot(original,col=rev(grDevices::topo.colors(100)), main="Original framework")
terra::plot(NaH,col=rev(topo.colors(100)), main="Non-analogue framework")
dev.off()


#-------- directories and data
rm(list = ls())
dir = "O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/ClimateRefugia.paper/"
InputDir = "O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/TREECHANGE_InputData/"
OutputDir = paste0(dir,"Output/")
FigureDir = paste0(dir,"Figures/")

df = read.table(paste0(getwd(),"ClimateRefugia.paper/old/ClimateRefugia.txt"),sep=",",dec=".",header=T)
toVec = function(x) eval(parse(text=x))
climZonesCurrent = lapply(df$climZonesCurrent,toVec)

sp.list=c()
zone.list=c()
for(i in 1:nrow(df)){
        print(paste0(i," -- ",nrow(df)))
        x = climZonesCurrent[[i]]
        sp = df$sp[i]
        sp.list = c(sp.list,sp)
        zone.list = c(zone.list,length(x))
}
x=as.data.frame(table(zone.list))
colnames(x)[1]="nr.climzones"

save.info=data.frame(species=df$sp,nr.climzones=rep(NA,nrow(df)))
for(i in 1:nrow(df)){
        print(paste0(i," -- ",nrow(df)))
        x = climZonesCurrent[[i]]
        sp = df$sp[i]
        save.info[match(sp,save.info$species),"nr.climzones"]=length(x)
}

df = read.table(paste0(OutputDir,"ClimateRefugia.txt"),sep=",",dec=".",header=T,check.names = F)
DF = read.table(paste0(OutputDir,"ClimateRefugia_NonAnalogue.txt"),sep=",",dec=".",header=T,check.names = F)
df=merge(df,save.info,by=c("species"),all=T)
DF=merge(DF,save.info,by=c("species"),all=T)


boxplot(lost_area_percent_ssp126 ~ nr.climzones, data=df);lm(lost_area_percent_ssp126~nr.climzones,data=df)
boxplot(lost_area_percent_ssp370 ~ nr.climzones, data=df);lm(lost_area_percent_ssp370~nr.climzones,data=df)
boxplot(lost_area_percent_ssp585 ~ nr.climzones, data=df);lm(lost_area_percent_ssp585~nr.climzones,data=df)





















climzone.nr=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31)
climzone.abr=c("Af","Am","As","Aw","BWk","BWh","BSk","BSh","Cfa","Cfb","Cfc","Csa","Csb","Csc","Cwa","Cwb","Cwc","Dfa","Dfb","Dfc","Dfd","Dsa","Dsb","Dsc","Dsd","Dwa","Dwb","Dwc","Dwd","ET","EF")
climzone.ful=c(
        "equatorial fully humid",
        "equatorial monsoonal",
        "equatorial summer dry",
        "equatorial winter dry",
        "cold desert",
        "hot desert",
        "cold step",
        "hot steppe",
        "warm temperate fully humid hot summer",
        "warm temperate fully humid warm summer",
        "warm temperate fully humid cool summer",
        "warm temperate summer dry hot summer",
        "warm temperate summer dry warm summer",
        "warm temperate summer dry cool summer",
        "warm temperate winter dry hot summer",
        "warm temperate winter dry warm summer",
        "warm temperate winter dry cool summer",
        "snow fully humid hot summer",
        "snow fully humid warm summer",
        "snow fully humid cool summer",
        "snow fully humid extremely continental",
        "snow summer dry hot summer",
        "snow summer dry warm summer",
        "snow summer dry cool summer",
        "snow summer dry extremely continental",
        "snow winter dry hot summ",
        "snow winter dry warm summer",
        "snow winter dry cool summer",
        "snow winter dry extremely continental",
        "polar tundra",
        "polar frost"
) 
climzones = data.frame(nr=climzone.nr,abr=climzone.abr,full=climzone.ful)








