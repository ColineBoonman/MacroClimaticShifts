rm(list = ls())

#-------- directories and data
setwd("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/")
InputDir  = "ClimateRefugia.paper/Output/FilesReceivedSelwyn/ShareRasters_2023_10_02/"
InputDir2  = "ClimateRefugia.paper/Output/FilesReceivedSelwyn/SpeciesClimateLossMeanSE/"
OutputDir = "ClimateRefugia.paper/Output/"
FigureDir = "ClimateRefugia.paper/Figures/"

#-------- Global maps
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



# create species raster mask - 1 where no species occur
sp.r = terra::ifel(sp.richness == 0,NA,1)
terra::plot(sp.r)

# loss to refuge map
spp126_spMapRelative_refuge = 100-spp126_spLossMapRelative
spp370_spMapRelative_refuge = 100-spp370_spLossMapRelative
spp585_spMapRelative_refuge = 100-spp585_spLossMapRelative
NaH_spp126_spMapRelative_refuge = 100-spp126_NonAna_spLossMapRelative
NaH_spp370_spMapRelative_refuge = 100-spp370_NonAna_spLossMapRelative
NaH_spp585_spMapRelative_refuge = 100-spp585_NonAna_spLossMapRelative

# where no species occur, should be NA
spp126_spLossMapRelative = sp.r * spp126_spLossMapRelative
spp370_spLossMapRelative = sp.r * spp370_spLossMapRelative
spp585_spLossMapRelative = sp.r * spp585_spLossMapRelative
spp126_NonAna_spLossMapRelative = sp.r * spp126_NonAna_spLossMapRelative
spp370_NonAna_spLossMapRelative = sp.r * spp370_NonAna_spLossMapRelative
spp585_NonAna_spLossMapRelative = sp.r * spp585_NonAna_spLossMapRelative
#
spp126_spMapRelative_refuge = sp.r * spp126_spMapRelative_refuge
spp370_spMapRelative_refuge = sp.r * spp370_spMapRelative_refuge
spp585_spMapRelative_refuge = sp.r * spp585_spMapRelative_refuge
NaH_spp126_spMapRelative_refuge = sp.r * NaH_spp126_spMapRelative_refuge
NaH_spp370_spMapRelative_refuge = sp.r * NaH_spp370_spMapRelative_refuge
NaH_spp585_spMapRelative_refuge = sp.r * NaH_spp585_spMapRelative_refuge
#
SE_spp126_spLossMapRelative = sp.r * SE_spp126_spLossMapRelative
SE_spp370_spLossMapRelative = sp.r * SE_spp370_spLossMapRelative
SE_spp585_spLossMapRelative = sp.r * SE_spp585_spLossMapRelative
SE_spp126_NonAna_spLossMapRelative = sp.r * SE_spp126_NonAna_spLossMapRelative
SE_spp370_NonAna_spLossMapRelative = sp.r * SE_spp370_NonAna_spLossMapRelative
SE_spp585_NonAna_spLossMapRelative = sp.r * SE_spp585_NonAna_spLossMapRelative
#
spp126_spLossMapRelative_Original = spp126_spLossMapRelative
spp370_spLossMapRelative_Original = spp370_spLossMapRelative
spp585_spLossMapRelative_Original = spp585_spLossMapRelative
spp126_NonAna_spLossMapRelative_Original = spp126_NonAna_spLossMapRelative
spp370_NonAna_spLossMapRelative_Original = spp370_NonAna_spLossMapRelative
spp585_NonAna_spLossMapRelative_Original = spp585_NonAna_spLossMapRelative









# species loss 0 as NA
spp126_spLossMapRelative = terra::ifel(spp126_spLossMapRelative==0,NA,spp126_spLossMapRelative)
spp370_spLossMapRelative = terra::ifel(spp370_spLossMapRelative==0,NA,spp370_spLossMapRelative)
spp585_spLossMapRelative = terra::ifel(spp585_spLossMapRelative==0,NA,spp585_spLossMapRelative)
spp126_NonAna_spLossMapRelative = terra::ifel(spp126_NonAna_spLossMapRelative==0,NA,spp126_NonAna_spLossMapRelative)
spp370_NonAna_spLossMapRelative = terra::ifel(spp370_NonAna_spLossMapRelative==0,NA,spp370_NonAna_spLossMapRelative)
spp585_NonAna_spLossMapRelative = terra::ifel(spp585_NonAna_spLossMapRelative==0,NA,spp585_NonAna_spLossMapRelative)

# create maps that show difference between climate zones maps and predictions with Non-Analogue Hotter climate zone
NaH_diff_ssp126 = spp126_NonAna_spLossMapRelative - spp126_spLossMapRelative_Original
NaH_diff_ssp126 = terra::ifel(NaH_diff_ssp126==0,NA,NaH_diff_ssp126)
NaH_diff_ssp370 = spp370_NonAna_spLossMapRelative - spp370_spLossMapRelative_Original
NaH_diff_ssp370 = terra::ifel(NaH_diff_ssp370==0,NA,NaH_diff_ssp370)
NaH_diff_ssp585 = spp585_NonAna_spLossMapRelative - spp585_spLossMapRelative_Original
NaH_diff_ssp585 = terra::ifel(NaH_diff_ssp585==0,NA,NaH_diff_ssp585)

# NaH_diff_ssp126_refuge = NaH_spp126_spMapRelative_refuge - spp126_spMapRelative_refuge
# NaH_diff_ssp370_refuge = NaH_spp370_spMapRelative_refuge - spp370_spMapRelative_refuge
# NaH_diff_ssp585_refuge = NaH_spp585_spMapRelative_refuge - spp585_spMapRelative_refuge
# NaH_diff_ssp126_refuge = terra::ifel(NaH_diff_ssp126_refuge==0,NA,NaH_diff_ssp126_refuge)
# NaH_diff_ssp370_refuge = terra::ifel(NaH_diff_ssp370_refuge==0,NA,NaH_diff_ssp370_refuge)
# NaH_diff_ssp585_refuge = terra::ifel(NaH_diff_ssp585_refuge==0,NA,NaH_diff_ssp585_refuge)

# create uncertainty maps
NaH_diff_ssp126_bin = NaH_diff_ssp126
NaH_diff_ssp370_bin = NaH_diff_ssp370
NaH_diff_ssp585_bin = NaH_diff_ssp585
NaH_diff_ssp126_bin[NaH_diff_ssp126_bin>0] = 1
NaH_diff_ssp370_bin[NaH_diff_ssp370_bin>0] = 1
NaH_diff_ssp585_bin[NaH_diff_ssp585_bin>0] = 1
SE_diff_spp126_NonAna_spLossMapRelative = SE_spp126_NonAna_spLossMapRelative * NaH_diff_ssp126_bin
SE_diff_spp370_NonAna_spLossMapRelative = SE_spp370_NonAna_spLossMapRelative * NaH_diff_ssp370_bin
SE_diff_spp585_NonAna_spLossMapRelative = SE_spp585_NonAna_spLossMapRelative * NaH_diff_ssp585_bin

# create 95% confidance interval maps CI = mean +/- margin of error, ME = 1.96 * sd / sqrt(n) where n is 5 (the five GCMs)
CI_spp126_spLossMapRelative = 1.96 * SE_spp126_spLossMapRelative
CI_spp370_spLossMapRelative = 1.96 * SE_spp370_spLossMapRelative
CI_spp585_spLossMapRelative = 1.96 * SE_spp585_spLossMapRelative
CI_spp126_NonAna_spLossMapRelative = 1.96 * SE_spp126_NonAna_spLossMapRelative
CI_spp370_NonAna_spLossMapRelative = 1.96 * SE_spp370_NonAna_spLossMapRelative
CI_spp585_NonAna_spLossMapRelative = 1.96 * SE_spp585_NonAna_spLossMapRelative
CI_diff_spp126_NonAna_spLossMapRelative = 1.96 * SE_diff_spp126_NonAna_spLossMapRelative
CI_diff_spp370_NonAna_spLossMapRelative = 1.96 * SE_diff_spp370_NonAna_spLossMapRelative
CI_diff_spp585_NonAna_spLossMapRelative = 1.96 * SE_diff_spp585_NonAna_spLossMapRelative

# absolute species loss
ssp126_abs = sp.richness * spp126_spLossMapRelative_Original / 100
ssp370_abs = sp.richness * spp370_spLossMapRelative_Original / 100
ssp585_abs = sp.richness * spp585_spLossMapRelative_Original / 100
spp126_NonAna_spLossMapAbsolute = sp.richness * spp126_NonAna_spLossMapRelative /100
spp370_NonAna_spLossMapAbsolute = sp.richness * spp370_NonAna_spLossMapRelative /100
spp585_NonAna_spLossMapAbsolute = sp.richness * spp585_NonAna_spLossMapRelative /100

# hotspots 85 species loss
loss1_85 = terra::ifel(spp126_spLossMapRelative<85,0,100)
loss1nah_85 =terra::ifel(spp126_NonAna_spLossMapRelative<85,0,100)
loss2_85 = terra::ifel(spp370_spLossMapRelative<85,0,100)
loss2nah_85 = terra::ifel(spp370_NonAna_spLossMapRelative<85,0,100)
loss3_85 = terra::ifel(spp585_spLossMapRelative<85,0,100)
loss3nah_85 = terra::ifel(spp585_NonAna_spLossMapRelative<85,0,100)
loss1c_85 = loss1_85+loss1nah_85
loss2c_85 = loss2_85+loss2nah_85
loss3c_85 = loss3_85+loss3nah_85
loss1c_85 = terra::ifel(loss1c_85==0,NA,loss1c_85)
loss2c_85 = terra::ifel(loss2c_85==0,NA,loss2c_85)
loss3c_85 = terra::ifel(loss3c_85==0,NA,loss3c_85)

# hotspots 75 species loss
loss1_75 = terra::ifel(spp126_spLossMapRelative<75,0,100)
loss1nah_75 =terra::ifel(spp126_NonAna_spLossMapRelative<75,0,100)
loss2_75 = terra::ifel(spp370_spLossMapRelative<75,0,100)
loss2nah_75 = terra::ifel(spp370_NonAna_spLossMapRelative<75,0,100)
loss3_75 = terra::ifel(spp585_spLossMapRelative<75,0,100)
loss3nah_75 = terra::ifel(spp585_NonAna_spLossMapRelative<75,0,100)
loss1c_75 = loss1_75+loss1nah_75
loss2c_75 = loss2_75+loss2nah_75
loss3c_75 = loss3_75+loss3nah_75
loss1c_75 = terra::ifel(loss1c_75==0,NA,loss1c_75)
loss2c_75 = terra::ifel(loss2c_75==0,NA,loss2c_75)
loss3c_75 = terra::ifel(loss3c_75==0,NA,loss3c_75)

# # refugia 15 keep species
# refugia_bin1 = terra::ifel(spp126_spLossMapRelative_Original>15,NA,1)
# refugia_bin2 = terra::ifel(spp370_spLossMapRelative_Original>15,NA,2)
# refugia_bin3 = terra::ifel(spp585_spLossMapRelative_Original>15,NA,3)
# refugia_bin1NaH = terra::ifel(spp126_NonAna_spLossMapRelative_Original>15,NA,1)
# refugia_bin2NaH = terra::ifel(spp370_NonAna_spLossMapRelative_Original>15,NA,2)
# refugia_bin3NaH = terra::ifel(spp585_NonAna_spLossMapRelative_Original>15,NA,3)
# #
# refugia_1 = terra::ifel(spp126_spLossMapRelative_Original>15,0,1)
# refugia_2 = terra::ifel(spp370_spLossMapRelative_Original>15,0,2)
# refugia_3 = terra::ifel(spp585_spLossMapRelative_Original>15,0,3)
# refugia_1NaH = terra::ifel(spp126_NonAna_spLossMapRelative_Original>15,0,1)
# refugia_2NaH = terra::ifel(spp370_NonAna_spLossMapRelative_Original>15,0,2)
# refugia_3NaH = terra::ifel(spp585_NonAna_spLossMapRelative_Original>15,0,3)




# --------- crop maps to reduce area south pole
crop_maps = function(x) terra::crop(x, terra::ext(c(-180.0001, 179.9999, -60, 83.99986)), snap="near")

sp.r = crop_maps(sp.r)
spp126_spLossMapRelative_Original = crop_maps(spp126_spLossMapRelative_Original)
spp126_spLossMapRelative = crop_maps(spp126_spLossMapRelative)
NaH_diff_ssp126 = crop_maps(NaH_diff_ssp126)
ssp126_abs = crop_maps(ssp126_abs)
SE_spp126_NonAna_spLossMapRelative = crop_maps(SE_spp126_NonAna_spLossMapRelative)
SE_spp126_spLossMapRelative = crop_maps(SE_spp126_spLossMapRelative)
SE_diff_spp126_NonAna_spLossMapRelative = crop_maps(SE_diff_spp126_NonAna_spLossMapRelative)
CI_spp126_spLossMapRelative = crop_maps(CI_spp126_spLossMapRelative)
CI_spp126_NonAna_spLossMapRelative = crop_maps(CI_spp126_NonAna_spLossMapRelative)
CI_diff_spp126_NonAna_spLossMapRelative = crop_maps(CI_diff_spp126_NonAna_spLossMapRelative)
spp126_NonAna_spLossMapRelative_Original = crop_maps(spp126_NonAna_spLossMapRelative_Original)
spp126_NonAna_spLossMapRelative = crop_maps(spp126_NonAna_spLossMapRelative)
spp126_NonAna_spLossMapAbsolute = crop_maps(spp126_NonAna_spLossMapAbsolute)
spp126_spMapRelative_refuge = crop_maps(spp126_spMapRelative_refuge)
NaH_diff_ssp126_refuge = crop_maps(NaH_diff_ssp126_refuge)
NaH_spp126_spMapRelative_refuge = crop_maps(NaH_spp126_spMapRelative_refuge)
loss1c_75 = crop_maps(loss1c_75)
loss1_75 = crop_maps(loss1_75)
loss1nah_75 = crop_maps(loss1nah_75)
loss1c_85 = crop_maps(loss1c_85)
loss1_85 = crop_maps(loss1_85)
loss1nah_85 = crop_maps(loss1nah_85)
refugia_bin1 = crop_maps(refugia_bin1)
#
spp370_spLossMapRelative_Original = crop_maps(spp370_spLossMapRelative_Original)
spp370_spLossMapRelative = crop_maps(spp370_spLossMapRelative)
NaH_diff_ssp370 = crop_maps(NaH_diff_ssp370)
ssp370_abs = crop_maps(ssp370_abs)
SE_spp370_NonAna_spLossMapRelative = crop_maps(SE_spp370_NonAna_spLossMapRelative)
SE_spp370_spLossMapRelative = crop_maps(SE_spp370_spLossMapRelative)
SE_diff_spp370_NonAna_spLossMapRelative = crop_maps(SE_diff_spp370_NonAna_spLossMapRelative)
CI_spp370_spLossMapRelative = crop_maps(CI_spp370_spLossMapRelative)
CI_spp370_NonAna_spLossMapRelative = crop_maps(CI_spp370_NonAna_spLossMapRelative)
CI_diff_spp370_NonAna_spLossMapRelative = crop_maps(CI_diff_spp370_NonAna_spLossMapRelative)
spp370_NonAna_spLossMapRelative_Original = crop_maps(spp370_NonAna_spLossMapRelative_Original)
spp370_NonAna_spLossMapRelative = crop_maps(spp370_NonAna_spLossMapRelative)
spp370_NonAna_spLossMapAbsolute = crop_maps(spp370_NonAna_spLossMapAbsolute)
spp370_spMapRelative_refuge = crop_maps(spp370_spMapRelative_refuge)
NaH_diff_ssp370_refuge = crop_maps(NaH_diff_ssp370_refuge)
NaH_spp370_spMapRelative_refuge = crop_maps(NaH_spp370_spMapRelative_refuge)
loss2c_75 = crop_maps(loss2c_75)
loss2_75 = crop_maps(loss2_75)
loss2nah_75 = crop_maps(loss2nah_75)
loss2c_85 = crop_maps(loss2c_85)
loss2_85 = crop_maps(loss2_85)
loss2nah_85 = crop_maps(loss2nah_85)
#
spp585_spLossMapRelative_Original = crop_maps(spp585_spLossMapRelative_Original)
spp585_spLossMapRelative = crop_maps(spp585_spLossMapRelative)
NaH_diff_ssp585 = crop_maps(NaH_diff_ssp585)
ssp585_abs = crop_maps(ssp585_abs)
SE_spp585_NonAna_spLossMapRelative = crop_maps(SE_spp585_NonAna_spLossMapRelative)
SE_spp585_spLossMapRelative = crop_maps(SE_spp585_spLossMapRelative)
SE_diff_spp585_NonAna_spLossMapRelative = crop_maps(SE_diff_spp585_NonAna_spLossMapRelative)
CI_spp585_spLossMapRelative = crop_maps(CI_spp585_spLossMapRelative)
CI_spp585_NonAna_spLossMapRelative = crop_maps(CI_spp585_NonAna_spLossMapRelative)
CI_diff_spp585_NonAna_spLossMapRelative = crop_maps(CI_diff_spp585_NonAna_spLossMapRelative)
spp585_NonAna_spLossMapRelative_Original = crop_maps(spp585_NonAna_spLossMapRelative_Original)
spp585_NonAna_spLossMapRelative = crop_maps(spp585_NonAna_spLossMapRelative)
spp585_NonAna_spLossMapAbsolute = crop_maps(spp585_NonAna_spLossMapAbsolute)
spp585_spMapRelative_refuge = crop_maps(spp585_spMapRelative_refuge)
NaH_diff_ssp585_refuge = crop_maps(NaH_diff_ssp585_refuge)
NaH_spp585_spMapRelative_refuge = crop_maps(NaH_spp585_spMapRelative_refuge)
loss3c_75 = crop_maps(loss3c_75)
loss3_75 = crop_maps(loss3_75)
loss3nah_75 = crop_maps(loss3nah_75)
loss3c_85 = crop_maps(loss3c_85)
loss3_85 = crop_maps(loss3_85)
loss3nah_85 = crop_maps(loss3nah_85)



# --------- crop maps to reduce area south pole
crop_maps_diff = function(x) terra::crop(x, terra::ext(c(-110, 154, -35, 35)), snap="near")
#
B_NaH_diff_ssp126 = crop_maps_diff(NaH_diff_ssp126)
B_SE_diff_spp126_NonAna_spLossMapRelative = crop_maps_diff(SE_diff_spp126_NonAna_spLossMapRelative)
B_CI_diff_spp126_NonAna_spLossMapRelative = crop_maps_diff(CI_diff_spp126_NonAna_spLossMapRelative)
B_NaH_diff_ssp370 = crop_maps_diff(NaH_diff_ssp370)
B_SE_diff_spp370_NonAna_spLossMapRelative = crop_maps_diff(SE_diff_spp370_NonAna_spLossMapRelative)
B_CI_diff_spp370_NonAna_spLossMapRelative = crop_maps_diff(CI_diff_spp370_NonAna_spLossMapRelative)
B_NaH_diff_ssp585 = crop_maps_diff(NaH_diff_ssp585)
B_SE_diff_spp585_NonAna_spLossMapRelative = crop_maps_diff(SE_diff_spp585_NonAna_spLossMapRelative)
B_CI_diff_spp585_NonAna_spLossMapRelative = crop_maps_diff(CI_diff_spp585_NonAna_spLossMapRelative)


#  ---------  save all maps
terra::writeRaster(sp.r, filename=paste0(OutputDir,"ProcessedMaps/SpeciesRichness_withNAinsteadof0.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT1U')
terra::writeRaster(spp126_spLossMapRelative_Original, filename=paste0(OutputDir,"ProcessedMaps/spp126_spLossMapRelative_Original.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(spp126_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/spp126_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(NaH_diff_ssp126, filename=paste0(OutputDir,"ProcessedMaps/NaH_ssp126_spLossRelative_difference.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(ssp126_abs, filename=paste0(OutputDir,"ProcessedMaps/ssp126_absoluteSpLoss.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(SE_spp126_NonAna_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/SE_spp126_NonAna_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT2U')
terra::writeRaster(SE_spp126_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/SE_spp126_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT2U')
terra::writeRaster(SE_diff_spp126_NonAna_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/SE_spp126_diff_NonAna_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT2U')
terra::writeRaster(CI_spp126_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/CI_spp126_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT2U')
terra::writeRaster(CI_spp126_NonAna_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/CI_spp126_NonAna_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT2U')
terra::writeRaster(CI_diff_spp126_NonAna_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/CI_spp126_diff_NonAna_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT2U')
terra::writeRaster(spp126_NonAna_spLossMapRelative_Original, filename=paste0(OutputDir,"ProcessedMaps/spp126_NonAna_spLossMapRelative_Original.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(spp126_NonAna_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/spp126_NonAna_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(spp126_NonAna_spLossMapAbsolute, filename=paste0(OutputDir,"ProcessedMaps/spp126_NonAna_spLossMapAbsolute.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(spp126_spMapRelative_refuge, filename=paste0(OutputDir,"ProcessedMaps/spp126_spMapRelative_refuge.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(NaH_diff_ssp126_refuge, filename=paste0(OutputDir,"ProcessedMaps/NaH_diff_ssp126_refuge.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4S')
terra::writeRaster(NaH_spp126_spMapRelative_refuge, filename=paste0(OutputDir,"ProcessedMaps/NaH_spp126_spMapRelative_refuge.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(loss1c_75, filename=paste0(OutputDir,"ProcessedMaps/Hotspot126_loss1c_75.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(loss1_75, filename=paste0(OutputDir,"ProcessedMaps/Hotspot126_loss1_75.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(loss1nah_75, filename=paste0(OutputDir,"ProcessedMaps/Hotspot126_loss1nah_75.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(loss1c_85, filename=paste0(OutputDir,"ProcessedMaps/Hotspot126_loss1c_85.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(loss1_85, filename=paste0(OutputDir,"ProcessedMaps/Hotspot126_loss1_85.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(loss1nah_85, filename=paste0(OutputDir,"ProcessedMaps/Hotspot126_loss1nah_85.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
# terra::writeRaster(refugia_bin1, filename=paste0(OutputDir,"ProcessedMaps/HotspotRefugia126_refugia_bin1.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
# terra::writeRaster(refugia_bin1NaH, filename=paste0(OutputDir,"ProcessedMaps/HotspotRefugia126_refugia_bin1NaH.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
# terra::writeRaster(refugia_1, filename=paste0(OutputDir,"ProcessedMaps/HotspotRefugia126_refugia_1.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
# terra::writeRaster(refugia_1NaH, filename=paste0(OutputDir,"ProcessedMaps/HotspotRefugia126_refugia_1NaH.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')

terra::writeRaster(spp370_spLossMapRelative_Original, filename=paste0(OutputDir,"ProcessedMaps/spp370_spLossMapRelative_Original.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(spp370_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/spp370_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(NaH_diff_ssp370, filename=paste0(OutputDir,"ProcessedMaps/NaH_ssp370_spLossRelative_difference.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(ssp370_abs, filename=paste0(OutputDir,"ProcessedMaps/ssp370_absoluteSpLoss.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(SE_spp370_NonAna_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/SE_spp370_NonAna_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT2U')
terra::writeRaster(SE_spp370_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/SE_spp370_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT2U')
terra::writeRaster(SE_diff_spp370_NonAna_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/SE_spp370_diff_NonAna_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT2U')
terra::writeRaster(CI_spp370_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/CI_spp370_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT2U')
terra::writeRaster(CI_spp370_NonAna_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/CI_spp370_NonAna_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT2U')
terra::writeRaster(CI_diff_spp370_NonAna_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/CI_spp370_diff_NonAna_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT2U')
terra::writeRaster(spp370_NonAna_spLossMapRelative_Original, filename=paste0(OutputDir,"ProcessedMaps/spp370_NonAna_spLossMapRelative_Original.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(spp370_NonAna_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/spp370_NonAna_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(spp370_NonAna_spLossMapAbsolute, filename=paste0(OutputDir,"ProcessedMaps/spp370_NonAna_spLossMapAbsolute.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(spp370_spMapRelative_refuge, filename=paste0(OutputDir,"ProcessedMaps/spp370_spMapRelative_refuge.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(NaH_diff_ssp370_refuge, filename=paste0(OutputDir,"ProcessedMaps/NaH_diff_ssp370_refuge.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4S')
terra::writeRaster(NaH_spp370_spMapRelative_refuge, filename=paste0(OutputDir,"ProcessedMaps/NaH_spp370_spMapRelative_refuge.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(loss2c_75, filename=paste0(OutputDir,"ProcessedMaps/Hotspot370_loss2c_75.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(loss2_75, filename=paste0(OutputDir,"ProcessedMaps/Hotspot370_loss2_75.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(loss2nah_75, filename=paste0(OutputDir,"ProcessedMaps/Hotspot370_loss2nah_75.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(loss2c_85, filename=paste0(OutputDir,"ProcessedMaps/Hotspot370_loss2c_85.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(loss2_85, filename=paste0(OutputDir,"ProcessedMaps/Hotspot370_loss2_85.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(loss2nah_85, filename=paste0(OutputDir,"ProcessedMaps/Hotspot370_loss2nah_85.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
# terra::writeRaster(refugia_bin2NaH, filename=paste0(OutputDir,"ProcessedMaps/HotspotRefugia370_refugia_bin2NaH.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
# terra::writeRaster(refugia_bin2, filename=paste0(OutputDir,"ProcessedMaps/HotspotRefugia370_refugia_bin2.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
# terra::writeRaster(refugia_2, filename=paste0(OutputDir,"ProcessedMaps/HotspotRefugia370_refugia_2.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
# terra::writeRaster(refugia_2NaH, filename=paste0(OutputDir,"ProcessedMaps/HotspotRefugia370_refugia_2NaH.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')

terra::writeRaster(spp585_spLossMapRelative_Original, filename=paste0(OutputDir,"ProcessedMaps/spp585_spLossMapRelative_Original.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(spp585_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/spp585_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(NaH_diff_ssp585, filename=paste0(OutputDir,"ProcessedMaps/NaH_ssp585_spLossRelative_difference.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(ssp585_abs, filename=paste0(OutputDir,"ProcessedMaps/ssp585_absoluteSpLoss.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(SE_spp585_NonAna_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/SE_spp585_NonAna_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT2U')
terra::writeRaster(SE_spp585_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/SE_spp585_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT2U')
terra::writeRaster(SE_diff_spp585_NonAna_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/SE_spp585_diff_NonAna_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT2U')
terra::writeRaster(CI_spp585_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/CI_spp585_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT2U')
terra::writeRaster(CI_spp585_NonAna_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/CI_spp585_NonAna_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT2U')
terra::writeRaster(CI_diff_spp585_NonAna_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/CI_spp585_diff_NonAna_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT2U')
terra::writeRaster(spp585_NonAna_spLossMapRelative_Original, filename=paste0(OutputDir,"ProcessedMaps/spp585_NonAna_spLossMapRelative_Original.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(spp585_NonAna_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/spp585_NonAna_spLossMapRelative.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(spp585_NonAna_spLossMapAbsolute, filename=paste0(OutputDir,"ProcessedMaps/spp585_NonAna_spLossMapAbsolute.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(spp585_spMapRelative_refuge, filename=paste0(OutputDir,"ProcessedMaps/spp585_spMapRelative_refuge.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(NaH_diff_ssp585_refuge, filename=paste0(OutputDir,"ProcessedMaps/NaH_diff_ssp585_refuge.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4S')
terra::writeRaster(NaH_spp585_spMapRelative_refuge, filename=paste0(OutputDir,"ProcessedMaps/NaH_spp585_spMapRelative_refuge.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(loss3c_75, filename=paste0(OutputDir,"ProcessedMaps/Hotspot585_loss3c_75.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(loss3_75, filename=paste0(OutputDir,"ProcessedMaps/Hotspot585_loss3_75.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(loss3nah_75, filename=paste0(OutputDir,"ProcessedMaps/Hotspot585_loss3nah_75.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(loss3c_85, filename=paste0(OutputDir,"ProcessedMaps/Hotspot585_loss3c_85.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(loss3_85, filename=paste0(OutputDir,"ProcessedMaps/Hotspot585_loss3_85.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(loss3nah_85, filename=paste0(OutputDir,"ProcessedMaps/Hotspot585_loss3nah_85.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
# terra::writeRaster(refugia_bin3NaH, filename=paste0(OutputDir,"ProcessedMaps/HotspotRefugia585_refugia_bin3NaH.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
# terra::writeRaster(refugia_bin3, filename=paste0(OutputDir,"ProcessedMaps/HotspotRefugia585_refugia_bin3.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
# terra::writeRaster(refugia_3, filename=paste0(OutputDir,"ProcessedMaps/HotspotRefugia585_refugia_3.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
# terra::writeRaster(refugia_3NaH, filename=paste0(OutputDir,"ProcessedMaps/HotspotRefugia585_refugia_3NaH.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')



terra::writeRaster(B_NaH_diff_ssp126, filename=paste0(OutputDir,"ProcessedMaps/NaH_ssp126_spLossRelative_difference_cropped.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(B_SE_diff_spp126_NonAna_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/SE_spp126_diff_NonAna_spLossMapRelative_cropped.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(B_CI_diff_spp126_NonAna_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/CI_spp126_diff_NonAna_spLossMapRelative_cropped.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(B_NaH_diff_ssp370, filename=paste0(OutputDir,"ProcessedMaps/NaH_ssp370_spLossRelative_difference_cropped.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(B_SE_diff_spp370_NonAna_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/SE_spp370_diff_NonAna_spLossMapRelative_cropped.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(B_CI_diff_spp370_NonAna_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/CI_spp370_diff_NonAna_spLossMapRelative_cropped.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(B_NaH_diff_ssp585, filename=paste0(OutputDir,"ProcessedMaps/NaH_ssp585_spLossRelative_difference_cropped.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(B_SE_diff_spp585_NonAna_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/SE_spp585_diff_NonAna_spLossMapRelative_cropped.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
terra::writeRaster(B_CI_diff_spp585_NonAna_spLossMapRelative, filename=paste0(OutputDir,"ProcessedMaps/CI_spp585_diff_NonAna_spLossMapRelative_cropped.tif"), overwrite=T, gdal=c("COMPRESS=ZIP", "TFW=YES"), datatype='INT4U')
