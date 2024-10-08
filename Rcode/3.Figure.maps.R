rm(list = ls())

#-------- directories and data
setwd("M:/Aarhus University 2022-2023/Odrive_ColineBoonman_au710911/")
InputDir  = "ClimateRefugia.paper/Output/FilesReceivedSelwyn/ShareRasters_2024_12_06/"
InputDir2  = "ClimateRefugia.paper/Output/FilesReceivedSelwyn/ShareRasters_2024_12_06/SpeciesClimateLossMeanSE/"
OutputDir = "ClimateRefugia.paper/Output/"
FigureDir = "ClimateRefugia.paper/Figures/"

crop_maps = function(x) terra::crop(x, terra::ext(c(-180.0001, 179.9999, -60, 83.99986)), snap="near")
crop_maps_diff = function(x) terra::crop(x, terra::ext(c(-110, 154, -35, 35)), snap="near")


#######!!! change black to #373837 for all maps

#-------- Global maps
library(terra)
library(geodata)
countries <- world(resolution = 5, path = "maps")  # you may choose a smaller (more detailed) resolution for the polygon borders, and a different folder path to save the imported map
countries <- merge(countries, country_codes(), by.x = "GID_0", by.y = "ISO3", all.x = TRUE)
cont <- aggregate(countries, by = "continent")
cont<-cont[!cont$continent=="Antarctica",]## Bind the 6 continent-level SPDFs into a single SPDF

# Open original maps
spp126_spLossMapRelative= terra::rast(paste0(InputDir,"spp126_spLossMapRelative_mean_masked.tif"))
spp370_spLossMapRelative= terra::rast(paste0(InputDir,"spp370_spLossMapRelative_mean_masked.tif"))
spp585_spLossMapRelative= terra::rast(paste0(InputDir,"spp585_spLossMapRelative_mean_masked.tif"))
spp126_NonAna_spLossMapRelative= terra::rast(paste0(InputDir,"spp126_NonAna_spLossMapRelative_mean_masked.tif"))
spp370_NonAna_spLossMapRelative= terra::rast(paste0(InputDir,"spp370_NonAna_spLossMapRelative_mean_masked.tif"))
spp585_NonAna_spLossMapRelative= terra::rast(paste0(InputDir,"spp585_NonAna_spLossMapRelative_mean_masked.tif"))
sp.richness = terra::rast(paste0(InputDir,"spRichMap_masked.tif"))
SE_spp126_spLossMapRelative= terra::rast(paste0(InputDir2,"ssp126_2071-2100_relativeSE.tif"))
SE_spp370_spLossMapRelative= terra::rast(paste0(InputDir2,"ssp370_2071-2100_relativeSE.tif"))
SE_spp585_spLossMapRelative= terra::rast(paste0(InputDir2,"ssp585_2071-2100_relativeSE.tif"))
SE_spp126_NonAna_spLossMapRelative= terra::rast(paste0(InputDir2,"sspssp126_2071-2100_nonAnalog_relativeSE.tif"))
SE_spp370_NonAna_spLossMapRelative= terra::rast(paste0(InputDir2,"sspssp370_2071-2100_nonAnalog_relativeSE.tif"))
SE_spp585_NonAna_spLossMapRelative= terra::rast(paste0(InputDir2,"sspssp585_2071-2100_nonAnalog_relativeSE.tif"))

# Open processed maps
sp.r = terra::rast(paste0(OutputDir,"ProcessedMaps/SpeciesRichness_withNAinsteadof0.tif"))

spp126_spLossMapRelative_Original = terra::rast(paste0(OutputDir,"ProcessedMaps/spp126_spLossMapRelative_Original.tif"))
#spp126_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/spp126_spLossMapRelative.tif"))
#NaH_diff_ssp126 = terra::rast(paste0(OutputDir,"ProcessedMaps/NaH_ssp126_spLossRelative_difference.tif"))
#NaH_diff_ssp126 = terra::ifel(NaH_diff_ssp126==0,NA,NaH_diff_ssp126)
ssp126_abs = terra::rast(paste0(OutputDir,"ProcessedMaps/ssp126_absoluteSpLoss.tif"))
SE_spp126_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp126_NonAna_spLossMapRelative.tif"))
SE_spp126_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp126_spLossMapRelative.tif"))
SE_diff_spp126_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp126_diff_NonAna_spLossMapRelative.tif"))
CI_spp126_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp126_spLossMapRelative.tif"))
CI_spp126_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp126_NonAna_spLossMapRelative.tif"))
CI_diff_spp126_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp126_diff_NonAna_spLossMapRelative.tif"))
spp126_NonAna_spLossMapRelative_Original = terra::rast(paste0(OutputDir,"ProcessedMaps/spp126_NonAna_spLossMapRelative_Original.tif"))
#spp126_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/spp126_NonAna_spLossMapRelative.tif"))
spp126_NonAna_spLossMapAbsolute = terra::rast(paste0(OutputDir,"ProcessedMaps/spp126_NonAna_spLossMapAbsolute.tif"))
spp126_spMapRelative_refuge = terra::rast(paste0(OutputDir,"ProcessedMaps/spp126_spMapRelative_refuge.tif"))

spp370_spLossMapRelative_Original = terra::rast(paste0(OutputDir,"ProcessedMaps/spp370_spLossMapRelative_Original.tif"))
#spp370_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/spp370_spLossMapRelative.tif"))
#NaH_diff_ssp370 = terra::rast(paste0(OutputDir,"ProcessedMaps/NaH_ssp370_spLossRelative_difference.tif"))
ssp370_abs = terra::rast(paste0(OutputDir,"ProcessedMaps/ssp370_absoluteSpLoss.tif"))
SE_spp370_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp370_NonAna_spLossMapRelative.tif"))
SE_spp370_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp370_spLossMapRelative.tif"))
SE_diff_spp370_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp370_diff_NonAna_spLossMapRelative.tif"))
CI_spp370_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp370_spLossMapRelative.tif"))
CI_spp370_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp370_NonAna_spLossMapRelative.tif"))
CI_diff_spp370_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp370_diff_NonAna_spLossMapRelative.tif"))
spp370_NonAna_spLossMapRelative_Original = terra::rast(paste0(OutputDir,"ProcessedMaps/spp370_NonAna_spLossMapRelative_Original.tif"))
#spp370_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/spp370_NonAna_spLossMapRelative.tif"))
spp370_NonAna_spLossMapAbsolute = terra::rast(paste0(OutputDir,"ProcessedMaps/spp370_NonAna_spLossMapAbsolute.tif"))
spp370_spMapRelative_refuge = terra::rast(paste0(OutputDir,"ProcessedMaps/spp370_spMapRelative_refuge.tif"))
NaH_spp370_spMapRelative_refuge = terra::rast(paste0(OutputDir,"ProcessedMaps/NaH_spp370_spMapRelative_refuge.tif"))

spp585_spLossMapRelative_Original = terra::rast(paste0(OutputDir,"ProcessedMaps/spp585_spLossMapRelative_Original.tif"))
#spp585_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/spp585_spLossMapRelative.tif"))
#NaH_diff_ssp585 = terra::rast(paste0(OutputDir,"ProcessedMaps/NaH_ssp585_spLossRelative_difference.tif"))
ssp585_abs = terra::rast(paste0(OutputDir,"ProcessedMaps/ssp585_absoluteSpLoss.tif"))
SE_spp585_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp585_NonAna_spLossMapRelative.tif"))
SE_spp585_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp585_spLossMapRelative.tif"))
SE_diff_spp585_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp585_diff_NonAna_spLossMapRelative.tif"))
CI_spp585_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp585_spLossMapRelative.tif"))
CI_spp585_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp585_NonAna_spLossMapRelative.tif"))
CI_diff_spp585_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp585_diff_NonAna_spLossMapRelative.tif"))
spp585_NonAna_spLossMapRelative_Original = terra::rast(paste0(OutputDir,"ProcessedMaps/spp585_NonAna_spLossMapRelative_Original.tif"))
#spp585_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/spp585_NonAna_spLossMapRelative.tif"))
spp585_NonAna_spLossMapAbsolute = terra::rast(paste0(OutputDir,"ProcessedMaps/spp585_NonAna_spLossMapAbsolute.tif"))
spp585_spMapRelative_refuge = terra::rast(paste0(OutputDir,"ProcessedMaps/spp585_spMapRelative_refuge.tif"))
NaH_spp585_spMapRelative_refuge = terra::rast(paste0(OutputDir,"ProcessedMaps/NaH_spp585_spMapRelative_refuge.tif"))



bivmapNA2a=raster::raster(paste0(OutputDir,"ProcessedMaps/BivariateMap_ssp126_NonAna_exposure.uncertainty.tif"))
bivmapNA2b=raster::raster(paste0(OutputDir,"ProcessedMaps/BivariateMap_ssp370_NonAna_exposure.uncertainty.tif"))
bivmapNA2c=raster::raster(paste0(OutputDir,"ProcessedMaps/BivariateMap_ssp585_NonAna_exposure.uncertainty.tif"))
bivmap2a=raster::raster(paste0(OutputDir,"ProcessedMaps/BivariateMap_ssp126_withoutNA_exposure.uncertainty.tif"))
bivmap2b=raster::raster(paste0(OutputDir,"ProcessedMaps/BivariateMap_ssp370_withoutNA_exposure.uncertainty.tif"))
bivmap2c=raster::raster(paste0(OutputDir,"ProcessedMaps/BivariateMap_ssp585_withoutNA_exposure.uncertainty.tif"))

# NaH_diff_ssp126_cropped= terra::rast(paste0(OutputDir,"ProcessedMaps/NaH_ssp126_spLossRelative_difference_cropped.tif"))
# SE_diff_spp126_NonAna_spLossMapRelative_cropped= terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp126_diff_NonAna_spLossMapRelative_cropped.tif"))
# CI_diff_spp126_NonAna_spLossMapRelative_cropped= terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp126_diff_NonAna_spLossMapRelative_cropped.tif"))
# NaH_diff_ssp370_cropped= terra::rast(paste0(OutputDir,"ProcessedMaps/NaH_ssp370_spLossRelative_difference_cropped.tif"))
# SE_diff_spp370_NonAna_spLossMapRelative_cropped= terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp370_diff_NonAna_spLossMapRelative_cropped.tif"))
# CI_diff_spp370_NonAna_spLossMapRelative_cropped= terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp370_diff_NonAna_spLossMapRelative_cropped.tif"))
# NaH_diff_ssp585_cropped= terra::rast(paste0(OutputDir,"ProcessedMaps/NaH_ssp585_spLossRelative_difference_cropped.tif"))
# SE_diff_spp585_NonAna_spLossMapRelative_cropped= terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp585_diff_NonAna_spLossMapRelative_cropped.tif"))
# CI_diff_spp585_NonAna_spLossMapRelative_cropped= terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp585_diff_NonAna_spLossMapRelative_cropped.tif"))








# spp126_NonAna_spLossMapRelative_cropped = crop_maps_diff(spp126_NonAna_spLossMapRelative_Original)
# spp126_NonAna_spLossMapRelative_croppedB = terra::ifel(is.na(NaH_diff_ssp126_cropped),NA,spp126_NonAna_spLossMapRelative_cropped)
# #
# spp370_NonAna_spLossMapRelative_cropped = crop_maps_diff(spp370_NonAna_spLossMapRelative_Original)
# spp370_NonAna_spLossMapRelative_croppedB = terra::ifel(is.na(NaH_diff_ssp370_cropped),NA,spp370_NonAna_spLossMapRelative_cropped)
# #
# spp585_NonAna_spLossMapRelative_cropped = crop_maps_diff(spp585_NonAna_spLossMapRelative_Original)
# spp585_NonAna_spLossMapRelative_croppedB = terra::ifel(is.na(NaH_diff_ssp585_cropped),NA,spp585_NonAna_spLossMapRelative_cropped)

# Relative species - loss

pdf("M:/Aarhus University 2022-2023/Odrive_ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.Rel.SpLoss.pdf",height=4,width=22)
par(mfrow=c(1,3))
added = colorRampPalette((c("black","#7f0000","#b30000","#d7301f","#ef6548","#fc8d59","#fdbb84")))(100)
BlPu = colorRampPalette(c("black","darkblue","blue","purple","violet","pink"))(100)
terra::plot(spp126_NonAna_spLossMapRelative_Original,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), colNA="white", col="grey",axes=T, box=T,main="ssp126 Relative Species Loss (%)")
terra::plot(spp126_NonAna_spLossMapRelative,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2),  col=BlPu,axes=F,add=T);terra::plot(cont,add=T)
#
terra::plot(spp370_NonAna_spLossMapRelative_Original,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), colNA="white", col="grey",axes=T, box=T,main="ssp370 Relative Species Loss (%)")
terra::plot(spp370_NonAna_spLossMapRelative,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), col=BlPu,axes=F,add=T);terra::plot(cont,add=T)
#
terra::plot(spp585_NonAna_spLossMapRelative_Original,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), colNA="white", col="grey",axes=T, box=T,main="ssp585 Relative Species Loss (%)")
terra::plot(spp585_NonAna_spLossMapRelative,         legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), col=BlPu,axes=F,add=T);terra::plot(cont,add=T)
dev.off()






# species richness overall
SpRi = colorRampPalette(
  c(#"#ffffd9",    
    "#e0ecf4",    "#bfd3e6",    "#9ebcda",    "#8c96c6",
    "#7fcdbb",    "#41b6c4",    "#1d91c0",    "#225ea8",    "#253494",
    "#8c6bb1",    "#88419d",    "#810f7c",
    "#4d004b","#081d58",   "#000000"))(100)
pdf("M:/Aarhus University 2022-2023/Odrive_ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.SpRichness.pdf",height=5,width=11)
par(mfrow=c(1,1))
terra::plot(log10(sp.richness),legend = T,pax=list(cex=2,side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)),plg=list(cex=2),colNA="white", col=SpRi,axes=T, box=T,main="Species Richness (#)");terra::plot(cont,add=T)
dev.off()


sp.richness = terra::rast(paste0(InputDir,"spRichMap_masked.tif"))
sp.r_old = terra::rast("ClimateRefugia.paper/Output/FilesReceivedSelwyn/ShareRasters_2023_10_02/spRichMap_masked.tif")
dif = sp.richness-sp.r_old
terra::plot(log10(abs(dif)))




#######################################
###
### SPECIES LOSS
###
#######################################

# Relative species - loss

# pdf("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.Rel.SpLoss.pdf",height=14,width=22)
# par(mfrow=c(3,2))
# added = colorRampPalette((c("black","#7f0000","#b30000","#d7301f","#ef6548","#fc8d59","#fdbb84")))(100)
# BlPu = colorRampPalette(c("black","darkblue","blue","purple","violet","pink"))(100)
# terra::plot(spp126_spLossMapRelative_Original,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), colNA="white", col="grey",axes=T, box=T,main="ssp126 Relative Species Loss (%)")
# terra::plot(spp126_spLossMapRelative,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2),  col=BlPu,axes=T,add=T);terra::plot(cont,add=T)
# terra::plot(NaH_diff_ssp126,legend = T,type="continuous", pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", range=c(0,100),col=added,axes=T, box=T,main="added percent due to NaH");terra::plot(cont,add=T)
# #
# terra::plot(spp370_spLossMapRelative_Original,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), colNA="white", col="grey",axes=T, box=T,main="ssp370 Relative Species Loss (%)")
# terra::plot(spp370_spLossMapRelative,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), col=BlPu,axes=T,add=T);terra::plot(cont,add=T)
# terra::plot(NaH_diff_ssp370,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", range=c(0,100), col=added,axes=T, box=T,main="added percent due to NaH");terra::plot(cont,add=T)
# #
# terra::plot(spp585_spLossMapRelative_Original,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), colNA="white", col="grey",axes=T, box=T,main="ssp585 Relative Species Loss (%)")
# terra::plot(spp585_spLossMapRelative,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), col=BlPu,axes=T,add=T);terra::plot(cont,add=T)
# terra::plot(NaH_diff_ssp585,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", range=c(0,100),col=added,axes=T, box=T,main="added percent due to NaH");terra::plot(cont,add=T)
# dev.off()
# 
# 
# # Relative species - loss CROPPED
# pdf("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.Rel.SpLoss_cropped.pdf",height=14,width=22)
# par(mfrow=c(3,2))
# added = colorRampPalette((c("black","#7f0000","#b30000","#d7301f","#ef6548","#fc8d59","#fdbb84")))(100)
# BlPu = colorRampPalette(c("black","darkblue","blue","purple","violet","pink"))(100)
# terra::plot(spp126_spLossMapRelative_Original,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), colNA="white", col="grey",axes=T, box=T,main="ssp126 Relative Species Loss (%)")
# terra::plot(spp126_spLossMapRelative,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2),  col=BlPu,axes=T,add=T);terra::plot(cont,add=T)
# terra::plot(NaH_diff_ssp126_cropped,legend = T,type="continuous", pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", range=c(0,100),col=added,axes=T, box=T,main="added percent due to NaH");terra::plot(cont,add=T)
# #
# terra::plot(spp370_spLossMapRelative_Original,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), colNA="white", col="grey",axes=T, box=T,main="ssp370 Relative Species Loss (%)")
# terra::plot(spp370_spLossMapRelative,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), col=BlPu,axes=T,add=T);terra::plot(cont,add=T)
# terra::plot(NaH_diff_ssp370_cropped,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", range=c(0,100), col=added,axes=T, box=T,main="added percent due to NaH");terra::plot(cont,add=T)
# #
# terra::plot(spp585_spLossMapRelative_Original,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), colNA="white", col="grey",axes=T, box=T,main="ssp585 Relative Species Loss (%)")
# terra::plot(spp585_spLossMapRelative,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), col=BlPu,axes=T,add=T);terra::plot(cont,add=T)
# terra::plot(NaH_diff_ssp585_cropped,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", range=c(0,100),col=added,axes=T, box=T,main="added percent due to NaH");terra::plot(cont,add=T)
# dev.off()



# Absolute species loss
pdf("M:/Aarhus University 2022-2023/Odrive_ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.Abs.SpLoss.pdf",height=14,width=11)
par(mfrow=c(3,1))
abs = colorRampPalette(rev(c("black","darkred","red","orange","yellow","#abd9e9")))(100)
terra::plot(log10(ssp126_abs),legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=abs,axes=T, box=T,main="log10 ssp126 Absolute Species Loss (#)");terra::plot(cont,add=T)
terra::plot(log10(ssp370_abs),legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=abs,axes=T, box=T,main="log10 ssp370 Absolute Species Loss (#)");terra::plot(cont,add=T)
terra::plot(log10(ssp585_abs),legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=abs,axes=T, box=T,main="log10 ssp585 Absolute Species Loss (#)");terra::plot(cont,add=T)
dev.off()



# Non-Analogue Hotter Absolute species loss
pdf("M:/Aarhus University 2022-2023/Odrive_ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.Abs.SpLoss.NonAnalogue.pdf",height=14,width=11)
par(mfrow=c(3,1))
abs = colorRampPalette(rev(c("black","darkred","red","orange","yellow","#abd9e9")))(100)
terra::plot(log10(spp126_NonAna_spLossMapAbsolute),legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=abs,axes=T, box=T,main="ssp126 Non Analogue log10 Absolute Species Loss (#)");terra::plot(cont,add=T)
terra::plot(log10(spp370_NonAna_spLossMapAbsolute),legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=abs,axes=T, box=T,main="ssp370 Non Analogue log10 Absolute Species Loss (#)");terra::plot(cont,add=T)
terra::plot(log10(spp585_NonAna_spLossMapAbsolute),legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=abs,axes=T, box=T,main="ssp585 Non Analogue log10 Absolute Species Loss (#)");terra::plot(cont,add=T)
dev.off()




# Non-Analogue Hotter Relative species loss
pdf("M:/Aarhus University 2022-2023/Odrive_ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.Rel.SpLoss.NonAnalogue.pdf",height=14,width=11)
par(mfrow=c(3,1))
BlPu = colorRampPalette(c("black","darkblue","blue","purple","violet","pink"))(100)
terra::plot(spp126_NonAna_spLossMapRelative_Original,pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col='grey',axes=T, box=T,main="ssp126 Non Analogue Relative Species Loss (%)")
terra::plot(spp126_NonAna_spLossMapRelative,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), col=BlPu,axes=T, box=T,main="ssp126 Non Analogue Relative Species Loss (%)",add=T);terra::plot(cont,add=T)
terra::plot(spp370_NonAna_spLossMapRelative_Original,pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col='grey',axes=T, box=T,main="ssp370 Non Analogue Relative Species Loss (%)")
terra::plot(spp370_NonAna_spLossMapRelative,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), col=BlPu,axes=T, box=T,main="ssp370 Non Analogue Relative Species Loss (%)",add=T);terra::plot(cont,add=T)
terra::plot(spp585_NonAna_spLossMapRelative_Original,pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col='grey',axes=T, box=T,main="ssp585 Non Analogue Relative Species Loss (%)")
terra::plot(spp585_NonAna_spLossMapRelative,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), col=BlPu,axes=T, box=T,main="ssp585 Non Analogue Relative Species Loss (%)",add=T);terra::plot(cont,add=T)
dev.off()





#######################################
###
### STANDARD ERROR MAPS FOR SPECIES LOSS
###
#######################################

CI_spp126_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp126_spLossMapRelative.tif"))
CI_spp370_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp370_spLossMapRelative.tif"))
CI_spp585_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp585_spLossMapRelative.tif"))


pdf("M:/Aarhus University 2022-2023/Odrive_ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.CI95.pdf",height=14,width=11)
par(mfrow=c(3,1))
terra::plot((CI_spp126_spLossMapRelative),legend = T, range=c(0,50),  pax=list(side=c(1:2), tick=1:2, lab=1:2, retro=TRUE, at = c(-100,-60,-50,-30,0,30,50,60,100,150)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp126 CI95");terra::plot(cont,add=T)
terra::plot((CI_spp370_spLossMapRelative),legend = T, range=c(0,50),  pax=list(side=c(1:2), tick=1:2, lab=1:2, retro=TRUE, at = c(-100,-60,-50,-30,0,30,50,60,100,150)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp370 CI95");terra::plot(cont,add=T)
terra::plot((CI_spp585_spLossMapRelative),legend = T, range=c(0,50),  pax=list(side=c(1:2), tick=1:2, lab=1:2, retro=TRUE, at = c(-100,-60,-50,-30,0,30,50,60,100,150)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp585 CI95");terra::plot(cont,add=T)
dev.off()

pdf("M:/Aarhus University 2022-2023/Odrive_ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.NonAnalogue.CI95.pdf",height=14,width=11)
par(mfrow=c(3,1))
terra::plot((CI_spp126_NonAna_spLossMapRelative),legend = T, range=c(0,50), pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp126 CI95");terra::plot(cont,add=T)
terra::plot((CI_spp370_NonAna_spLossMapRelative),legend = T, range=c(0,50), pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp370 CI95");terra::plot(cont,add=T)
terra::plot((CI_spp585_NonAna_spLossMapRelative),legend = T, range=c(0,50), pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp585 CI95");terra::plot(cont,add=T)
dev.off()






#######################################
###
### Combined maps
###
#######################################

require("classInt")
require("raster")
#require("rgdal")
require("dismo")
require("XML")
require("maps")
require("sp")
colmat<-function(nquantiles=10,xlab="x label", ylab="y label"){
  my.data<-seq(0,1,.01)
  my.class<-classIntervals(my.data,n=nquantiles,style="quantile")
  my.pal.1<-findColours(my.class,c("#f7fcb9","#78c679","black"))
  my.pal.mid<-findColours(my.class,c("#bf812d","#8073ac","blue"))
  my.pal.2<-findColours(my.class,c("brown4", "#bf468f","violet"))
  col.matrix<-matrix(nrow = 101, ncol = 101, NA)
  for(i in 1:101){
    my.col<-c(paste(my.pal.1[i]),paste0(my.pal.mid[i]),paste(my.pal.2[i]))
    col.matrix[102-i,]<-findColours(my.class,my.col)}
  plot(c(1,1),pch=19,col=my.pal.1, cex=0.5,xlim=c(0,1),ylim=c(0,1),frame.plot=F, xlab=xlab, ylab=ylab,cex.lab=1.3)
  for(i in 1:101){
    col.temp<-col.matrix[i-1,]
    points(my.data,rep((i-1)/100,101),pch=15,col=col.temp, cex=1)}
  seqs<-seq(0,100,(100/nquantiles))
  seqs[1]<-1
  col.matrix<-col.matrix[c(seqs), c(seqs)]
}

col.matrix<-colmat(nquantiles=3,
                   xlab="Relative Exposure", 
                   ylab="Uncertainty from Climate Model Variation")

se = colorRampPalette(c("black","#969696","#78c679","#f7fcb9"))(100)
BlPu = colorRampPalette(c("black","darkblue","blue","purple","violet","pink"))(100)
pdf("M:/Aarhus University 2022-2023/Odrive_ColineBoonman_au710911/ClimateRefugia.paper/Figures/Main.Results.pdf",
    height=7,width=16)
par(mfrow=c(3,3))
terra::plot(spp126_NonAna_spLossMapRelative_Original,pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col='grey',axes=F, box=T,main="ssp126 Non Analogue Relative Species Loss (%)",legend=F)
terra::plot(spp126_NonAna_spLossMapRelative,legend = F, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), col=BlPu,axes=T, box=T,main="ssp126 Non Analogue Relative Species Loss (%)",add=T);terra::plot(cont,add=T)
terra::plot((CI_spp126_NonAna_spLossMapRelative),legend = F, range=c(0,50), pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp126 CI95");terra::plot(cont,add=T)
terra::plot(bivmapNA2a,frame.plot=F,axes=T,box=T,add=F,legend=F,col=as.vector(unique(col.matrix)));terra::plot(cont,add=T)

terra::plot(spp370_NonAna_spLossMapRelative_Original,pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col='grey',axes=F, box=T,main="ssp370 Non Analogue Relative Species Loss (%)",legend=F)
terra::plot(spp370_NonAna_spLossMapRelative,legend = F, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), col=BlPu,axes=T, box=T,main="ssp370 Non Analogue Relative Species Loss (%)",add=T);terra::plot(cont,add=T)
terra::plot((CI_spp370_NonAna_spLossMapRelative),legend = F, range=c(0,50), pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp370 CI95");terra::plot(cont,add=T)
terra::plot(bivmapNA2b,frame.plot=F,axes=T,box=T,add=F,legend=F,col=as.vector(unique(col.matrix)));terra::plot(cont,add=T)

terra::plot(spp585_NonAna_spLossMapRelative_Original,pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col='grey',axes=F, box=T,main="ssp585 Non Analogue Relative Species Loss (%)",legend=F)
terra::plot(spp585_NonAna_spLossMapRelative,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), col=BlPu,axes=T, box=T,main="ssp585 Non Analogue Relative Species Loss (%)",add=T);terra::plot(cont,add=T)
terra::plot((CI_spp585_NonAna_spLossMapRelative),legend = T, range=c(0,50), pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp585 CI95");terra::plot(cont,add=T)
terra::plot(bivmapNA2c,frame.plot=F,axes=T,box=T,add=F,legend=F,col=as.vector(unique(col.matrix)));terra::plot(cont,add=T)

dev.off()

pdf("M:/Aarhus University 2022-2023/Odrive_ColineBoonman_au710911/ClimateRefugia.paper/Figures/bivariate.legend.pdf",
    height=3,width=3)
par(mfrow=c(1,1))
col.matrix<-colmat(nquantiles=3,
                   xlab="Relative Exposure", 
                   ylab="Uncertainty from Climate Model Variation")
dev.off()




##################
# test
colmat<-function(nquantiles=10,xlab="x label", ylab="y label"){
  my.data<-seq(0,1,.01)
  my.class<-classIntervals(my.data,n=nquantiles,style="quantile")
  my.pal.1<-findColours(my.class,c("#f7fcb9","#78c679","#373837"))
  my.pal.mid<-findColours(my.class,c("#bf812d","#8073ac","blue"))
  my.pal.2<-findColours(my.class,c("brown4", "#bf468f","violet"))
  col.matrix<-matrix(nrow = 101, ncol = 101, NA)
  for(i in 1:101){
    my.col<-c(paste(my.pal.1[i]),paste0(my.pal.mid[i]),paste(my.pal.2[i]))
    col.matrix[102-i,]<-findColours(my.class,my.col)}
  plot(c(1,1),pch=19,col=my.pal.1, cex=0.5,xlim=c(0,1),ylim=c(0,1),frame.plot=F, xlab=xlab, ylab=ylab,cex.lab=1.3)
  for(i in 1:101){
    col.temp<-col.matrix[i-1,]
    points(my.data,rep((i-1)/100,101),pch=15,col=col.temp, cex=1)}
  seqs<-seq(0,100,(100/nquantiles))
  seqs[1]<-1
  col.matrix<-col.matrix[c(seqs), c(seqs)]
}

col.matrix<-colmat(nquantiles=3,
                   xlab="Relative Exposure", 
                   ylab="Uncertainty from Climate Model Variation")

se = colorRampPalette(c("#373837","#969696","#78c679","#f7fcb9"))(100)
BlPu = colorRampPalette(c("#373837","darkblue","blue","purple","violet","pink"))(100)

terra::plot(spp126_NonAna_spLossMapRelative_Original,pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col='grey',axes=F, box=T,main="ssp126 Non Analogue Relative Species Loss (%)",legend=F)
terra::plot(spp126_NonAna_spLossMapRelative,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), col=BlPu,axes=T, box=T,main="ssp126 Non Analogue Relative Species Loss (%)",add=T);terra::plot(cont,add=T)
terra::plot((CI_spp126_NonAna_spLossMapRelative),legend = T, range=c(0,50), pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp126 CI95");terra::plot(cont,add=T)
terra::plot(bivmapNA2a,frame.plot=F,axes=T,box=T,add=F,legend=F,col=as.vector(unique(col.matrix)));terra::plot(cont,add=T)

png()
col.matrix<-colmat(nquantiles=3,
                   xlab="Relative Exposure", 
                   ylab="Uncertainty from Climate Model Variation")
dev.off()
############





#######################################
###
### MAP SUPPL INFO
###
#######################################
point = sf::read_sf("ClimateRefugia.paper/Input/Global.datapoints.shp")
df = read.table(paste0(OutputDir,"ClimateRefugia_NonAnalogue.txt"),sep=",",dec=".",header=T,check.names = F)
sp=df[df$stable_climate_percent_ssp126<50,"species"]
#
raster::plot(cont)
for(i in sp){
  print(i)
  sp.point = point[point$ID==i,]
  chull = adehabitatHR::mcp(as(sp.point,"Spatial"),percent=99)
  
  plot(chull,border="red",col=NA,lwd=1,add=T)
}





# read in data
biomes<-rgdal::readOGR(dsn = "ClimateRefugia.paper/biomes",layer="wwf_terr_ecos")
# create map with >90% species loss, and aggregate to higher resolution and extract coordinates
xy = terra::ifel(spp370_NonAna_spLossMapRelative<90,NA,1)
xy2 = terra::aggregate(xy,fact=10,fun="max",na.rm=T)
par(mfrow=c(1,2));terra::plot(xy);terra::plot(xy2)

xy3 <- terra::project(xy2,terra::crs(biomes))
wwf_sf <- sf::st_read("ClimateRefugia.paper/biomes/wwf_terr_ecos.shp")
raster_layer <- raster::raster(raster::extent(wwf_sf), resolution = raster::res(xy3)) 
rasterized_wwf <- raster::rasterize(wwf_sf, raster_layer, field = "BIOME")

xy4 = raster::raster(xy3)
raster::crs(rasterized_wwf) <- raster::crs(xy4)

r22 <- raster::raster(vals=raster::values(xy5),ext=raster::extent(rasterized_wwf),crs=raster::crs(rasterized_wwf),
                      nrows=dim(rasterized_wwf)[1],ncols=dim(rasterized_wwf)[2])
x = raster::stack(rasterized_wwf,r22)

raster.to.point =  x$layer.1 * x$layer.2
par(mfrow=c(2,2));raster::plot(xy);raster::plot(r22);raster::plot(rasterized_wwf);raster::plot(raster.to.point)

d = raster::rasterToPoints(raster.to.point)
colnames(d)[3]<-"biome.nr"
d=as.data.frame(d)
d$biome = d$biome.nr
d$biome[d$biome==1]<-"Tropical and Subtropical Moist Broadleaf Forest"#""
d$biome[d$biome==2]<-"Tropical and Subtropical Dry Broadleaf Forests"#""""
d$biome[d$biome==3]<-"Tropical and Subtropical Coniferous Forests"#""""
d$biome[d$biome==4]<-"Temperate Broadleaf and Mixed Forests"#""
d$biome[d$biome==5]<-"Temperate Coniferous Forests"#""""
d$biome[d$biome==6]<-"Boreal Forests/Taiga"
d$biome[d$biome==7]<-"Tropical and subtropical grasslands, savannas, and shrublands"#""
d$biome[d$biome==8]<-"Temperate Grasslands, Savannas, and Shrublands"#""
d$biome[d$biome==9]<-"Flooded Grasslands and Savannas"#""
d$biome[d$biome==10]<-"Montane Grasslands and Shrublands"#""
d$biome[d$biome==11]<-"Tundra"
d$biome[d$biome==12]<-"Mediterranean Forests, Woodlands, and Scrub"
d$biome[d$biome==13]<-"Deserts and Xeric Shrublands"
d$biome[d$biome==14]<-"Mangroves"
d$biome[d$biome==98]<-"Lakes"
d$biome[d$biome==99]<-"Rock and Ice"
d$biome<-as.factor(d$biome)
table(d$biome)

table(d$biome)*100/nrow(d) #percentage table


sp.point = point[point$ID %in% sp,]
raster::plot(cont)
plot(sp.point,add=T,col="black",pch=19,cex=0.5)










#######################################
###
### Combined maps ignoring Non analogue hotter climates, for suppl mat.
###
#######################################

require("classInt")
require("raster")
#require("rgdal")
require("dismo")
require("XML")
require("maps")
require("sp")

colmat<-function(nquantiles=10,xlab="x label", ylab="y label"){
  my.data<-seq(0,1,.01)
  my.class<-classIntervals(my.data,n=nquantiles,style="quantile")
  my.pal.1<-findColours(my.class,c("#f7fcb9","#78c679","black"))
  my.pal.mid<-findColours(my.class,c("#bf812d","#8073ac","blue"))
  my.pal.2<-findColours(my.class,c("brown4", "#bf468f","violet"))
  col.matrix<-matrix(nrow = 101, ncol = 101, NA)
  for(i in 1:101){
    my.col<-c(paste(my.pal.1[i]),paste0(my.pal.mid[i]),paste(my.pal.2[i]))
    col.matrix[102-i,]<-findColours(my.class,my.col)}
  plot(c(1,1),pch=19,col=my.pal.1, cex=0.5,xlim=c(0,1),ylim=c(0,1),frame.plot=F, xlab=xlab, ylab=ylab,cex.lab=1.3)
  for(i in 1:101){
    col.temp<-col.matrix[i-1,]
    points(my.data,rep((i-1)/100,101),pch=15,col=col.temp, cex=1)}
  seqs<-seq(0,100,(100/nquantiles))
  seqs[1]<-1
  col.matrix<-col.matrix[c(seqs), c(seqs)]
}

col.matrix<-colmat(nquantiles=3,
                   xlab="Relative Exposure", 
                   ylab="Uncertainty from Climate Model Variation")
                   
se = colorRampPalette(c("black","#969696","#78c679","#f7fcb9"))(100)
BlPu = colorRampPalette(c("black","darkblue","blue","purple","violet","pink"))(100)
pdf("M:/Aarhus University 2022-2023/Odrive_ColineBoonman_au710911/ClimateRefugia.paper/Figures/Main.Results.exclNAH.pdf",
    height=7,width=16)
par(mfrow=c(3,3))
terra::plot(spp126_spLossMapRelative_Original,pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col='grey',axes=F, box=T,main="ssp126 Non Analogue Relative Species Loss (%)",legend=F)
terra::plot(spp126_spLossMapRelative,legend = F, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), col=BlPu,axes=T, box=T,main="ssp126 Non Analogue Relative Species Loss (%)",add=T);terra::plot(cont,add=T)
terra::plot((CI_spp126_spLossMapRelative),legend = F, range=c(0,50), pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp126 CI95");terra::plot(cont,add=T)
terra::plot(bivmap2a,frame.plot=F,axes=T,box=T,add=F,legend=F,col=as.vector(unique(col.matrix)));terra::plot(cont,add=T)

terra::plot(spp370_spLossMapRelative_Original,pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col='grey',axes=F, box=T,main="ssp370 Non Analogue Relative Species Loss (%)",legend=F)
terra::plot(spp370_spLossMapRelative,legend = F, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), col=BlPu,axes=T, box=T,main="ssp370 Non Analogue Relative Species Loss (%)",add=T);terra::plot(cont,add=T)
terra::plot((CI_spp370_spLossMapRelative),legend = F, range=c(0,50), pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp370 CI95");terra::plot(cont,add=T)
terra::plot(bivmap2b,frame.plot=F,axes=T,box=T,add=F,legend=F,col=as.vector(unique(col.matrix)));terra::plot(cont,add=T)

terra::plot(spp585_spLossMapRelative_Original,pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col='grey',axes=F, box=T,main="ssp585 Non Analogue Relative Species Loss (%)",legend=F)
terra::plot(spp585_spLossMapRelative,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), col=BlPu,axes=T, box=T,main="ssp585 Non Analogue Relative Species Loss (%)",add=T);terra::plot(cont,add=T)
terra::plot((CI_spp585_spLossMapRelative),legend = T, range=c(0,50), pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp585 CI95");terra::plot(cont,add=T)
terra::plot(bivmap2c,frame.plot=F,axes=T,box=T,add=F,legend=F,col=as.vector(unique(col.matrix)));terra::plot(cont,add=T)

dev.off()
