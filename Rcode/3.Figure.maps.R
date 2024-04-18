rm(list = ls())

#-------- directories and data
setwd("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/")
InputDir  = "ClimateRefugia.paper/Output/FilesReceivedSelwyn/ShareRasters_2023_10_02/"
InputDir2  = "ClimateRefugia.paper/Output/FilesReceivedSelwyn/SpeciesClimateLossMeanSE/"
OutputDir = "ClimateRefugia.paper/Output/"
FigureDir = "ClimateRefugia.paper/Figures/"

crop_maps = function(x) terra::crop(x, terra::ext(c(-180.0001, 179.9999, -60, 83.99986)), snap="near")
crop_maps_diff = function(x) terra::crop(x, terra::ext(c(-110, 154, -35, 35)), snap="near")


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
spp126_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/spp126_spLossMapRelative.tif"))
NaH_diff_ssp126 = terra::rast(paste0(OutputDir,"ProcessedMaps/NaH_ssp126_spLossRelative_difference.tif"))
NaH_diff_ssp126 = terra::ifel(NaH_diff_ssp126==0,NA,NaH_diff_ssp126)
ssp126_abs = terra::rast(paste0(OutputDir,"ProcessedMaps/ssp126_absoluteSpLoss.tif"))
SE_spp126_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp126_NonAna_spLossMapRelative.tif"))
SE_spp126_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp126_spLossMapRelative.tif"))
SE_diff_spp126_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp126_diff_NonAna_spLossMapRelative.tif"))
CI_spp126_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp126_spLossMapRelative.tif"))
CI_spp126_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp126_NonAna_spLossMapRelative.tif"))
CI_diff_spp126_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp126_diff_NonAna_spLossMapRelative.tif"))
spp126_NonAna_spLossMapRelative_Original = terra::rast(paste0(OutputDir,"ProcessedMaps/spp126_NonAna_spLossMapRelative_Original.tif"))
spp126_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/spp126_NonAna_spLossMapRelative.tif"))
spp126_NonAna_spLossMapAbsolute = terra::rast(paste0(OutputDir,"ProcessedMaps/spp126_NonAna_spLossMapAbsolute.tif"))
spp126_spMapRelative_refuge = terra::rast(paste0(OutputDir,"ProcessedMaps/spp126_spMapRelative_refuge.tif"))
NaH_diff_ssp126_refuge = terra::rast(paste0(OutputDir,"ProcessedMaps/NaH_diff_ssp126_refuge.tif"))
NaH_spp126_spMapRelative_refuge = terra::rast(paste0(OutputDir,"ProcessedMaps/NaH_spp126_spMapRelative_refuge.tif"))
loss1c_75 = terra::rast(paste0(OutputDir,"ProcessedMaps/Hotspot126_loss1c_75.tif"))
loss1_75 = terra::rast(paste0(OutputDir,"ProcessedMaps/Hotspot126_loss1_75.tif"))
loss1nah_75 = terra::rast(paste0(OutputDir,"ProcessedMaps/Hotspot126_loss1nah_75.tif"))
loss1c_85 = terra::rast(paste0(OutputDir,"ProcessedMaps/Hotspot126_loss1c_85.tif"))
loss1_85 = terra::rast(paste0(OutputDir,"ProcessedMaps/Hotspot126_loss1_85.tif"))
loss1nah_85 = terra::rast(paste0(OutputDir,"ProcessedMaps/Hotspot126_loss1nah_85.tif"))
refugia_bin1 = terra::rast(paste0(OutputDir,"ProcessedMaps/HotspotRefugia126_refugia_bin1.tif"))
refugia_bin1NaH = terra::rast(paste0(OutputDir,"ProcessedMaps/HotspotRefugia126_refugia_bin1NaH.tif"))
refugia_1 = terra::rast(paste0(OutputDir,"ProcessedMaps/HotspotRefugia126_refugia_1.tif"))
refugia_1NaH = terra::rast(paste0(OutputDir,"ProcessedMaps/HotspotRefugia126_refugia_1NaH.tif"))
spp370_spLossMapRelative_Original = terra::rast(paste0(OutputDir,"ProcessedMaps/spp370_spLossMapRelative_Original.tif"))
spp370_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/spp370_spLossMapRelative.tif"))
NaH_diff_ssp370 = terra::rast(paste0(OutputDir,"ProcessedMaps/NaH_ssp370_spLossRelative_difference.tif"))
ssp370_abs = terra::rast(paste0(OutputDir,"ProcessedMaps/ssp370_absoluteSpLoss.tif"))
SE_spp370_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp370_NonAna_spLossMapRelative.tif"))
SE_spp370_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp370_spLossMapRelative.tif"))
SE_diff_spp370_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp370_diff_NonAna_spLossMapRelative.tif"))
CI_spp370_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp370_spLossMapRelative.tif"))
CI_spp370_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp370_NonAna_spLossMapRelative.tif"))
CI_diff_spp370_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp370_diff_NonAna_spLossMapRelative.tif"))
spp370_NonAna_spLossMapRelative_Original = terra::rast(paste0(OutputDir,"ProcessedMaps/spp370_NonAna_spLossMapRelative_Original.tif"))
spp370_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/spp370_NonAna_spLossMapRelative.tif"))
spp370_NonAna_spLossMapAbsolute = terra::rast(paste0(OutputDir,"ProcessedMaps/spp370_NonAna_spLossMapAbsolute.tif"))
spp370_spMapRelative_refuge = terra::rast(paste0(OutputDir,"ProcessedMaps/spp370_spMapRelative_refuge.tif"))
NaH_diff_ssp370_refuge = terra::rast(paste0(OutputDir,"ProcessedMaps/NaH_diff_ssp370_refuge.tif"))
NaH_spp370_spMapRelative_refuge = terra::rast(paste0(OutputDir,"ProcessedMaps/NaH_spp370_spMapRelative_refuge.tif"))
loss2c_75 = terra::rast(paste0(OutputDir,"ProcessedMaps/Hotspot370_loss2c_75.tif"))
loss2_75 = terra::rast(paste0(OutputDir,"ProcessedMaps/Hotspot370_loss2_75.tif"))
loss2nah_75 = terra::rast(paste0(OutputDir,"ProcessedMaps/Hotspot370_loss2nah_75.tif"))
loss2c_85 = terra::rast(paste0(OutputDir,"ProcessedMaps/Hotspot370_loss2c_85.tif"))
loss2_85 = terra::rast(paste0(OutputDir,"ProcessedMaps/Hotspot370_loss2_85.tif"))
loss2nah_85 = terra::rast(paste0(OutputDir,"ProcessedMaps/Hotspot370_loss2nah_85.tif"))
refugia_bin2NaH = terra::rast(paste0(OutputDir,"ProcessedMaps/HotspotRefugia370_refugia_bin2NaH.tif"))
refugia_bin2 = terra::rast(paste0(OutputDir,"ProcessedMaps/HotspotRefugia370_refugia_bin2.tif"))
refugia_2 = terra::rast(paste0(OutputDir,"ProcessedMaps/HotspotRefugia370_refugia_2.tif"))
refugia_2NaH = terra::rast(paste0(OutputDir,"ProcessedMaps/HotspotRefugia370_refugia_2NaH.tif"))
spp585_spLossMapRelative_Original = terra::rast(paste0(OutputDir,"ProcessedMaps/spp585_spLossMapRelative_Original.tif"))
spp585_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/spp585_spLossMapRelative.tif"))
NaH_diff_ssp585 = terra::rast(paste0(OutputDir,"ProcessedMaps/NaH_ssp585_spLossRelative_difference.tif"))
ssp585_abs = terra::rast(paste0(OutputDir,"ProcessedMaps/ssp585_absoluteSpLoss.tif"))
SE_spp585_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp585_NonAna_spLossMapRelative.tif"))
SE_spp585_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp585_spLossMapRelative.tif"))
SE_diff_spp585_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp585_diff_NonAna_spLossMapRelative.tif"))
CI_spp585_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp585_spLossMapRelative.tif"))
CI_spp585_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp585_NonAna_spLossMapRelative.tif"))
CI_diff_spp585_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp585_diff_NonAna_spLossMapRelative.tif"))
spp585_NonAna_spLossMapRelative_Original = terra::rast(paste0(OutputDir,"ProcessedMaps/spp585_NonAna_spLossMapRelative_Original.tif"))
spp585_NonAna_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/spp585_NonAna_spLossMapRelative.tif"))
spp585_NonAna_spLossMapAbsolute = terra::rast(paste0(OutputDir,"ProcessedMaps/spp585_NonAna_spLossMapAbsolute.tif"))
spp585_spMapRelative_refuge = terra::rast(paste0(OutputDir,"ProcessedMaps/spp585_spMapRelative_refuge.tif"))
NaH_diff_ssp585_refuge = terra::rast(paste0(OutputDir,"ProcessedMaps/NaH_diff_ssp585_refuge.tif"))
NaH_spp585_spMapRelative_refuge = terra::rast(paste0(OutputDir,"ProcessedMaps/NaH_spp585_spMapRelative_refuge.tif"))
loss3c_75 = terra::rast(paste0(OutputDir,"ProcessedMaps/Hotspot585_loss3c_75.tif"))
loss3_75 = terra::rast(paste0(OutputDir,"ProcessedMaps/Hotspot585_loss3_75.tif"))
loss3nah_75 = terra::rast(paste0(OutputDir,"ProcessedMaps/Hotspot585_loss3nah_75.tif"))
loss3c_85 = terra::rast(paste0(OutputDir,"ProcessedMaps/Hotspot585_loss3c_85.tif"))
loss3_85 = terra::rast(paste0(OutputDir,"ProcessedMaps/Hotspot585_loss3_85.tif"))
loss3nah_85 = terra::rast(paste0(OutputDir,"ProcessedMaps/Hotspot585_loss3nah_85.tif"))
refugia_bin3NaH = terra::rast(paste0(OutputDir,"ProcessedMaps/HotspotRefugia585_refugia_bin3NaH.tif"))
refugia_bin3 = terra::rast(paste0(OutputDir,"ProcessedMaps/HotspotRefugia585_refugia_bin3.tif"))
refugia_3 = terra::rast(paste0(OutputDir,"ProcessedMaps/HotspotRefugia585_refugia_3.tif"))
refugia_3NaH = terra::rast(paste0(OutputDir,"ProcessedMaps/HotspotRefugia585_refugia_3NaH.tif"))


NaH_diff_ssp126_cropped= terra::rast(paste0(OutputDir,"ProcessedMaps/NaH_ssp126_spLossRelative_difference_cropped.tif"))
SE_diff_spp126_NonAna_spLossMapRelative_cropped= terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp126_diff_NonAna_spLossMapRelative_cropped.tif"))
CI_diff_spp126_NonAna_spLossMapRelative_cropped= terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp126_diff_NonAna_spLossMapRelative_cropped.tif"))
NaH_diff_ssp370_cropped= terra::rast(paste0(OutputDir,"ProcessedMaps/NaH_ssp370_spLossRelative_difference_cropped.tif"))
SE_diff_spp370_NonAna_spLossMapRelative_cropped= terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp370_diff_NonAna_spLossMapRelative_cropped.tif"))
CI_diff_spp370_NonAna_spLossMapRelative_cropped= terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp370_diff_NonAna_spLossMapRelative_cropped.tif"))
NaH_diff_ssp585_cropped= terra::rast(paste0(OutputDir,"ProcessedMaps/NaH_ssp585_spLossRelative_difference_cropped.tif"))
SE_diff_spp585_NonAna_spLossMapRelative_cropped= terra::rast(paste0(OutputDir,"ProcessedMaps/SE_spp585_diff_NonAna_spLossMapRelative_cropped.tif"))
CI_diff_spp585_NonAna_spLossMapRelative_cropped= terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp585_diff_NonAna_spLossMapRelative_cropped.tif"))








spp126_NonAna_spLossMapRelative_cropped = crop_maps_diff(spp126_NonAna_spLossMapRelative_Original)
spp126_NonAna_spLossMapRelative_croppedB = terra::ifel(is.na(NaH_diff_ssp126_cropped),NA,spp126_NonAna_spLossMapRelative_cropped)
#
spp370_NonAna_spLossMapRelative_cropped = crop_maps_diff(spp370_NonAna_spLossMapRelative_Original)
spp370_NonAna_spLossMapRelative_croppedB = terra::ifel(is.na(NaH_diff_ssp370_cropped),NA,spp370_NonAna_spLossMapRelative_cropped)
#
spp585_NonAna_spLossMapRelative_cropped = crop_maps_diff(spp585_NonAna_spLossMapRelative_Original)
spp585_NonAna_spLossMapRelative_croppedB = terra::ifel(is.na(NaH_diff_ssp585_cropped),NA,spp585_NonAna_spLossMapRelative_cropped)

# Relative species - loss
pdf("ClimateRefugia.paper/Figures/Maps.Rel.SpLossNEW.pdf",height=14,width=22)
par(mfrow=c(3,3))
added = colorRampPalette((c("black","#7f0000","#b30000","#d7301f","#ef6548","#fc8d59","#fdbb84")))(100)
BlPu = colorRampPalette(c("black","darkblue","blue","purple","violet","pink"))(100)
terra::plot(spp126_spLossMapRelative_Original,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), colNA="white", col="grey",axes=T, box=T,main="ssp126 Relative Species Loss (%)")
terra::plot(spp126_spLossMapRelative,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2),  col=BlPu,axes=F,add=T);terra::plot(cont,add=T)
#
terra::plot(spp370_spLossMapRelative_Original,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), colNA="white", col="grey",axes=T, box=T,main="ssp370 Relative Species Loss (%)")
terra::plot(spp370_spLossMapRelative,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), col=BlPu,axes=F,add=T);terra::plot(cont,add=T)
#
terra::plot(spp585_spLossMapRelative_Original,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), colNA="white", col="grey",axes=T, box=T,main="ssp585 Relative Species Loss (%)")
terra::plot(spp585_spLossMapRelative,         legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), col=BlPu,axes=F,add=T);terra::plot(cont,add=T)
##
terra::plot(spp126_NonAna_spLossMapRelative_croppedB,legend = T,type="continuous", pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", range=c(0,100),col=BlPu,axes=T, box=T);terra::plot(cont,add=T)
terra::plot(spp370_NonAna_spLossMapRelative_croppedB,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", range=c(0,100), col=BlPu,axes=T, box=T);terra::plot(cont,add=T)
terra::plot(spp585_NonAna_spLossMapRelative_croppedB,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", range=c(0,100),col=BlPu,axes=T, box=T);terra::plot(cont,add=T)
##
terra::plot(NaH_diff_ssp126_cropped,legend = T,type="continuous", pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", range=c(0,100),col=added,axes=T, box=T,main="added percent due to NaH");terra::plot(cont,add=T)
terra::plot(NaH_diff_ssp370_cropped,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", range=c(0,100), col=added,axes=T, box=T,main="added percent due to NaH");terra::plot(cont,add=T)
terra::plot(NaH_diff_ssp585_cropped,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", range=c(0,100),col=added,axes=T, box=T,main="added percent due to NaH");terra::plot(cont,add=T)

dev.off()








# species richness overall
SpRi = colorRampPalette(
  c(#"#ffffd9",    
    "#e0ecf4",    "#bfd3e6",    "#9ebcda",    "#8c96c6",
    "#7fcdbb",    "#41b6c4",    "#1d91c0",    "#225ea8",    "#253494",
    "#8c6bb1",    "#88419d",    "#810f7c",
    "#4d004b","#081d58",   "#000000"))(100)
pdf("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.SpRichness.pdf",height=5,width=11)
par(mfrow=c(1,1))
terra::plot(log10(sp.richness),legend = T,pax=list(cex=2,side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)),plg=list(cex=2),colNA="white", col=SpRi,axes=T, box=T,main="Species Richness (#)");terra::plot(cont,add=T)
dev.off()



#######################################
###
### SPECIES LOSS
###
#######################################

# Relative species - loss
pdf("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.Rel.SpLoss.pdf",height=14,width=22)
par(mfrow=c(3,2))
added = colorRampPalette((c("black","#7f0000","#b30000","#d7301f","#ef6548","#fc8d59","#fdbb84")))(100)
BlPu = colorRampPalette(c("black","darkblue","blue","purple","violet","pink"))(100)
terra::plot(spp126_spLossMapRelative_Original,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), colNA="white", col="grey",axes=T, box=T,main="ssp126 Relative Species Loss (%)")
terra::plot(spp126_spLossMapRelative,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2),  col=BlPu,axes=T,add=T);terra::plot(cont,add=T)
terra::plot(NaH_diff_ssp126,legend = T,type="continuous", pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", range=c(0,100),col=added,axes=T, box=T,main="added percent due to NaH");terra::plot(cont,add=T)
#
terra::plot(spp370_spLossMapRelative_Original,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), colNA="white", col="grey",axes=T, box=T,main="ssp370 Relative Species Loss (%)")
terra::plot(spp370_spLossMapRelative,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), col=BlPu,axes=T,add=T);terra::plot(cont,add=T)
terra::plot(NaH_diff_ssp370,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", range=c(0,100), col=added,axes=T, box=T,main="added percent due to NaH");terra::plot(cont,add=T)
#
terra::plot(spp585_spLossMapRelative_Original,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), colNA="white", col="grey",axes=T, box=T,main="ssp585 Relative Species Loss (%)")
terra::plot(spp585_spLossMapRelative,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), col=BlPu,axes=T,add=T);terra::plot(cont,add=T)
terra::plot(NaH_diff_ssp585,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", range=c(0,100),col=added,axes=T, box=T,main="added percent due to NaH");terra::plot(cont,add=T)
dev.off()


# Relative species - loss CROPPED
pdf("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.Rel.SpLoss_cropped.pdf",height=14,width=22)
par(mfrow=c(3,2))
added = colorRampPalette((c("black","#7f0000","#b30000","#d7301f","#ef6548","#fc8d59","#fdbb84")))(100)
BlPu = colorRampPalette(c("black","darkblue","blue","purple","violet","pink"))(100)
terra::plot(spp126_spLossMapRelative_Original,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), colNA="white", col="grey",axes=T, box=T,main="ssp126 Relative Species Loss (%)")
terra::plot(spp126_spLossMapRelative,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2),  col=BlPu,axes=T,add=T);terra::plot(cont,add=T)
terra::plot(NaH_diff_ssp126_cropped,legend = T,type="continuous", pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", range=c(0,100),col=added,axes=T, box=T,main="added percent due to NaH");terra::plot(cont,add=T)
#
terra::plot(spp370_spLossMapRelative_Original,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), colNA="white", col="grey",axes=T, box=T,main="ssp370 Relative Species Loss (%)")
terra::plot(spp370_spLossMapRelative,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), col=BlPu,axes=T,add=T);terra::plot(cont,add=T)
terra::plot(NaH_diff_ssp370_cropped,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", range=c(0,100), col=added,axes=T, box=T,main="added percent due to NaH");terra::plot(cont,add=T)
#
terra::plot(spp585_spLossMapRelative_Original,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), colNA="white", col="grey",axes=T, box=T,main="ssp585 Relative Species Loss (%)")
terra::plot(spp585_spLossMapRelative,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), range=c(0,100), plg=list(cex=2), col=BlPu,axes=T,add=T);terra::plot(cont,add=T)
terra::plot(NaH_diff_ssp585_cropped,legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", range=c(0,100),col=added,axes=T, box=T,main="added percent due to NaH");terra::plot(cont,add=T)
dev.off()



# Absolute species loss
pdf("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.Abs.SpLoss.pdf",height=14,width=11)
par(mfrow=c(3,1))
abs = colorRampPalette(rev(c("black","darkred","red","orange","yellow","#abd9e9")))(100)
terra::plot(log10(ssp126_abs),legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=abs,axes=T, box=T,main="log10 ssp126 Absolute Species Loss (#)");terra::plot(cont,add=T)
terra::plot(log10(ssp370_abs),legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=abs,axes=T, box=T,main="log10 ssp370 Absolute Species Loss (#)");terra::plot(cont,add=T)
terra::plot(log10(ssp585_abs),legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=abs,axes=T, box=T,main="log10 ssp585 Absolute Species Loss (#)");terra::plot(cont,add=T)
dev.off()



# Non-Analogue Hotter Absolute species loss
pdf("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.Abs.SpLoss.NonAnalogue.pdf",height=14,width=11)
par(mfrow=c(3,1))
abs = colorRampPalette(rev(c("black","darkred","red","orange","yellow","#abd9e9")))(100)
terra::plot(log10(spp126_NonAna_spLossMapAbsolute),legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=abs,axes=T, box=T,main="ssp126 Non Analogue log10 Absolute Species Loss (#)");terra::plot(cont,add=T)
terra::plot(log10(spp370_NonAna_spLossMapAbsolute),legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=abs,axes=T, box=T,main="ssp370 Non Analogue log10 Absolute Species Loss (#)");terra::plot(cont,add=T)
terra::plot(log10(spp585_NonAna_spLossMapAbsolute),legend = T, pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=abs,axes=T, box=T,main="ssp585 Non Analogue log10 Absolute Species Loss (#)");terra::plot(cont,add=T)
dev.off()




# Non-Analogue Hotter Relative species loss
pdf("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.Rel.SpLoss.NonAnalogue.pdf",height=14,width=11)
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
### SPECIES REFUGIA
###
#######################################

colorRampPalette(
  c(#"#ffffd9",    
    "#e0ecf4",    "#bfd3e6",    "#9ebcda",    "#8c96c6",
    "#7fcdbb",    "#41b6c4",    "#1d91c0",    "#225ea8",    "#253494",
    "#8c6bb1",    "#88419d",    "#810f7c",
    "#4d004b","#081d58",   "#000000"))(100)

# main figure maps - refuge
pdf("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.Rel.SpRefuge.pdf",height=14,width=22)
par(mfrow=c(3,2))
added = colorRampPalette(c("black","#7f0000","#b30000","#d7301f","#ef6548","#fc8d59","#fdbb84"))(100)
BlPu = colorRampPalette((c("black","darkblue","#253494","#1d91c0","#41b6c4","#7fcdbb","#05f5bd")))(100)
terra::plot(spp126_spMapRelative_refuge,legend = T,  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)),plg=list(cex=2), colNA="white", col=BlPu,axes=T, box=T,main="ssp126 Refuge area for Species (%)");terra::plot(cont,add=T)
terra::plot(NaH_diff_ssp126_refuge,legend = T,  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)),plg=list(cex=2), colNA="white", range=c(-100,0),col=added,axes=T, box=T,main="lower percent due to NaH");terra::plot(cont,add=T)
#
terra::plot(spp370_spMapRelative_refuge,legend = T,  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)),plg=list(cex=2), colNA="white", col=BlPu,axes=T, box=T,main="ssp370 Refuge area for Species (%)");terra::plot(cont,add=T)
terra::plot(NaH_diff_ssp370_refuge,legend = T,  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)),plg=list(cex=2), colNA="white", range=c(-100,0), col=added,axes=T, box=T,main="lower percent due to NaH");terra::plot(cont,add=T)
#
terra::plot(spp585_spMapRelative_refuge,legend = T,  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)),plg=list(cex=2), colNA="white", col=BlPu,axes=T, box=T,main="ssp585 Refuge area for Species (%)");terra::plot(cont,add=T)
terra::plot(NaH_diff_ssp585_refuge,legend = T,  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)),plg=list(cex=2), colNA="white", range=c(-100,0),col=added,axes=T, box=T,main="lower percent due to NaH");terra::plot(cont,add=T)
dev.off()

# Non-Analogue Hotter Relative species refuge
pdf("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.Rel.SpRefuge.NonAnalogue.pdf",height=14,width=11)
par(mfrow=c(3,1))
BlPu = colorRampPalette((c("black","darkblue","#253494","#1d91c0","#41b6c4","#7fcdbb","#05f5bd")))(100)
terra::plot(NaH_spp126_spMapRelative_refuge,legend = T,  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=BlPu,axes=T, box=T,main="ssp126 Non Analogue Relative Species Refuge (%)");terra::plot(cont,add=T)
terra::plot(NaH_spp370_spMapRelative_refuge,legend = T,  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=BlPu,axes=T, box=T,main="ssp370 Non Analogue Relative Species Refuge (%)");terra::plot(cont,add=T)
terra::plot(NaH_spp585_spMapRelative_refuge,legend = T,  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=BlPu,axes=T, box=T,main="ssp585 Non Analogue Relative Species Refuge (%)");terra::plot(cont,add=T)
dev.off()







#######################################
###
### STANDARD ERROR MAPS FOR SPECIES LOSS
###
#######################################
se = colorRampPalette(rev(c("black","#969696","#78c679","#f7fcb9")))(100)
pdf("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.NonAnalogue.StandardError.pdf",height=14,width=11)
par(mfrow=c(3,1))
terra::plot((SE_spp126_NonAna_spLossMapRelative),type="continuous",legend = T, range=c(0,25), pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp126 Non Analogue Standard Error (%)");terra::plot(cont,add=T)
terra::plot((SE_spp370_NonAna_spLossMapRelative),legend = T, range=c(0,25),  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp370 Non Analogue Standard Error (%)");terra::plot(cont,add=T)
terra::plot((SE_spp585_NonAna_spLossMapRelative),legend = T, range=c(0,25),  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp585 Non Analogue Standard Error (%)");terra::plot(cont,add=T)
dev.off()

pdf("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.StandardError.pdf",height=14,width=11)
par(mfrow=c(3,1))
terra::plot((SE_spp126_spLossMapRelative),legend = T, range=c(0,25),  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp126 Standard Error (%)");terra::plot(cont,add=T)
terra::plot((SE_spp370_spLossMapRelative),legend = T, range=c(0,25),  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp370 Standard Error (%)");terra::plot(cont,add=T)
terra::plot((SE_spp585_spLossMapRelative),legend = T, range=c(0,25),  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp585 Standard Error (%)");terra::plot(cont,add=T)
dev.off()

pdf("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.NonAnalogue.StandardError_difference.pdf",height=14,width=11)
par(mfrow=c(3,1))
terra::plot((SE_diff_spp126_NonAna_spLossMapRelative),type="continuous",legend = T, range=c(0,25),  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp126 Standard Error (%)");terra::plot(cont,add=T)
terra::plot((SE_diff_spp370_NonAna_spLossMapRelative),legend = T, range=c(0,25),  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp370 Standard Error (%)");terra::plot(cont,add=T)
terra::plot((SE_diff_spp585_NonAna_spLossMapRelative),legend = T, range=c(0,25),  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp585 Standard Error (%)");terra::plot(cont,add=T)
dev.off()

pdf("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.NonAnalogue.StandardError_difference_cropped.pdf",height=14,width=11)
par(mfrow=c(3,1))
terra::plot((SE_diff_spp126_NonAna_spLossMapRelative_cropped),type="continuous",legend = T, range=c(0,25),  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp126 Standard Error (%)");terra::plot(cont,add=T)
terra::plot((SE_diff_spp370_NonAna_spLossMapRelative_cropped),legend = T, range=c(0,25),  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp370 Standard Error (%)");terra::plot(cont,add=T)
terra::plot((SE_diff_spp585_NonAna_spLossMapRelative_cropped),legend = T, range=c(0,25),  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp585 Standard Error (%)");terra::plot(cont,add=T)
dev.off()




CI_spp126_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp126_spLossMapRelative.tif"))
CI_spp370_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp370_spLossMapRelative.tif"))
CI_spp585_spLossMapRelative = terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp585_spLossMapRelative.tif"))
CI_diff_spp126_NonAna_spLossMapRelative_cropped= terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp126_diff_NonAna_spLossMapRelative_cropped.tif"))
CI_diff_spp370_NonAna_spLossMapRelative_cropped= terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp370_diff_NonAna_spLossMapRelative_cropped.tif"))
CI_diff_spp585_NonAna_spLossMapRelative_cropped= terra::rast(paste0(OutputDir,"ProcessedMaps/CI_spp585_diff_NonAna_spLossMapRelative_cropped.tif"))



pdf("ClimateRefugia.paper/Figures/Maps.CI95.pdf",height=14,width=11)
par(mfrow=c(3,1))
terra::plot((CI_spp126_spLossMapRelative),legend = T, range=c(0,50),  pax=list(side=c(1:2), tick=1:2, lab=1:2, retro=TRUE, at = c(-100,-60,-50,-30,0,30,50,60,100,150)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp126 CI95");terra::plot(cont,add=T)
terra::plot((CI_spp370_spLossMapRelative),legend = T, range=c(0,50),  pax=list(side=c(1:2), tick=1:2, lab=1:2, retro=TRUE, at = c(-100,-60,-50,-30,0,30,50,60,100,150)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp370 CI95");terra::plot(cont,add=T)
terra::plot((CI_spp585_spLossMapRelative),legend = T, range=c(0,50),  pax=list(side=c(1:2), tick=1:2, lab=1:2, retro=TRUE, at = c(-100,-60,-50,-30,0,30,50,60,100,150)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp585 CI95");terra::plot(cont,add=T)
dev.off()

pdf("ClimateRefugia.paper/Figures/Maps.NonAnalogue.CI95_difference_cropped.pdf",height=14,width=11)
par(mfrow=c(3,1))
terra::plot((CI_diff_spp126_NonAna_spLossMapRelative_cropped),type="continuous",legend = T, range=c(0,50),  pax=list(side=c(1,2), tick=1:2, lab=1:2, retro=TRUE, at = c(-100,-60,-50,-30,0,30,50,60,100,150)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp126 CI95");terra::plot(cont,add=T)
terra::plot((CI_diff_spp370_NonAna_spLossMapRelative_cropped),                  legend = T, range=c(0,50),  pax=list(side=c(1,2), tick=1:2, lab=1:2, retro=TRUE, at = c(-100,-60,-50,-30,0,30,50,60,100,150)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp370 CI95");terra::plot(cont,add=T)
terra::plot((CI_diff_spp585_NonAna_spLossMapRelative_cropped),                  legend = T, range=c(0,50),  pax=list(side=c(1,2), tick=1:2, lab=1:2, retro=TRUE, at = c(-100,-60,-50,-30,0,30,50,60,100,150)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp585 CI95");terra::plot(cont,add=T)
dev.off()



pdf("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.NonAnalogue.CI95.pdf",height=14,width=11)
par(mfrow=c(3,1))
terra::plot((CI_spp126_NonAna_spLossMapRelative),legend = T, range=c(0,50), pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp126 CI95");terra::plot(cont,add=T)
terra::plot((CI_spp370_NonAna_spLossMapRelative),legend = T, range=c(0,50), pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp370 CI95");terra::plot(cont,add=T)
terra::plot((CI_spp585_NonAna_spLossMapRelative),legend = T, range=c(0,50), pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp585 CI95");terra::plot(cont,add=T)
dev.off()

pdf("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.NonAnalogue.CI95_difference.pdf",height=14,width=11)
par(mfrow=c(3,1))
terra::plot((CI_diff_spp126_NonAna_spLossMapRelative),type="continuous",legend = T, range=c(0,50),  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp126 CI95");terra::plot(cont,add=T)
terra::plot((CI_diff_spp370_NonAna_spLossMapRelative),legend = T, range=c(0,50),  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp370 CI95");terra::plot(cont,add=T)
terra::plot((CI_diff_spp585_NonAna_spLossMapRelative),legend = T, range=c(0,50),  pax=list(side=0, tick=2, lab=2, retro=TRUE, at = c(-60,-30,0,30,60)), plg=list(cex=2), colNA="white", col=se,axes=T, box=T,main="ssp585 CI95");terra::plot(cont,add=T)
dev.off()









#######################################
###
### HOTSPOT MAPS
###
#######################################

# create map with areas that see more than 75 or 85% of species loss under the difference scenarios
pdf("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.Hotspots.loss75.pdf",height=10,width=11)
par(mfrow=c(1,1))
terra::plot(loss3 ,legend = F, col="grey60",axes=FALSE, box=T,main="Hotspots Species Loss (>75%)")
terra::plot(loss2,legend = F, col="grey70",axes=FALSE,add=T)
terra::plot(loss1,legend = F, col="grey80",axes=FALSE,add=T)
terra::plot(loss3c,legend = F, col=c("red","black"),axes=FALSE,add=T)
terra::plot(loss2c,legend = F, col=c("orange","blue"),axes=FALSE,add=T)
terra::plot(loss1c,legend = F, col=c("yellow","violet"),axes=FALSE,add=T)
terra::plot(cont,add=T)
dev.off()
#
pdf("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.Hotspots.loss85.pdf",height=10,width=11)
par(mfrow=c(1,1))
terra::plot(loss3 ,legend = F, col="grey60",axes=FALSE, box=T,main="Hotspots Species Loss (>85%)")
terra::plot(loss2,legend = F, col="grey70",axes=FALSE,add=T)
terra::plot(loss1,legend = F, col="grey80",axes=FALSE,add=T)
terra::plot(loss3c,legend = F, col=c("red","black"),axes=FALSE,add=T)
terra::plot(loss2c,legend = F, col=c("orange","blue"),axes=FALSE,add=T)
terra::plot(loss1c,legend = F, col=c("yellow","violet"),axes=FALSE,add=T)
terra::plot(cont,add=T)
dev.off()



# create map with areas that see less than 15% of species loss under the difference scenarios
pdf("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/ClimateRefugia.paper/Figures/Maps.Hotspots.refugia.pdf",height=10,width=11)
par(mfrow=c(2,1))
terra::plot(refugia_1,legend = F, col="grey80", axes=FALSE, box=T,main="Hotspots Climate Refugia (<15% species loss)")
terra::plot(refugia_bin1,legend = F, col="#05f5bd",axes=FALSE,add=T)
terra::plot(refugia_bin2,legend = F, col="#41b6c4",axes=FALSE,add=T)
terra::plot(refugia_bin3,legend = F, col="black",axes=FALSE,add=T)
terra::plot(cont,add=T)
#
terra::plot(refugia_1NaH,legend = F, col="grey80", axes=FALSE, box=T,main="Non Analogue - Hotspots Climate Refugia (<15% species loss)")
terra::plot(refugia_bin1NaH,legend = F, col="#05f5bd",axes=FALSE,add=T)
terra::plot(refugia_bin2NaH,legend = F, col="#41b6c4",axes=FALSE,add=T)
terra::plot(refugia_bin3NaH,legend = F, col="black",axes=FALSE,add=T)
terra::plot(cont,add=T)
dev.off()



#######################################
###
### MAP SUPPL INFO
###
#######################################
poly = sf::read_sf("ClimateRefugia.paper/Input/Global.polygon.shp")
poly$idx=1:nrow(poly)

df = read.table(paste0(OutputDir,"ClimateRefugia.txt"),sep=",",dec=".",header=T,check.names = F)
sp=df[df$stable_climate_percent_ssp126<50,"species"]

raster::plot(cont)
for(i in sp){
  print(i)
  plot(poly[poly$id == i,],border="red",col=NA,lwd=1,add=T)
}
