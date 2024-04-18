rm(list = ls())

#-------- directories and data
setwd("M:/Aarhus University 2022-2023/Odrive_ColineBoonman_au710911/")
InputDir  = "ClimateRefugia.paper/Output/FilesReceivedSelwyn/ShareRasters_2023_10_02/"
OutputDir = "ClimateRefugia.paper/Output/"
FigureDir = "ClimateRefugia.paper/Figures/"
df = read.table(paste0(OutputDir,"ClimateRefugia.txt"),sep=",",dec=".",header=T,check.names = F)
DF = read.table(paste0(OutputDir,"ClimateRefugia_NonAnalogue.txt"),sep=",",dec=".",header=T,check.names = F)

# toVec = function(x) eval(parse(text=x))
# AreaLost=fst::read_fst("SpeciesClimAreaLostKm2_kg2_2071-2100_GFDL-ESM4_ssp585_2023_06_03.fst")
# climZonesCurrent = lapply(AreaLost$climZonesCurrent,toVec)
# climZonesFuture = lapply(AreaLost$climZonesFuture,toVec)
# new = climZonesFuture[which(climZonesFuture %in% climZonesCurrent)]

# #wide extent (>20,000 km2), regional extent (5,000 km2 < extent <20,000 km2) would be referred to as medium-ranged. Species with a local extent (< 5,000 km2) 
# df$EOO = NA
# df$EOO[df$suitable_climate_InRange_m2>=20000*1000000]="Large"
# df$EOO[df$suitable_climate_InRange_m2<20000*1000000 & df$suitable_climate_InRange_m2>=5000*1000000]="Medium"
# df$EOO[df$suitable_climate_InRange_m2<5000*1000000]="Small"
# eoo <- as.factor(df$EOO)


df$`lost_area_percent_ssp126_GFDL-ESM4` = df$`lost_area_m2_ssp126_GFDL-ESM4`*100/df$suitable_climate_InRange_m2
df$`lost_area_percent_ssp126_IPSL-CM6A-LR` = df$`lost_area_m2_ssp126_IPSL-CM6A-LR`*100/df$suitable_climate_InRange_m2
df$`lost_area_percent_ssp126_MPI-ESM1-2-HR` = df$`lost_area_m2_ssp126_MPI-ESM1-2-HR`*100/df$suitable_climate_InRange_m2
df$`lost_area_percent_ssp126_UKESM1-0-LL` = df$`lost_area_m2_ssp126_UKESM1-0-LL`*100/df$suitable_climate_InRange_m2
df$`lost_area_percent_ssp126_MRI-ESM2-0` = df$`lost_area_m2_ssp126_MRI-ESM2-0`*100/df$suitable_climate_InRange_m2
df$`lost_area_percent_ssp370_GFDL-ESM4` = df$`lost_area_m2_ssp370_GFDL-ESM4`*100/df$suitable_climate_InRange_m2
df$`lost_area_percent_ssp370_IPSL-CM6A-LR` = df$`lost_area_m2_ssp370_IPSL-CM6A-LR`*100/df$suitable_climate_InRange_m2
df$`lost_area_percent_ssp370_MPI-ESM1-2-HR` = df$`lost_area_m2_ssp370_MPI-ESM1-2-HR`*100/df$suitable_climate_InRange_m2
df$`lost_area_percent_ssp370_UKESM1-0-LL` = df$`lost_area_m2_ssp370_UKESM1-0-LL`*100/df$suitable_climate_InRange_m2
df$`lost_area_percent_ssp370_MRI-ESM2-0` = df$`lost_area_m2_ssp370_MRI-ESM2-0`*100/df$suitable_climate_InRange_m2
df$`lost_area_percent_ssp585_GFDL-ESM4` = df$`lost_area_m2_ssp585_GFDL-ESM4`*100/df$suitable_climate_InRange_m2
df$`lost_area_percent_ssp585_IPSL-CM6A-LR` = df$`lost_area_m2_ssp585_IPSL-CM6A-LR`*100/df$suitable_climate_InRange_m2
df$`lost_area_percent_ssp585_MPI-ESM1-2-HR` = df$`lost_area_m2_ssp585_MPI-ESM1-2-HR`*100/df$suitable_climate_InRange_m2
df$`lost_area_percent_ssp585_UKESM1-0-LL` = df$`lost_area_m2_ssp585_UKESM1-0-LL`*100/df$suitable_climate_InRange_m2
df$`lost_area_percent_ssp585_MRI-ESM2-0` = df$`lost_area_m2_ssp585_MRI-ESM2-0`*100/df$suitable_climate_InRange_m2
DF$`lost_area_percent_ssp126_GFDL-ESM4` = DF$`lost_area_m2_ssp126_GFDL-ESM4`*100/DF$suitable_climate_InRange_m2
DF$`lost_area_percent_ssp126_IPSL-CM6A-LR` = DF$`lost_area_m2_ssp126_IPSL-CM6A-LR`*100/DF$suitable_climate_InRange_m2
DF$`lost_area_percent_ssp126_MPI-ESM1-2-HR` = DF$`lost_area_m2_ssp126_MPI-ESM1-2-HR`*100/DF$suitable_climate_InRange_m2
DF$`lost_area_percent_ssp126_UKESM1-0-LL` = DF$`lost_area_m2_ssp126_UKESM1-0-LL`*100/DF$suitable_climate_InRange_m2
DF$`lost_area_percent_ssp126_MRI-ESM2-0` = DF$`lost_area_m2_ssp126_MRI-ESM2-0`*100/DF$suitable_climate_InRange_m2
DF$`lost_area_percent_ssp370_GFDL-ESM4` = DF$`lost_area_m2_ssp370_GFDL-ESM4`*100/DF$suitable_climate_InRange_m2
DF$`lost_area_percent_ssp370_IPSL-CM6A-LR` = DF$`lost_area_m2_ssp370_IPSL-CM6A-LR`*100/DF$suitable_climate_InRange_m2
DF$`lost_area_percent_ssp370_MPI-ESM1-2-HR` = DF$`lost_area_m2_ssp370_MPI-ESM1-2-HR`*100/DF$suitable_climate_InRange_m2
DF$`lost_area_percent_ssp370_UKESM1-0-LL` = DF$`lost_area_m2_ssp370_UKESM1-0-LL`*100/DF$suitable_climate_InRange_m2
DF$`lost_area_percent_ssp370_MRI-ESM2-0` = DF$`lost_area_m2_ssp370_MRI-ESM2-0`*100/DF$suitable_climate_InRange_m2
DF$`lost_area_percent_ssp585_GFDL-ESM4` = DF$`lost_area_m2_ssp585_GFDL-ESM4`*100/DF$suitable_climate_InRange_m2
DF$`lost_area_percent_ssp585_IPSL-CM6A-LR` = DF$`lost_area_m2_ssp585_IPSL-CM6A-LR`*100/DF$suitable_climate_InRange_m2
DF$`lost_area_percent_ssp585_MPI-ESM1-2-HR` = DF$`lost_area_m2_ssp585_MPI-ESM1-2-HR`*100/DF$suitable_climate_InRange_m2
DF$`lost_area_percent_ssp585_UKESM1-0-LL` = DF$`lost_area_m2_ssp585_UKESM1-0-LL`*100/DF$suitable_climate_InRange_m2
DF$`lost_area_percent_ssp585_MRI-ESM2-0` = DF$`lost_area_m2_ssp585_MRI-ESM2-0`*100/DF$suitable_climate_InRange_m2
#
df$`stable_climate_percent_ssp126_GFDL-ESM4` = (df$suitable_climate_InRange_m2-df$`lost_area_m2_ssp126_GFDL-ESM4`)*100/df$suitable_climate_InRange_m2
df$`stable_climate_percent_ssp126_IPSL-CM6A-LR` = (df$suitable_climate_InRange_m2-df$`lost_area_m2_ssp126_IPSL-CM6A-LR`)*100/df$suitable_climate_InRange_m2
df$`stable_climate_percent_ssp126_MPI-ESM1-2-HR` = (df$suitable_climate_InRange_m2-df$`lost_area_m2_ssp126_MPI-ESM1-2-HR`)*100/df$suitable_climate_InRange_m2
df$`stable_climate_percent_ssp126_UKESM1-0-LL` = (df$suitable_climate_InRange_m2-df$`lost_area_m2_ssp126_UKESM1-0-LL`)*100/df$suitable_climate_InRange_m2
df$`stable_climate_percent_ssp126_MRI-ESM2-0` = (df$suitable_climate_InRange_m2-df$`lost_area_m2_ssp126_MRI-ESM2-0`)*100/df$suitable_climate_InRange_m2
df$`stable_climate_percent_ssp370_GFDL-ESM4` = (df$suitable_climate_InRange_m2-df$`lost_area_m2_ssp370_GFDL-ESM4`)*100/df$suitable_climate_InRange_m2
df$`stable_climate_percent_ssp370_IPSL-CM6A-LR` = (df$suitable_climate_InRange_m2-df$`lost_area_m2_ssp370_IPSL-CM6A-LR`)*100/df$suitable_climate_InRange_m2
df$`stable_climate_percent_ssp370_MPI-ESM1-2-HR` = (df$suitable_climate_InRange_m2-df$`lost_area_m2_ssp370_MPI-ESM1-2-HR`)*100/df$suitable_climate_InRange_m2
df$`stable_climate_percent_ssp370_UKESM1-0-LL` = (df$suitable_climate_InRange_m2-df$`lost_area_m2_ssp370_UKESM1-0-LL`)*100/df$suitable_climate_InRange_m2
df$`stable_climate_percent_ssp370_MRI-ESM2-0` = (df$suitable_climate_InRange_m2-df$`lost_area_m2_ssp370_MRI-ESM2-0`)*100/df$suitable_climate_InRange_m2
df$`stable_climate_percent_ssp585_GFDL-ESM4` = (df$suitable_climate_InRange_m2-df$`lost_area_m2_ssp585_GFDL-ESM4`)*100/df$suitable_climate_InRange_m2
df$`stable_climate_percent_ssp585_IPSL-CM6A-LR` = (df$suitable_climate_InRange_m2-df$`lost_area_m2_ssp585_IPSL-CM6A-LR`)*100/df$suitable_climate_InRange_m2
df$`stable_climate_percent_ssp585_MPI-ESM1-2-HR` = (df$suitable_climate_InRange_m2-df$`lost_area_m2_ssp585_MPI-ESM1-2-HR`)*100/df$suitable_climate_InRange_m2
df$`stable_climate_percent_ssp585_UKESM1-0-LL` = (df$suitable_climate_InRange_m2-df$`lost_area_m2_ssp585_UKESM1-0-LL`)*100/df$suitable_climate_InRange_m2
df$`stable_climate_percent_ssp585_MRI-ESM2-0` = (df$suitable_climate_InRange_m2-df$`lost_area_m2_ssp585_MRI-ESM2-0`)*100/df$suitable_climate_InRange_m2
DF$`stable_climate_percent_ssp126_GFDL-ESM4` = (DF$suitable_climate_InRange_m2-DF$`lost_area_m2_ssp126_GFDL-ESM4`)*100/DF$suitable_climate_InRange_m2
DF$`stable_climate_percent_ssp126_IPSL-CM6A-LR` = (DF$suitable_climate_InRange_m2-DF$`lost_area_m2_ssp126_IPSL-CM6A-LR`)*100/DF$suitable_climate_InRange_m2
DF$`stable_climate_percent_ssp126_MPI-ESM1-2-HR` = (DF$suitable_climate_InRange_m2-DF$`lost_area_m2_ssp126_MPI-ESM1-2-HR`)*100/DF$suitable_climate_InRange_m2
DF$`stable_climate_percent_ssp126_UKESM1-0-LL` = (DF$suitable_climate_InRange_m2-DF$`lost_area_m2_ssp126_UKESM1-0-LL`)*100/DF$suitable_climate_InRange_m2
DF$`stable_climate_percent_ssp126_MRI-ESM2-0` = (DF$suitable_climate_InRange_m2-DF$`lost_area_m2_ssp126_MRI-ESM2-0`)*100/DF$suitable_climate_InRange_m2
DF$`stable_climate_percent_ssp370_GFDL-ESM4` = (DF$suitable_climate_InRange_m2-DF$`lost_area_m2_ssp370_GFDL-ESM4`)*100/DF$suitable_climate_InRange_m2
DF$`stable_climate_percent_ssp370_IPSL-CM6A-LR` = (DF$suitable_climate_InRange_m2-DF$`lost_area_m2_ssp370_IPSL-CM6A-LR`)*100/DF$suitable_climate_InRange_m2
DF$`stable_climate_percent_ssp370_MPI-ESM1-2-HR` = (DF$suitable_climate_InRange_m2-DF$`lost_area_m2_ssp370_MPI-ESM1-2-HR`)*100/DF$suitable_climate_InRange_m2
DF$`stable_climate_percent_ssp370_UKESM1-0-LL` = (DF$suitable_climate_InRange_m2-DF$`lost_area_m2_ssp370_UKESM1-0-LL`)*100/DF$suitable_climate_InRange_m2
DF$`stable_climate_percent_ssp370_MRI-ESM2-0` = (DF$suitable_climate_InRange_m2-DF$`lost_area_m2_ssp370_MRI-ESM2-0`)*100/DF$suitable_climate_InRange_m2
DF$`stable_climate_percent_ssp585_GFDL-ESM4` = (DF$suitable_climate_InRange_m2-DF$`lost_area_m2_ssp585_GFDL-ESM4`)*100/DF$suitable_climate_InRange_m2
DF$`stable_climate_percent_ssp585_IPSL-CM6A-LR` = (DF$suitable_climate_InRange_m2-DF$`lost_area_m2_ssp585_IPSL-CM6A-LR`)*100/DF$suitable_climate_InRange_m2
DF$`stable_climate_percent_ssp585_MPI-ESM1-2-HR` = (DF$suitable_climate_InRange_m2-DF$`lost_area_m2_ssp585_MPI-ESM1-2-HR`)*100/DF$suitable_climate_InRange_m2
DF$`stable_climate_percent_ssp585_UKESM1-0-LL` = (DF$suitable_climate_InRange_m2-DF$`lost_area_m2_ssp585_UKESM1-0-LL`)*100/DF$suitable_climate_InRange_m2
DF$`stable_climate_percent_ssp585_MRI-ESM2-0` = (DF$suitable_climate_InRange_m2-DF$`lost_area_m2_ssp585_MRI-ESM2-0`)*100/DF$suitable_climate_InRange_m2
#



#-------- relationship between refuge areas and range size
df$suitable_climate_InRange_km2 = df$suitable_climate_InRange_m2/1000000
DF$suitable_climate_InRange_km2 = DF$suitable_climate_InRange_m2/1000000
s=c()
s=c(s,cor(df$suitable_climate_InRange_km2,df$stable_climate_percent_ssp126))
s=c(s,cor(df$suitable_climate_InRange_km2,df$stable_climate_percent_ssp370))
s=c(s,cor(df$suitable_climate_InRange_km2,df$stable_climate_percent_ssp585))
s=c(s,cor(DF$suitable_climate_InRange_km2,DF$stable_climate_percent_ssp126))
s=c(s,cor(DF$suitable_climate_InRange_km2,DF$stable_climate_percent_ssp370))
s=c(s,cor(DF$suitable_climate_InRange_km2,DF$stable_climate_percent_ssp585))
s=c(s,cor(df$suitable_climate_InRange_km2,df$`stable_climate_percent_ssp126_GFDL-ESM4`))
s=c(s,cor(df$suitable_climate_InRange_km2,df$`stable_climate_percent_ssp126_IPSL-CM6A-LR`))
s=c(s,cor(df$suitable_climate_InRange_km2,df$`stable_climate_percent_ssp126_MPI-ESM1-2-HR`))
s=c(s,cor(df$suitable_climate_InRange_km2,df$`stable_climate_percent_ssp126_MRI-ESM2-0`))
s=c(s,cor(df$suitable_climate_InRange_km2,df$`stable_climate_percent_ssp126_UKESM1-0-LL`))
s=c(s,cor(DF$suitable_climate_InRange_km2,DF$`stable_climate_percent_ssp126_GFDL-ESM4`))
s=c(s,cor(DF$suitable_climate_InRange_km2,DF$`stable_climate_percent_ssp126_IPSL-CM6A-LR`))
s=c(s,cor(DF$suitable_climate_InRange_km2,DF$`stable_climate_percent_ssp126_MPI-ESM1-2-HR`))
s=c(s,cor(DF$suitable_climate_InRange_km2,DF$`stable_climate_percent_ssp126_MRI-ESM2-0`))
s=c(s,cor(DF$suitable_climate_InRange_km2,DF$`stable_climate_percent_ssp126_UKESM1-0-LL`))
s=c(s,cor(df$suitable_climate_InRange_km2,df$`stable_climate_percent_ssp370_GFDL-ESM4`))
s=c(s,cor(df$suitable_climate_InRange_km2,df$`stable_climate_percent_ssp370_IPSL-CM6A-LR`))
s=c(s,cor(df$suitable_climate_InRange_km2,df$`stable_climate_percent_ssp370_MPI-ESM1-2-HR`))
s=c(s,cor(df$suitable_climate_InRange_km2,df$`stable_climate_percent_ssp370_MRI-ESM2-0`))
s=c(s,cor(df$suitable_climate_InRange_km2,df$`stable_climate_percent_ssp370_UKESM1-0-LL`))
s=c(s,cor(DF$suitable_climate_InRange_km2,DF$`stable_climate_percent_ssp370_GFDL-ESM4`))
s=c(s,cor(DF$suitable_climate_InRange_km2,DF$`stable_climate_percent_ssp370_IPSL-CM6A-LR`))
s=c(s,cor(DF$suitable_climate_InRange_km2,DF$`stable_climate_percent_ssp370_MPI-ESM1-2-HR`))
s=c(s,cor(DF$suitable_climate_InRange_km2,DF$`stable_climate_percent_ssp370_MRI-ESM2-0`))
s=c(s,cor(DF$suitable_climate_InRange_km2,DF$`stable_climate_percent_ssp370_UKESM1-0-LL`))
s=c(s,cor(df$suitable_climate_InRange_km2,df$`stable_climate_percent_ssp585_GFDL-ESM4`))
s=c(s,cor(df$suitable_climate_InRange_km2,df$`stable_climate_percent_ssp585_IPSL-CM6A-LR`))
s=c(s,cor(df$suitable_climate_InRange_km2,df$`stable_climate_percent_ssp585_MPI-ESM1-2-HR`))
s=c(s,cor(df$suitable_climate_InRange_km2,df$`stable_climate_percent_ssp585_MRI-ESM2-0`))
s=c(s,cor(df$suitable_climate_InRange_km2,df$`stable_climate_percent_ssp585_UKESM1-0-LL`))
s=c(s,cor(DF$suitable_climate_InRange_km2,DF$`stable_climate_percent_ssp585_GFDL-ESM4`))
s=c(s,cor(DF$suitable_climate_InRange_km2,DF$`stable_climate_percent_ssp585_IPSL-CM6A-LR`))
s=c(s,cor(DF$suitable_climate_InRange_km2,DF$`stable_climate_percent_ssp585_MPI-ESM1-2-HR`))
s=c(s,cor(DF$suitable_climate_InRange_km2,DF$`stable_climate_percent_ssp585_MRI-ESM2-0`))
s=c(s,cor(DF$suitable_climate_InRange_km2,DF$`stable_climate_percent_ssp585_UKESM1-0-LL`))
summary(s)

S = data.frame(r=s,what=c('no_ssp126_mean','no_ssp370_mean','no_ssp585_mean',
                          'NA_ssp126_mean','NA_ssp370_mean','NA_ssp585_mean',
                          'no_ssp126_GFDL-ESM4',        
                          'no_ssp126_IPSL-CM6A-LR',
                          'no_ssp126_MPI-ESM1-2-HR',    
                          'no_ssp126_MRI-ESM2-0',
                          'no_ssp126_UKESM1-0-LL',      
                          'NA_ssp126_GFDL-ESM4',
                          'NA_ssp126_IPSL-CM6A-LR',     
                          'NA_ssp126_MPI-ESM1-2-HR',
                          'NA_ssp126_MRI-ESM2-0',       
                          'NA_ssp126_UKESM1-0-LL',
                          'no_ssp370_GFDL-ESM4',        
                          'no_ssp370_IPSL-CM6A-LR',
                          'no_ssp370_MPI-ESM1-2-HR',    
                          'no_ssp370_MRI-ESM2-0',
                          'no_ssp370_UKESM1-0-LL',      
                          'NA_ssp370_GFDL-ESM4',
                          'NA_ssp370_IPSL-CM6A-LR',     
                          'NA_ssp370_MPI-ESM1-2-HR',
                          'NA_ssp370_MRI-ESM2-0',       
                          'NA_ssp370_UKESM1-0-LL',
                          'no_ssp585_GFDL-ESM4',        
                          'no_ssp585_IPSL-CM6A-LR',
                          'no_ssp585_MPI-ESM1-2-HR',    
                          'no_ssp585_MRI-ESM2-0',
                          'no_ssp585_UKESM1-0-LL',      
                          'NA_ssp585_GFDL-ESM4',
                          'NA_ssp585_IPSL-CM6A-LR',     
                          'NA_ssp585_MPI-ESM1-2-HR',
                          'NA_ssp585_MRI-ESM2-0',       
                          'NA_ssp585_UKESM1-0-LL'))
S[grep("126",S$what),]
S[grep("370",S$what),]
S[grep("585",S$what),]

S[grep("no",S$what),]
S[grep("NA",S$what),]





#-------- distribution of refuge areas
pdf(paste0(FigureDir,"CumRefuge.pdf"),height=6,width=8)
m = c(3.1, 3.1, 2.1, 2.1)
par(mfrow=c(1,1),mar=m, mgp=c(1.5,0.5,0))
cexsize = 1.3
extracex = 2
x = 2 #lty for non-analogue
#
df <- df[order(df$stable_climate_percent_ssp126), ];df$sp.nr = 1:nrow(df)
plot((df$stable_climate_percent_ssp126),df$sp.nr,col = "black",
     xlab = "Climate Change Refuge area relative to species extent (%)",
     ylab= "Cummulative number of species", lwd = cexsize,  lty = 1, type = "l")
df <- df[order(df$`stable_climate_percent_ssp126_GFDL-ESM4`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_GFDL-ESM4`,df$sp.nr,col = "grey",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp126_IPSL-CM6A-LR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_IPSL-CM6A-LR`,df$sp.nr,col = "grey",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp126_MPI-ESM1-2-HR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_MPI-ESM1-2-HR`,df$sp.nr,col = "grey",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp126_UKESM1-0-LL`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_UKESM1-0-LL`,df$sp.nr,col = "grey",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp126_MRI-ESM2-0`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_MRI-ESM2-0`,df$sp.nr,col = "grey",lwd = cexsize,  lty = 1)
#
df <- df[order(df$stable_climate_percent_ssp370), ];df$sp.nr = 1:nrow(df)
#lines((df$stable_climate_percent_ssp370),df$sp.nr,col = "#734ccf",lwd = cexsize,  lty = 1) 
df <- df[order(df$`stable_climate_percent_ssp370_GFDL-ESM4`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_GFDL-ESM4`,df$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp370_IPSL-CM6A-LR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_IPSL-CM6A-LR`,df$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp370_MPI-ESM1-2-HR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_MPI-ESM1-2-HR`,df$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp370_UKESM1-0-LL`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_UKESM1-0-LL`,df$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp370_MRI-ESM2-0`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_MRI-ESM2-0`,df$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = 1)
#
df <- df[order(df$stable_climate_percent_ssp585), ];df$sp.nr = 1:nrow(df)
#lines((df$stable_climate_percent_ssp585),df$sp.nr,col = "#ff7f00",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp585_GFDL-ESM4`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_GFDL-ESM4`,df$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = 1) 
df <- df[order(df$`stable_climate_percent_ssp585_IPSL-CM6A-LR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_IPSL-CM6A-LR`,df$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp585_MPI-ESM1-2-HR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_MPI-ESM1-2-HR`,df$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp585_UKESM1-0-LL`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_UKESM1-0-LL`,df$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp585_MRI-ESM2-0`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_MRI-ESM2-0`,df$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = 1)
#
# 370 Purple = #6a3d9a and #cab2d6
# 126 blacdk = black grey
# 585 red = #ff7f00 and #fdbf6f
#
DF <- DF[order(DF$stable_climate_percent_ssp126), ];DF$sp.nr = 1:nrow(DF)
#lines(DF$stable_climate_percent_ssp126,DF$sp.nr,col = "black",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_GFDL-ESM4`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_GFDL-ESM4`,DF$sp.nr,col = "grey",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_IPSL-CM6A-LR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_IPSL-CM6A-LR`,DF$sp.nr,col = "grey",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_MPI-ESM1-2-HR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_MPI-ESM1-2-HR`,DF$sp.nr,col = "grey",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_UKESM1-0-LL`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_UKESM1-0-LL`,DF$sp.nr,col = "grey",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_MRI-ESM2-0`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_MRI-ESM2-0`,DF$sp.nr,col = "grey",lwd = cexsize,  lty = x)
#
DF <- DF[order(DF$stable_climate_percent_ssp370), ];DF$sp.nr = 1:nrow(DF)
#lines((DF$stable_climate_percent_ssp370),DF$sp.nr,col = "#6a3d9a",lwd = cexsize,  lty = x) #
DF <- DF[order(DF$`stable_climate_percent_ssp370_GFDL-ESM4`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_GFDL-ESM4`,DF$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp370_IPSL-CM6A-LR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_IPSL-CM6A-LR`,DF$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp370_MPI-ESM1-2-HR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_MPI-ESM1-2-HR`,DF$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp370_UKESM1-0-LL`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_UKESM1-0-LL`,DF$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp370_MRI-ESM2-0`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_MRI-ESM2-0`,DF$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = x)
#
DF <- DF[order(DF$stable_climate_percent_ssp585), ];DF$sp.nr = 1:nrow(DF)
#lines((DF$stable_climate_percent_ssp585),DF$sp.nr,col = "#ff7f00",lwd = cexsize,  lty = x)# 
DF <- DF[order(DF$`stable_climate_percent_ssp585_GFDL-ESM4`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_GFDL-ESM4`,DF$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp585_IPSL-CM6A-LR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_IPSL-CM6A-LR`,DF$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp585_MPI-ESM1-2-HR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_MPI-ESM1-2-HR`,DF$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp585_UKESM1-0-LL`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_UKESM1-0-LL`,DF$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp585_MRI-ESM2-0`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_MRI-ESM2-0`,DF$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = x)
#
#
df <- df[order(df$stable_climate_percent_ssp126), ];df$sp.nr = 1:nrow(df)
lines(df$stable_climate_percent_ssp126,df$sp.nr,col = "black",lwd = cexsize+extracex,  lty = 1) #
df <- df[order(df$stable_climate_percent_ssp370), ];df$sp.nr = 1:nrow(df)
lines(df$stable_climate_percent_ssp370,df$sp.nr,col = "#734ccf",lwd = cexsize+extracex,  lty = 1) #
df <- df[order(df$stable_climate_percent_ssp585), ];df$sp.nr = 1:nrow(df)
lines(df$stable_climate_percent_ssp585,df$sp.nr,col = "#ff7f00",lwd = cexsize+extracex,  lty = 1) #
#
DF <- DF[order(DF$stable_climate_percent_ssp126), ];DF$sp.nr = 1:nrow(DF)
lines(DF$stable_climate_percent_ssp126,DF$sp.nr,col = "black",lwd = cexsize+extracex,  lty = x) #
DF <- DF[order(DF$stable_climate_percent_ssp370), ];DF$sp.nr = 1:nrow(DF)
lines(DF$stable_climate_percent_ssp370,DF$sp.nr,col = "#734ccf",lwd = cexsize+extracex,  lty = x) #
DF <- DF[order(DF$stable_climate_percent_ssp585), ];DF$sp.nr = 1:nrow(DF)
lines(DF$stable_climate_percent_ssp585,DF$sp.nr,col = "#ff7f00",lwd = cexsize+extracex,  lty = x) #
#
legend(x=0, y=30000, legend=c("SSP126", "SSP370","SSP585","SSP126 - NaH", "SSP370 - NaH","SSP585 - NaH"), 
       col = rep(c("black","#734ccf","#ff7f00"),2),lty=c(1,1,1,x,x,x),ncol=2,lwd=2
)

#
df <- df[order(df$stable_climate_percent_ssp126), ];df$sp.nr = 1:nrow(df)
lines(df$stable_climate_percent_ssp126,df$sp.nr,col = "black",lwd = cexsize+extracex,  lty = 1) #
# points(x=df[1000,"stable_climate_percent_ssp126"],y=1000,pch=19,cex=1,col="black")
df <- df[order(df$stable_climate_percent_ssp370), ];df$sp.nr = 1:nrow(df)
lines(df$stable_climate_percent_ssp370,df$sp.nr,col = "#734ccf",lwd = cexsize+extracex,  lty = 1) #
# points(x=df[1000,"stable_climate_percent_ssp370"],y=1000,pch=19,cex=1,col="#734ccf")
df <- df[order(df$stable_climate_percent_ssp585), ];df$sp.nr = 1:nrow(df)
lines(df$stable_climate_percent_ssp585,df$sp.nr,col = "#ff7f00",lwd = cexsize+extracex,  lty = 1) #
# points(x=df[1000,"stable_climate_percent_ssp585"],y=1000,pch=19,cex=1,col="#ff7f00")
#
DF <- DF[order(DF$stable_climate_percent_ssp126), ];DF$sp.nr = 1:nrow(DF)
lines(DF$stable_climate_percent_ssp126,DF$sp.nr,col = "black",lwd = cexsize+extracex,  lty = x) #
# points(x=DF[1000,"stable_climate_percent_ssp126"],y=1000,pch=19,cex=1,col="black")
DF <- DF[order(DF$stable_climate_percent_ssp370), ];DF$sp.nr = 1:nrow(DF)
lines(DF$stable_climate_percent_ssp370,DF$sp.nr,col = "#734ccf",lwd = cexsize+extracex,  lty = x) #
# points(x=DF[1000,"stable_climate_percent_ssp370"],y=1000,pch=19,cex=1,col="#734ccf")
DF <- DF[order(DF$stable_climate_percent_ssp585), ];DF$sp.nr = 1:nrow(DF)
lines(DF$stable_climate_percent_ssp585,DF$sp.nr,col = "#ff7f00",lwd = cexsize+extracex,  lty = x) #
# points(x=DF[1000,"stable_climate_percent_ssp585"],y=1000,pch=19,cex=1,col="#ff7f00")
#

dev.off()





#-------- distribution of refuge areas
pdf(paste0(FigureDir,"CumRefuge.insert1.pdf"),height=6,width=8)
m = c(3.1, 3.1, 2.1, 2.1)
par(mfrow=c(1,1),mar=m, mgp=c(1.5,0.5,0))
cexsize = 1.3
extracex = 2
x = 2 #lty for non-analogue
#
df <- df[order(df$stable_climate_percent_ssp126), ];df$sp.nr = 1:nrow(df)
plot((df$stable_climate_percent_ssp126),df$sp.nr,col = "black",
     xlab = "Climate Change Refuge area relative to species extent (%)",
     ylab= "Cummulative number of species", lwd = cexsize,  lty = 1, type = "l",ylim=c(0,5000),xlim=c(0,50))
df <- df[order(df$`stable_climate_percent_ssp126_GFDL-ESM4`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_GFDL-ESM4`,df$sp.nr,col = "grey",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp126_IPSL-CM6A-LR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_IPSL-CM6A-LR`,df$sp.nr,col = "grey",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp126_MPI-ESM1-2-HR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_MPI-ESM1-2-HR`,df$sp.nr,col = "grey",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp126_UKESM1-0-LL`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_UKESM1-0-LL`,df$sp.nr,col = "grey",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp126_MRI-ESM2-0`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_MRI-ESM2-0`,df$sp.nr,col = "grey",lwd = cexsize,  lty = 1)
#
df <- df[order(df$stable_climate_percent_ssp370), ];df$sp.nr = 1:nrow(df)
#lines((df$stable_climate_percent_ssp370),df$sp.nr,col = "#734ccf",lwd = cexsize,  lty = 1) 
df <- df[order(df$`stable_climate_percent_ssp370_GFDL-ESM4`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_GFDL-ESM4`,df$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp370_IPSL-CM6A-LR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_IPSL-CM6A-LR`,df$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp370_MPI-ESM1-2-HR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_MPI-ESM1-2-HR`,df$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp370_UKESM1-0-LL`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_UKESM1-0-LL`,df$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp370_MRI-ESM2-0`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_MRI-ESM2-0`,df$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = 1)
#
df <- df[order(df$stable_climate_percent_ssp585), ];df$sp.nr = 1:nrow(df)
#lines((df$stable_climate_percent_ssp585),df$sp.nr,col = "#ff7f00",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp585_GFDL-ESM4`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_GFDL-ESM4`,df$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = 1) 
df <- df[order(df$`stable_climate_percent_ssp585_IPSL-CM6A-LR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_IPSL-CM6A-LR`,df$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp585_MPI-ESM1-2-HR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_MPI-ESM1-2-HR`,df$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp585_UKESM1-0-LL`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_UKESM1-0-LL`,df$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp585_MRI-ESM2-0`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_MRI-ESM2-0`,df$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = 1)
#
# 370 Purple = #6a3d9a and #cab2d6
# 126 blacdk = black grey
# 585 red = #ff7f00 and #fdbf6f
#
DF <- DF[order(DF$stable_climate_percent_ssp126), ];DF$sp.nr = 1:nrow(DF)
#lines(DF$stable_climate_percent_ssp126,DF$sp.nr,col = "black",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_GFDL-ESM4`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_GFDL-ESM4`,DF$sp.nr,col = "grey",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_IPSL-CM6A-LR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_IPSL-CM6A-LR`,DF$sp.nr,col = "grey",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_MPI-ESM1-2-HR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_MPI-ESM1-2-HR`,DF$sp.nr,col = "grey",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_UKESM1-0-LL`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_UKESM1-0-LL`,DF$sp.nr,col = "grey",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_MRI-ESM2-0`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_MRI-ESM2-0`,DF$sp.nr,col = "grey",lwd = cexsize,  lty = x)
#
DF <- DF[order(DF$stable_climate_percent_ssp370), ];DF$sp.nr = 1:nrow(DF)
#lines((DF$stable_climate_percent_ssp370),DF$sp.nr,col = "#6a3d9a",lwd = cexsize,  lty = x) #
DF <- DF[order(DF$`stable_climate_percent_ssp370_GFDL-ESM4`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_GFDL-ESM4`,DF$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp370_IPSL-CM6A-LR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_IPSL-CM6A-LR`,DF$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp370_MPI-ESM1-2-HR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_MPI-ESM1-2-HR`,DF$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp370_UKESM1-0-LL`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_UKESM1-0-LL`,DF$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp370_MRI-ESM2-0`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_MRI-ESM2-0`,DF$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = x)
#
DF <- DF[order(DF$stable_climate_percent_ssp585), ];DF$sp.nr = 1:nrow(DF)
#lines((DF$stable_climate_percent_ssp585),DF$sp.nr,col = "#ff7f00",lwd = cexsize,  lty = x)# 
DF <- DF[order(DF$`stable_climate_percent_ssp585_GFDL-ESM4`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_GFDL-ESM4`,DF$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp585_IPSL-CM6A-LR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_IPSL-CM6A-LR`,DF$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp585_MPI-ESM1-2-HR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_MPI-ESM1-2-HR`,DF$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp585_UKESM1-0-LL`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_UKESM1-0-LL`,DF$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp585_MRI-ESM2-0`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_MRI-ESM2-0`,DF$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = x)
#
#
df <- df[order(df$stable_climate_percent_ssp126), ];df$sp.nr = 1:nrow(df)
lines(df$stable_climate_percent_ssp126,df$sp.nr,col = "black",lwd = cexsize+extracex,  lty = 1) #
df <- df[order(df$stable_climate_percent_ssp370), ];df$sp.nr = 1:nrow(df)
lines(df$stable_climate_percent_ssp370,df$sp.nr,col = "#734ccf",lwd = cexsize+extracex,  lty = 1) #
df <- df[order(df$stable_climate_percent_ssp585), ];df$sp.nr = 1:nrow(df)
lines(df$stable_climate_percent_ssp585,df$sp.nr,col = "#ff7f00",lwd = cexsize+extracex,  lty = 1) #
#
DF <- DF[order(DF$stable_climate_percent_ssp126), ];DF$sp.nr = 1:nrow(DF)
lines(DF$stable_climate_percent_ssp126,DF$sp.nr,col = "black",lwd = cexsize+extracex,  lty = x) #
DF <- DF[order(DF$stable_climate_percent_ssp370), ];DF$sp.nr = 1:nrow(DF)
lines(DF$stable_climate_percent_ssp370,DF$sp.nr,col = "#734ccf",lwd = cexsize+extracex,  lty = x) #
DF <- DF[order(DF$stable_climate_percent_ssp585), ];DF$sp.nr = 1:nrow(DF)
lines(DF$stable_climate_percent_ssp585,DF$sp.nr,col = "#ff7f00",lwd = cexsize+extracex,  lty = x) #
#
dev.off()


pdf(paste0(FigureDir,"CumRefuge.insert2.pdf"),height=6,width=8)
m = c(3.1, 3.1, 2.1, 2.1)
par(mfrow=c(1,1),mar=m, mgp=c(1.5,0.5,0))
cexsize = 1.3
extracex = 2
x = 2 #lty for non-analogue
#
df <- df[order(df$stable_climate_percent_ssp126), ];df$sp.nr = 1:nrow(df)
plot((df$stable_climate_percent_ssp126),df$sp.nr,col = "black",
     xlab = "Climate Change Refuge area relative to species extent (%)",
     ylab= "Cummulative number of species", lwd = cexsize,  lty = 1, type = "l",ylim=c(0,2000),xlim=c(0,20))
df <- df[order(df$`stable_climate_percent_ssp126_GFDL-ESM4`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_GFDL-ESM4`,df$sp.nr,col = "grey",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp126_IPSL-CM6A-LR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_IPSL-CM6A-LR`,df$sp.nr,col = "grey",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp126_MPI-ESM1-2-HR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_MPI-ESM1-2-HR`,df$sp.nr,col = "grey",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp126_UKESM1-0-LL`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_UKESM1-0-LL`,df$sp.nr,col = "grey",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp126_MRI-ESM2-0`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_MRI-ESM2-0`,df$sp.nr,col = "grey",lwd = cexsize,  lty = 1)
#
df <- df[order(df$stable_climate_percent_ssp370), ];df$sp.nr = 1:nrow(df)
#lines((df$stable_climate_percent_ssp370),df$sp.nr,col = "#734ccf",lwd = cexsize,  lty = 1) 
df <- df[order(df$`stable_climate_percent_ssp370_GFDL-ESM4`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_GFDL-ESM4`,df$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp370_IPSL-CM6A-LR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_IPSL-CM6A-LR`,df$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp370_MPI-ESM1-2-HR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_MPI-ESM1-2-HR`,df$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp370_UKESM1-0-LL`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_UKESM1-0-LL`,df$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp370_MRI-ESM2-0`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_MRI-ESM2-0`,df$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = 1)
#
df <- df[order(df$stable_climate_percent_ssp585), ];df$sp.nr = 1:nrow(df)
#lines((df$stable_climate_percent_ssp585),df$sp.nr,col = "#ff7f00",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp585_GFDL-ESM4`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_GFDL-ESM4`,df$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = 1) 
df <- df[order(df$`stable_climate_percent_ssp585_IPSL-CM6A-LR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_IPSL-CM6A-LR`,df$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp585_MPI-ESM1-2-HR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_MPI-ESM1-2-HR`,df$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp585_UKESM1-0-LL`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_UKESM1-0-LL`,df$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp585_MRI-ESM2-0`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_MRI-ESM2-0`,df$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = 1)
#
# 370 Purple = #6a3d9a and #cab2d6
# 126 blacdk = black grey
# 585 red = #ff7f00 and #fdbf6f
#
DF <- DF[order(DF$stable_climate_percent_ssp126), ];DF$sp.nr = 1:nrow(DF)
#lines(DF$stable_climate_percent_ssp126,DF$sp.nr,col = "black",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_GFDL-ESM4`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_GFDL-ESM4`,DF$sp.nr,col = "grey",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_IPSL-CM6A-LR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_IPSL-CM6A-LR`,DF$sp.nr,col = "grey",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_MPI-ESM1-2-HR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_MPI-ESM1-2-HR`,DF$sp.nr,col = "grey",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_UKESM1-0-LL`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_UKESM1-0-LL`,DF$sp.nr,col = "grey",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_MRI-ESM2-0`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_MRI-ESM2-0`,DF$sp.nr,col = "grey",lwd = cexsize,  lty = x)
#
DF <- DF[order(DF$stable_climate_percent_ssp370), ];DF$sp.nr = 1:nrow(DF)
#lines((DF$stable_climate_percent_ssp370),DF$sp.nr,col = "#6a3d9a",lwd = cexsize,  lty = x) #
DF <- DF[order(DF$`stable_climate_percent_ssp370_GFDL-ESM4`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_GFDL-ESM4`,DF$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp370_IPSL-CM6A-LR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_IPSL-CM6A-LR`,DF$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp370_MPI-ESM1-2-HR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_MPI-ESM1-2-HR`,DF$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp370_UKESM1-0-LL`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_UKESM1-0-LL`,DF$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp370_MRI-ESM2-0`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_MRI-ESM2-0`,DF$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = x)
#
DF <- DF[order(DF$stable_climate_percent_ssp585), ];DF$sp.nr = 1:nrow(DF)
#lines((DF$stable_climate_percent_ssp585),DF$sp.nr,col = "#ff7f00",lwd = cexsize,  lty = x)# 
DF <- DF[order(DF$`stable_climate_percent_ssp585_GFDL-ESM4`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_GFDL-ESM4`,DF$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp585_IPSL-CM6A-LR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_IPSL-CM6A-LR`,DF$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp585_MPI-ESM1-2-HR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_MPI-ESM1-2-HR`,DF$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp585_UKESM1-0-LL`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_UKESM1-0-LL`,DF$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp585_MRI-ESM2-0`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_MRI-ESM2-0`,DF$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = x)
#
#
df <- df[order(df$stable_climate_percent_ssp126), ];df$sp.nr = 1:nrow(df)
lines(df$stable_climate_percent_ssp126,df$sp.nr,col = "black",lwd = cexsize+extracex,  lty = 1) #
df <- df[order(df$stable_climate_percent_ssp370), ];df$sp.nr = 1:nrow(df)
lines(df$stable_climate_percent_ssp370,df$sp.nr,col = "#734ccf",lwd = cexsize+extracex,  lty = 1) #
df <- df[order(df$stable_climate_percent_ssp585), ];df$sp.nr = 1:nrow(df)
lines(df$stable_climate_percent_ssp585,df$sp.nr,col = "#ff7f00",lwd = cexsize+extracex,  lty = 1) #
#
DF <- DF[order(DF$stable_climate_percent_ssp126), ];DF$sp.nr = 1:nrow(DF)
lines(DF$stable_climate_percent_ssp126,DF$sp.nr,col = "black",lwd = cexsize+extracex,  lty = x) #
DF <- DF[order(DF$stable_climate_percent_ssp370), ];DF$sp.nr = 1:nrow(DF)
lines(DF$stable_climate_percent_ssp370,DF$sp.nr,col = "#734ccf",lwd = cexsize+extracex,  lty = x) #
DF <- DF[order(DF$stable_climate_percent_ssp585), ];DF$sp.nr = 1:nrow(DF)
lines(DF$stable_climate_percent_ssp585,DF$sp.nr,col = "#ff7f00",lwd = cexsize+extracex,  lty = x) #
#
dev.off()




pdf(paste0(FigureDir,"CumRefuge.insert3.pdf"),height=4,width=8)
m = c(3.1, 3.1, 2.1, 2.1)
par(mfrow=c(1,1),mar=m, mgp=c(1.5,0.5,0))
cexsize = 1.3
extracex = 2
x = 2 #lty for non-analogue
#
df <- df[order(df$stable_climate_percent_ssp126), ];df$sp.nr = 1:nrow(df)
plot((df$stable_climate_percent_ssp126),df$sp.nr,col = "black",
     xlab = "Climate Change Refuge area relative to species extent (%)",
     ylab= "Cummulative number of species", lwd = cexsize,  lty = 1, type = "l",ylim=c(0,2000),xlim=c(0,50))
df <- df[order(df$`stable_climate_percent_ssp126_GFDL-ESM4`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_GFDL-ESM4`,df$sp.nr,col = "grey",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp126_IPSL-CM6A-LR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_IPSL-CM6A-LR`,df$sp.nr,col = "grey",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp126_MPI-ESM1-2-HR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_MPI-ESM1-2-HR`,df$sp.nr,col = "grey",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp126_UKESM1-0-LL`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_UKESM1-0-LL`,df$sp.nr,col = "grey",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp126_MRI-ESM2-0`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_MRI-ESM2-0`,df$sp.nr,col = "grey",lwd = cexsize,  lty = 1)
#
df <- df[order(df$stable_climate_percent_ssp370), ];df$sp.nr = 1:nrow(df)
#lines((df$stable_climate_percent_ssp370),df$sp.nr,col = "#734ccf",lwd = cexsize,  lty = 1) 
df <- df[order(df$`stable_climate_percent_ssp370_GFDL-ESM4`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_GFDL-ESM4`,df$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp370_IPSL-CM6A-LR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_IPSL-CM6A-LR`,df$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp370_MPI-ESM1-2-HR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_MPI-ESM1-2-HR`,df$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp370_UKESM1-0-LL`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_UKESM1-0-LL`,df$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp370_MRI-ESM2-0`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_MRI-ESM2-0`,df$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = 1)
#
df <- df[order(df$stable_climate_percent_ssp585), ];df$sp.nr = 1:nrow(df)
#lines((df$stable_climate_percent_ssp585),df$sp.nr,col = "#ff7f00",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp585_GFDL-ESM4`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_GFDL-ESM4`,df$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = 1) 
df <- df[order(df$`stable_climate_percent_ssp585_IPSL-CM6A-LR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_IPSL-CM6A-LR`,df$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp585_MPI-ESM1-2-HR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_MPI-ESM1-2-HR`,df$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp585_UKESM1-0-LL`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_UKESM1-0-LL`,df$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp585_MRI-ESM2-0`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_MRI-ESM2-0`,df$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = 1)
#
# 370 Purple = #6a3d9a and #cab2d6
# 126 blacdk = black grey
# 585 red = #ff7f00 and #fdbf6f
#
DF <- DF[order(DF$stable_climate_percent_ssp126), ];DF$sp.nr = 1:nrow(DF)
#lines(DF$stable_climate_percent_ssp126,DF$sp.nr,col = "black",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_GFDL-ESM4`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_GFDL-ESM4`,DF$sp.nr,col = "grey",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_IPSL-CM6A-LR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_IPSL-CM6A-LR`,DF$sp.nr,col = "grey",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_MPI-ESM1-2-HR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_MPI-ESM1-2-HR`,DF$sp.nr,col = "grey",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_UKESM1-0-LL`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_UKESM1-0-LL`,DF$sp.nr,col = "grey",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_MRI-ESM2-0`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_MRI-ESM2-0`,DF$sp.nr,col = "grey",lwd = cexsize,  lty = x)
#
DF <- DF[order(DF$stable_climate_percent_ssp370), ];DF$sp.nr = 1:nrow(DF)
#lines((DF$stable_climate_percent_ssp370),DF$sp.nr,col = "#6a3d9a",lwd = cexsize,  lty = x) #
DF <- DF[order(DF$`stable_climate_percent_ssp370_GFDL-ESM4`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_GFDL-ESM4`,DF$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp370_IPSL-CM6A-LR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_IPSL-CM6A-LR`,DF$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp370_MPI-ESM1-2-HR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_MPI-ESM1-2-HR`,DF$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp370_UKESM1-0-LL`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_UKESM1-0-LL`,DF$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp370_MRI-ESM2-0`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_MRI-ESM2-0`,DF$sp.nr,col = "#ccaeeb",lwd = cexsize,  lty = x)
#
DF <- DF[order(DF$stable_climate_percent_ssp585), ];DF$sp.nr = 1:nrow(DF)
#lines((DF$stable_climate_percent_ssp585),DF$sp.nr,col = "#ff7f00",lwd = cexsize,  lty = x)# 
DF <- DF[order(DF$`stable_climate_percent_ssp585_GFDL-ESM4`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_GFDL-ESM4`,DF$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp585_IPSL-CM6A-LR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_IPSL-CM6A-LR`,DF$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp585_MPI-ESM1-2-HR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_MPI-ESM1-2-HR`,DF$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp585_UKESM1-0-LL`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_UKESM1-0-LL`,DF$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp585_MRI-ESM2-0`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_MRI-ESM2-0`,DF$sp.nr,col = "#fdbf6f",lwd = cexsize,  lty = x)
#
#
df <- df[order(df$stable_climate_percent_ssp126), ];df$sp.nr = 1:nrow(df)
lines(df$stable_climate_percent_ssp126,df$sp.nr,col = "black",lwd = cexsize+extracex,  lty = 1) #
# points(x=df[1000,"stable_climate_percent_ssp126"],y=1000,pch=19,cex=1,col="black")
df <- df[order(df$stable_climate_percent_ssp370), ];df$sp.nr = 1:nrow(df)
lines(df$stable_climate_percent_ssp370,df$sp.nr,col = "#734ccf",lwd = cexsize+extracex,  lty = 1) #
# points(x=df[1000,"stable_climate_percent_ssp370"],y=1000,pch=19,cex=1,col="#734ccf")
df <- df[order(df$stable_climate_percent_ssp585), ];df$sp.nr = 1:nrow(df)
lines(df$stable_climate_percent_ssp585,df$sp.nr,col = "#ff7f00",lwd = cexsize+extracex,  lty = 1) #
# points(x=df[1000,"stable_climate_percent_ssp585"],y=1000,pch=19,cex=1,col="#ff7f00")
#
DF <- DF[order(DF$stable_climate_percent_ssp126), ];DF$sp.nr = 1:nrow(DF)
lines(DF$stable_climate_percent_ssp126,DF$sp.nr,col = "black",lwd = cexsize+extracex,  lty = x) #
# points(x=DF[1000,"stable_climate_percent_ssp126"],y=1000,pch=19,cex=1,col="black")
DF <- DF[order(DF$stable_climate_percent_ssp370), ];DF$sp.nr = 1:nrow(DF)
lines(DF$stable_climate_percent_ssp370,DF$sp.nr,col = "#734ccf",lwd = cexsize+extracex,  lty = x) #
# points(x=DF[1000,"stable_climate_percent_ssp370"],y=1000,pch=19,cex=1,col="#734ccf")
DF <- DF[order(DF$stable_climate_percent_ssp585), ];DF$sp.nr = 1:nrow(DF)
lines(DF$stable_climate_percent_ssp585,DF$sp.nr,col = "#ff7f00",lwd = cexsize+extracex,  lty = x) #
# points(x=DF[1000,"stable_climate_percent_ssp585"],y=1000,pch=19,cex=1,col="#ff7f00")
#
dev.off()







#-------- values for refugia areas
save=data.frame(ClimateChangeScenario=c(colnames(df)[grep("stable_climate_percent",colnames(df))],
                                        paste0("NonAnalogue_",colnames(DF)[grep("stable_climate_percent",colnames(DF))])),
                NrSp0=NA,
                NrSp1=NA,
                NrSp5=NA,
                NrSp10=NA,
                NrSp50=NA,
                NrSp90=NA,
                NrSp95=NA,
                NrSp99=NA,
                NrSp100=NA)

for(i in 1:length(grep("stable_climate_percent",colnames(df)))){
  j=grep("stable_climate_percent",colnames(df))[i]
  save[i,2]=nrow(df[df[,j]==0,])
  save[i,3]=nrow(df[df[,j]<=1,])
  save[i,4]=nrow(df[df[,j]<=5,])
  save[i,5]=nrow(df[df[,j]<=10,])
  save[i,6]=nrow(df[df[,j]<=50,])
  save[i,7]=nrow(df[df[,j]>=90,])
  save[i,8]=nrow(df[df[,j]>=95,])
  save[i,9]=nrow(df[df[,j]>=99,])
  save[i,10]=nrow(df[df[,j]==100,])
  j=grep("stable_climate_percent",colnames(DF))[i]
  save[i+18,2]=nrow(DF[DF[,j]==0,])
  save[i+18,3]=nrow(DF[DF[,j]<=1,])
  save[i+18,4]=nrow(DF[DF[,j]<=5,])
  save[i+18,5]=nrow(DF[DF[,j]<=10,])
  save[i+18,6]=nrow(DF[DF[,j]<=50,])
  save[i+18,7]=nrow(DF[DF[,j]>=90,])
  save[i+18,8]=nrow(DF[DF[,j]>=95,])
  save[i+18,9]=nrow(DF[DF[,j]>=99,])
  save[i+18,10]=nrow(DF[DF[,j]==100,])
}
write.table(save,"ClimateRefugia.paper/Figures/Table_refugia.csv",row.names = F,sep=",")
#






#-------- bars distribution refugia ~ relative number of species (not cummulative)
#names(df) = paste0(names(df),".new")
#names(DF) = paste0(names(DF),".new")
models = c("_IPSL-CM6A-LR.new","_GFDL-ESM4.new","_UKESM1-0-LL.new","_MRI-ESM2-0.new","_MRI-ESM2-0.new")
i="stable_climate_percent_"
scenario = c("ssp126","ssp370","ssp585")
col=data.frame(c("black","grey"),c("#6a3d9a","#cab2d6"),c("#ff7f00","#fdbf6f"))
colnames(col)=scenario
total.nr.species=nrow(df)
table.data = matrix(nrow=3,ncol=5,dimnames=list(NULL,c("0-20","20-40","40-60","60-80","80-100")))
mod.table1 = matrix(nrow=3,ncol=5,dimnames=list(NULL,c("0-20","20-40","40-60","60-80","80-100")))
mod.table2 = matrix(nrow=3,ncol=5,dimnames=list(NULL,c("0-20","20-40","40-60","60-80","80-100")))
mod.table3 = matrix(nrow=3,ncol=5,dimnames=list(NULL,c("0-20","20-40","40-60","60-80","80-100")))
mod.table4 = matrix(nrow=3,ncol=5,dimnames=list(NULL,c("0-20","20-40","40-60","60-80","80-100")))
mod.table5 = matrix(nrow=3,ncol=5,dimnames=list(NULL,c("0-20","20-40","40-60","60-80","80-100")))
for(ii in 1:3){
  scen = scenario[ii]
  print(ii)
  h=paste0(i,scen,".new")
  h = grep(h,names(df))
  df$refugia.percent.grouped = cut(df[,h],c(-0.01,20,40,60,80,101))
  levels(df$refugia.percent.grouped) = c("0-20","20-40","40-60","60-80","80-100")
  table.data[ii,]=as.matrix(t(table(df$refugia.percent.grouped)))*100/total.nr.species
  
  k=grep(i,names(df))[which(grep(i,names(df)) %in% grep(scen,names(df))[which(grep(scen,names(df)) %in% grep(models[1],names(df)))])]
  a = cut(df[,k],c(-0.01,20,40,60,80,101));levels(a) = c("0-20","20-40","40-60","60-80","80-100")
  mod.table1[ii,]=as.matrix(t(table(a)))*100/total.nr.species
  
  k=grep(i,names(df))[which(grep(i,names(df)) %in% grep(scen,names(df))[which(grep(scen,names(df)) %in% grep(models[2],names(df)))])]
  a = cut(df[,k],c(-0.01,20,40,60,80,101));levels(a) = c("0-20","20-40","40-60","60-80","80-100")
  mod.table2[ii,]=as.matrix(t(table(a)))*100/total.nr.species
  
  k=grep(i,names(df))[which(grep(i,names(df)) %in% grep(scen,names(df))[which(grep(scen,names(df)) %in% grep(models[3],names(df)))])]
  a = cut(df[,k],c(-0.01,20,40,60,80,101));levels(a) = c("0-20","20-40","40-60","60-80","80-100")
  mod.table3[ii,]=as.matrix(t(table(a)))*100/total.nr.species
  
  k=grep(i,names(df))[which(grep(i,names(df)) %in% grep(scen,names(df))[which(grep(scen,names(df)) %in% grep(models[4],names(df)))])]
  a = cut(df[,k],c(-0.01,20,40,60,80,101));levels(a) = c("0-20","20-40","40-60","60-80","80-100")
  mod.table4[ii,]=as.matrix(t(table(a)))*100/total.nr.species
  
  k=grep(i,names(df))[which(grep(i,names(df)) %in% grep(scen,names(df))[which(grep(scen,names(df)) %in% grep(models[5],names(df)))])]
  a = cut(df[,k],c(-0.01,20,40,60,80,101));levels(a) = c("0-20","20-40","40-60","60-80","80-100")
  mod.table5[ii,]=as.matrix(t(table(a)))*100/total.nr.species
}
pdf(paste0(FigureDir,"Bars.Analogue.pdf"),height=6,width=8)
m = c(3.1, 3.1, 2.1, 2.1)
par(mfrow=c(1,1),mar=m, mgp=c(1.5,0.5,0))
bp = barplot(height = table.data,beside = TRUE,
             ylim=c(0,100),col=c(as.character(col[1,1]),as.character(col[1,2]),as.character(col[1,3])),
             xlab="Stable climate in range (%)",ylab="Tree species (%)")
box(lty=1,col="black")
points(x = bp, y = mod.table1,pch=6,col=c(as.character(col[2,1]),as.character(col[2,2]),as.character(col[2,3])),cex=2,lwd=4)
points(x = bp, y = mod.table2,pch=6,col=c(as.character(col[2,1]),as.character(col[2,2]),as.character(col[2,3])),cex=2,lwd=4)
points(x = bp, y = mod.table3,pch=6,col=c(as.character(col[2,1]),as.character(col[2,2]),as.character(col[2,3])),cex=2,lwd=4)
points(x = bp, y = mod.table4,pch=6,col=c(as.character(col[2,1]),as.character(col[2,2]),as.character(col[2,3])),cex=2,lwd=4)
points(x = bp, y = mod.table5,pch=6,col=c(as.character(col[2,1]),as.character(col[2,2]),as.character(col[2,3])),cex=2,lwd=4)
# #
# lines(x = bp[1,], y = mod.table1[1,],lty=1,col=c(as.character(col[2,1])),cex=2,lwd=1)
# lines(x = bp[2,], y = mod.table1[2,],lty=1,col=c(as.character(col[2,2])),cex=2,lwd=1)
# lines(x = bp[3,], y = mod.table1[3,],lty=1,col=c(as.character(col[2,3])),cex=2,lwd=1)
# #
# lines(x = bp[1,], y = mod.table2[1,],lty=1,col=c(as.character(col[2,1])),cex=2,lwd=1)
# lines(x = bp[2,], y = mod.table2[2,],lty=1,col=c(as.character(col[2,2])),cex=2,lwd=1)
# lines(x = bp[3,], y = mod.table2[3,],lty=1,col=c(as.character(col[2,3])),cex=2,lwd=1)
# #
# lines(x = bp[1,], y = mod.table3[1,],lty=1,col=c(as.character(col[2,1])),cex=2,lwd=1)
# lines(x = bp[2,], y = mod.table3[2,],lty=1,col=c(as.character(col[2,2])),cex=2,lwd=1)
# lines(x = bp[3,], y = mod.table3[3,],lty=1,col=c(as.character(col[2,3])),cex=2,lwd=1)
# #
# lines(x = bp[1,], y = mod.table4[1,],lty=1,col=c(as.character(col[2,1])),cex=2,lwd=1)
# lines(x = bp[2,], y = mod.table4[2,],lty=1,col=c(as.character(col[2,2])),cex=2,lwd=1)
# lines(x = bp[3,], y = mod.table4[3,],lty=1,col=c(as.character(col[2,3])),cex=2,lwd=1)
# #
# lines(x = bp[1,], y = mod.table5[1,],lty=1,col=c(as.character(col[2,1])),cex=2,lwd=1)
# lines(x = bp[2,], y = mod.table5[2,],lty=1,col=c(as.character(col[2,2])),cex=2,lwd=1)
# lines(x = bp[3,], y = mod.table5[3,],lty=1,col=c(as.character(col[2,3])),cex=2,lwd=1)
dev.off()
#
# now for Non-Analogue situation

table.data = matrix(nrow=3,ncol=5,dimnames=list(NULL,c("0-20","20-40","40-60","60-80","80-100")))
mod.table1 = matrix(nrow=3,ncol=5,dimnames=list(NULL,c("0-20","20-40","40-60","60-80","80-100")))
mod.table2 = matrix(nrow=3,ncol=5,dimnames=list(NULL,c("0-20","20-40","40-60","60-80","80-100")))
mod.table3 = matrix(nrow=3,ncol=5,dimnames=list(NULL,c("0-20","20-40","40-60","60-80","80-100")))
mod.table4 = matrix(nrow=3,ncol=5,dimnames=list(NULL,c("0-20","20-40","40-60","60-80","80-100")))
mod.table5 = matrix(nrow=3,ncol=5,dimnames=list(NULL,c("0-20","20-40","40-60","60-80","80-100")))
for(ii in 1:3){
  scen = scenario[ii]
  print(ii)
  h=paste0(i,scen,".new")
  h = grep(h,names(DF))
  DF$refugia.percent.grouped = cut(DF[,h],c(-0.01,20,40,60,80,101))
  levels(DF$refugia.percent.grouped) = c("0-20","20-40","40-60","60-80","80-100")
  table.data[ii,]=as.matrix(t(table(DF$refugia.percent.grouped)))*100/total.nr.species
  
  k=grep(i,names(DF))[which(grep(i,names(DF)) %in% grep(scen,names(DF))[which(grep(scen,names(DF)) %in% grep(models[1],names(DF)))])]
  a = cut(DF[,k],c(-0.01,20,40,60,80,101));levels(a) = c("0-20","20-40","40-60","60-80","80-100")
  mod.table1[ii,]=as.matrix(t(table(a)))*100/total.nr.species
  
  k=grep(i,names(DF))[which(grep(i,names(DF)) %in% grep(scen,names(DF))[which(grep(scen,names(DF)) %in% grep(models[2],names(DF)))])]
  a = cut(DF[,k],c(-0.01,20,40,60,80,101));levels(a) = c("0-20","20-40","40-60","60-80","80-100")
  mod.table2[ii,]=as.matrix(t(table(a)))*100/total.nr.species
  
  k=grep(i,names(DF))[which(grep(i,names(DF)) %in% grep(scen,names(DF))[which(grep(scen,names(DF)) %in% grep(models[3],names(DF)))])]
  a = cut(DF[,k],c(-0.01,20,40,60,80,101));levels(a) = c("0-20","20-40","40-60","60-80","80-100")
  mod.table3[ii,]=as.matrix(t(table(a)))*100/total.nr.species
  
  k=grep(i,names(DF))[which(grep(i,names(DF)) %in% grep(scen,names(DF))[which(grep(scen,names(DF)) %in% grep(models[4],names(DF)))])]
  a = cut(DF[,k],c(-0.01,20,40,60,80,101));levels(a) = c("0-20","20-40","40-60","60-80","80-100")
  mod.table4[ii,]=as.matrix(t(table(a)))*100/total.nr.species
  
  k=grep(i,names(DF))[which(grep(i,names(DF)) %in% grep(scen,names(DF))[which(grep(scen,names(DF)) %in% grep(models[5],names(DF)))])]
  a = cut(DF[,k],c(-0.01,20,40,60,80,101));levels(a) = c("0-20","20-40","40-60","60-80","80-100")
  mod.table5[ii,]=as.matrix(t(table(a)))*100/total.nr.species
}
pdf(paste0(FigureDir,"Bars.NonAnalogue.pdf"),height=6,width=8)
m = c(3.1, 3.1, 2.1, 2.1)
par(mfrow=c(1,1),mar=m, mgp=c(1.5,0.5,0))
bp = barplot(height = table.data,beside = TRUE,
             ylim=c(0,100),col=c(as.character(col[1,1]),as.character(col[1,2]),as.character(col[1,3])),
             xlab="Stable climate in range (%)",ylab="Tree species (%)")
box(lty=1,col="black")
points(x = bp, y = mod.table1,pch=6,col=c(as.character(col[2,1]),as.character(col[2,2]),as.character(col[2,3])),cex=2,lwd=4)
points(x = bp, y = mod.table2,pch=6,col=c(as.character(col[2,1]),as.character(col[2,2]),as.character(col[2,3])),cex=2,lwd=4)
points(x = bp, y = mod.table3,pch=6,col=c(as.character(col[2,1]),as.character(col[2,2]),as.character(col[2,3])),cex=2,lwd=4)
points(x = bp, y = mod.table4,pch=6,col=c(as.character(col[2,1]),as.character(col[2,2]),as.character(col[2,3])),cex=2,lwd=4)
points(x = bp, y = mod.table5,pch=6,col=c(as.character(col[2,1]),as.character(col[2,2]),as.character(col[2,3])),cex=2,lwd=4)
dev.off()
#

















pdf(paste0(FigureDir,"Bars.together.pdf"),height=4,width=10)
m = c(3.1, 3.1, 2.1, 2.1)
par(mfrow=c(2,3),mar=m, mgp=c(1.5,0.5,0))

for(ii in scenario){
  print(ii)
  h=paste0(i,ii,".new")
  h = grep(h,names(df))
  df$refugia.percent.grouped = cut(df[,h],c(-0.01,10,20,30,40,50,60,70,80,90,101))
  levels(df$refugia.percent.grouped) = c("0-10","10-20","20-30","30-40","40-50","50-60","60-70","70-80","80-90","90-100")
  table.data=as.data.frame(table(df$refugia.percent.grouped))
  Sys.sleep(2)
  save.x.locations=barplot(col=col[ii][1,],height=log10(table.data$Freq), names=table.data$Var1,ylim=c(0,5),xlab="Stable climate in range (%)",ylab="Number of tree species")
  box(lty=1,col="black")
  for(iii in models){
    print(iii)
    k=grep(i,names(df))[which(grep(i,names(df)) %in% grep(ii,names(df))[which(grep(ii,names(df)) %in% grep(iii,names(df)))])]
    a = cut(df[,k],c(-0.01,10,20,30,40,50,60,70,80,90,101))
    levels(a) =  c("0-10","10-20","20-30","30-40","40-50","50-60","60-70","70-80","80-90","90-100")
    a=as.data.frame(table(a))
    Sys.sleep(1)
    points(y=log10(a$Freq),x=save.x.locations,pch=6,col=col[ii][2,],cex=1,lwd=2)
  }
}
# now for Non-Analogue situation
for(ii in scenario){
  print(ii)
  h=paste0(i,ii,".new")
  h = grep(h,names(DF))
  DF$refugia.percent.grouped = cut(DF[,h],c(-0.01,10,20,30,40,50,60,70,80,90,101))
  levels(DF$refugia.percent.grouped) = c("0-10","10-20","20-30","30-40","40-50","50-60","60-70","70-80","80-90","90-100")
  table.data=as.data.frame(table(DF$refugia.percent.grouped))
  Sys.sleep(2)
  save.x.locations=barplot(col=col[ii][1,],height=log10(table.data$Freq), names=table.data$Var1,ylim=c(0,5),xlab="Stable climate in range (%)",ylab="Number of tree species")
  box(lty=1,col="black")
  for(iii in models){
    print(iii)
    k=grep(i,names(DF))[which(grep(i,names(DF)) %in% grep(ii,names(DF))[which(grep(ii,names(DF)) %in% grep(iii,names(DF)))])]
    a = cut(DF[,k],c(-0.01,10,20,30,40,50,60,70,80,90,101))
    levels(a) =  c("0-10","10-20","20-30","30-40","40-50","50-60","60-70","70-80","80-90","90-100")
    a=as.data.frame(table(a))
    Sys.sleep(1)
    points(y=log10(a$Freq),x=save.x.locations,pch=6,col=col[ii][2,],cex=1,lwd=2)
  }
}
dev.off()



pdf(paste0(FigureDir,"Bars.together2.pdf"),height=4,width=10)
m = c(3.1, 3.1, 2.1, 2.1)
par(mfrow=c(2,3),mar=m, mgp=c(1.5,0.5,0))

for(ii in scenario){
  print(ii)
  h=paste0(i,ii,".new")
  h = grep(h,names(df))
  df$refugia.percent.grouped = cut(df[,h],c(-0.01,10,20,30,40,50,60,70,80,90,101))
  levels(df$refugia.percent.grouped) = c("0-10","10-20","20-30","30-40","40-50","50-60","60-70","70-80","80-90","90-100")
  table.data=as.data.frame(table(df$refugia.percent.grouped))
  Sys.sleep(2)
  save.x.locations=barplot(col=col[ii][1,],height=(table.data$Freq), names=table.data$Var1,ylim=c(0,5000),xlab="Stable climate in range (%)",ylab="Number of tree species")
  box(lty=1,col="black")
  for(iii in models){
    print(iii)
    k=grep(i,names(df))[which(grep(i,names(df)) %in% grep(ii,names(df))[which(grep(ii,names(df)) %in% grep(iii,names(df)))])]
    a = cut(df[,k],c(-0.01,10,20,30,40,50,60,70,80,90,101))
    levels(a) =  c("0-10","10-20","20-30","30-40","40-50","50-60","60-70","70-80","80-90","90-100")
    a=as.data.frame(table(a))
    Sys.sleep(1)
    points(y=(a$Freq),x=save.x.locations,pch=6,col=col[ii][2,],cex=1,lwd=2)
  }
}
# now for Non-Analogue situation
for(ii in scenario){
  print(ii)
  h=paste0(i,ii,".new")
  h = grep(h,names(DF))
  DF$refugia.percent.grouped = cut(DF[,h],c(-0.01,10,20,30,40,50,60,70,80,90,101))
  levels(DF$refugia.percent.grouped) = c("0-10","10-20","20-30","30-40","40-50","50-60","60-70","70-80","80-90","90-100")
  table.data=as.data.frame(table(DF$refugia.percent.grouped))
  Sys.sleep(2)
  save.x.locations=barplot(col=col[ii][1,],height=(table.data$Freq), names=table.data$Var1,ylim=c(0,5000),xlab="Stable climate in range (%)",ylab="Number of tree species")
  box(lty=1,col="black")
  for(iii in models){
    print(iii)
    k=grep(i,names(DF))[which(grep(i,names(DF)) %in% grep(ii,names(DF))[which(grep(ii,names(DF)) %in% grep(iii,names(DF)))])]
    a = cut(DF[,k],c(-0.01,10,20,30,40,50,60,70,80,90,101))
    levels(a) =  c("0-10","10-20","20-30","30-40","40-50","50-60","60-70","70-80","80-90","90-100")
    a=as.data.frame(table(a))
    Sys.sleep(1)
    points(y=(a$Freq),x=save.x.locations,pch=6,col=col[ii][2,],cex=1,lwd=2)
  }
}
dev.off()






pdf(paste0(FigureDir,"CumRefugelog10.pdf"),height=6,width=8)
m = c(3.1, 3.1, 2.1, 2.1)
par(mfrow=c(1,1),mar=m, mgp=c(1.5,0.5,0))

cexsize = 1.3
extracex = 1
x = 2 #lty for non-analogue



df <- df[order(df$stable_climate_percent_ssp126), ];df$sp.nr = 1:nrow(df)
plot((df$stable_climate_percent_ssp126),log10(df$sp.nr),col = "black",
     xlab = "Climate Change Refuge area relative to species extent (%)",
     ylab= "Cummulative number of species", lwd = cexsize,  lty = 1, type = "l")
df <- df[order(df$`stable_climate_percent_ssp126_GFDL-ESM4`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_GFDL-ESM4`,log10(df$sp.nr),col = "grey",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp126_IPSL-CM6A-LR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_IPSL-CM6A-LR`,log10(df$sp.nr),col = "grey",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp126_MPI-ESM1-2-HR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_MPI-ESM1-2-HR`,log10(df$sp.nr),col = "grey",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp126_UKESM1-0-LL`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_UKESM1-0-LL`,log10(df$sp.nr),col = "grey",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp126_MRI-ESM2-0`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp126_MRI-ESM2-0`,log10(df$sp.nr),col = "grey",lwd = cexsize,  lty = 1)
#
df <- df[order(df$stable_climate_percent_ssp370), ];df$sp.nr = 1:nrow(df)
lines((df$stable_climate_percent_ssp370),log10(df$sp.nr),col = "#6a3d9a",lwd = cexsize,  lty = 1) 
df <- df[order(df$`stable_climate_percent_ssp370_GFDL-ESM4`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_GFDL-ESM4`,log10(df$sp.nr),col = "#cab2d6",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp370_IPSL-CM6A-LR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_IPSL-CM6A-LR`,log10(df$sp.nr),col = "#cab2d6",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp370_MPI-ESM1-2-HR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_MPI-ESM1-2-HR`,log10(df$sp.nr),col = "#cab2d6",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp370_UKESM1-0-LL`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_UKESM1-0-LL`,log10(df$sp.nr),col = "#cab2d6",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp370_MRI-ESM2-0`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp370_MRI-ESM2-0`,log10(df$sp.nr),col = "#cab2d6",lwd = cexsize,  lty = 1)
#
df <- df[order(df$stable_climate_percent_ssp585), ];df$sp.nr = 1:nrow(df)
lines((df$stable_climate_percent_ssp585),log10(df$sp.nr),col = "#ff7f00",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp585_GFDL-ESM4`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_GFDL-ESM4`,log10(df$sp.nr),col = "#fdbf6f",lwd = cexsize,  lty = 1) 
df <- df[order(df$`stable_climate_percent_ssp585_IPSL-CM6A-LR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_IPSL-CM6A-LR`,log10(df$sp.nr),col = "#fdbf6f",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp585_MPI-ESM1-2-HR`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_MPI-ESM1-2-HR`,log10(df$sp.nr),col = "#fdbf6f",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp585_UKESM1-0-LL`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_UKESM1-0-LL`,log10(df$sp.nr),col = "#fdbf6f",lwd = cexsize,  lty = 1)
df <- df[order(df$`stable_climate_percent_ssp585_MRI-ESM2-0`), ];df$sp.nr = 1:nrow(df)
lines(df$`stable_climate_percent_ssp585_MRI-ESM2-0`,log10(df$sp.nr),col = "#fdbf6f",lwd = cexsize,  lty = 1)
#

# 370 Purple = #6a3d9a and #cab2d6
# 126 blacdk = black grey
# 585 red = #ff7f00 and #fdbf6f
#
DF <- DF[order(DF$stable_climate_percent_ssp126), ];DF$sp.nr = 1:nrow(DF)
lines(DF$stable_climate_percent_ssp126,log10(DF$sp.nr),col = "black",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_GFDL-ESM4`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_GFDL-ESM4`,log10(DF$sp.nr),col = "grey",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_IPSL-CM6A-LR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_IPSL-CM6A-LR`,log10(DF$sp.nr),col = "grey",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_MPI-ESM1-2-HR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_MPI-ESM1-2-HR`,log10(DF$sp.nr),col = "grey",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_UKESM1-0-LL`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_UKESM1-0-LL`,log10(DF$sp.nr),col = "grey",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp126_MRI-ESM2-0`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp126_MRI-ESM2-0`,log10(DF$sp.nr),col = "grey",lwd = cexsize,  lty = x)
#
DF <- DF[order(DF$stable_climate_percent_ssp370), ];DF$sp.nr = 1:nrow(DF)
lines((DF$stable_climate_percent_ssp370),log10(DF$sp.nr),col = "#6a3d9a",lwd = cexsize,  lty = x) #
DF <- DF[order(DF$`stable_climate_percent_ssp370_GFDL-ESM4`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_GFDL-ESM4`,log10(DF$sp.nr),col = "#cab2d6",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp370_IPSL-CM6A-LR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_IPSL-CM6A-LR`,log10(DF$sp.nr),col = "#cab2d6",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp370_MPI-ESM1-2-HR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_MPI-ESM1-2-HR`,log10(DF$sp.nr),col = "#cab2d6",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp370_UKESM1-0-LL`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_UKESM1-0-LL`,log10(DF$sp.nr),col = "#cab2d6",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp370_MRI-ESM2-0`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp370_MRI-ESM2-0`,log10(DF$sp.nr),col = "#cab2d6",lwd = cexsize,  lty = x)
#
DF <- DF[order(DF$stable_climate_percent_ssp585), ];DF$sp.nr = 1:nrow(DF)
lines((DF$stable_climate_percent_ssp585),log10(DF$sp.nr),col = "#ff7f00",lwd = cexsize,  lty = x)# 
DF <- DF[order(DF$`stable_climate_percent_ssp585_GFDL-ESM4`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_GFDL-ESM4`,log10(DF$sp.nr),col = "#fdbf6f",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp585_IPSL-CM6A-LR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_IPSL-CM6A-LR`,log10(DF$sp.nr),col = "#fdbf6f",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp585_MPI-ESM1-2-HR`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_MPI-ESM1-2-HR`,log10(DF$sp.nr),col = "#fdbf6f",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp585_UKESM1-0-LL`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_UKESM1-0-LL`,log10(DF$sp.nr),col = "#fdbf6f",lwd = cexsize,  lty = x)
DF <- DF[order(DF$`stable_climate_percent_ssp585_MRI-ESM2-0`), ];DF$sp.nr = 1:nrow(DF)
lines(DF$`stable_climate_percent_ssp585_MRI-ESM2-0`,log10(DF$sp.nr),col = "#fdbf6f",lwd = cexsize,  lty = x)
#
#
df <- df[order(df$stable_climate_percent_ssp126), ];df$sp.nr = 1:nrow(df)
lines(df$stable_climate_percent_ssp126,log10(df$sp.nr),col = "black",lwd = cexsize+extracex,  lty = 1) #
df <- df[order(df$stable_climate_percent_ssp370), ];df$sp.nr = 1:nrow(df)
lines(df$stable_climate_percent_ssp370,log10(df$sp.nr),col = "#6a3d9a",lwd = cexsize+extracex,  lty = 1) #
df <- df[order(df$stable_climate_percent_ssp585), ];df$sp.nr = 1:nrow(df)
lines(df$stable_climate_percent_ssp585,log10(df$sp.nr),col = "#ff7f00",lwd = cexsize+extracex,  lty = 1) #
#
DF <- DF[order(DF$stable_climate_percent_ssp126), ];DF$sp.nr = 1:nrow(DF)
lines(DF$stable_climate_percent_ssp126,log10(DF$sp.nr),col = "black",lwd = cexsize+extracex,  lty = x) #
DF <- DF[order(DF$stable_climate_percent_ssp370), ];DF$sp.nr = 1:nrow(DF)
lines(DF$stable_climate_percent_ssp370,log10(DF$sp.nr),col = "#6a3d9a",lwd = cexsize+extracex,  lty = x) #
DF <- DF[order(DF$stable_climate_percent_ssp585), ];DF$sp.nr = 1:nrow(DF)
lines(DF$stable_climate_percent_ssp585,log10(DF$sp.nr),col = "#ff7f00",lwd = cexsize+extracex,  lty = x) #
#
legend(x=0, y=30000, legend=c("ssp126", "ssp370","ssp585","ssp126 - NaH", "ssp370 - NaH","ssp585 - NaH"), 
       col = rep(c("black","#6a3d9a","#ff7f00"),2),lty=c(1,1,1,x,x,x),ncol=2,lwd=2
)

dev.off()