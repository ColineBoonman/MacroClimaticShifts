# MacroClimaticShifts

### About
The 'MacroClimaticShifts' repository includes all processed data, scripts and output of this scientific paper:

Coline C.F. Boonman, Selwyn Hoeks, Josep M. Serra-Diaz, Wen-Yong Guo, Brian J. Enquist, Brian Maitner, Cory Merow, Jens-Christian Svenning, (2024). XXX. In Review.

- Species’ extent (99% minimum convex hull) can be downloaded as spatial polygons (Global.polygon.shp) - please note that water, urban areas and unsuitable climate zones are not removed from these polygons
- Species richness maps (overlay of species' range) is provided as spRichMap_masked.tif, where masked referes to the removal of water and urban areas, whereas unsuitable climate was remover per species. This map is used to create relative tree diversity exposure maps.
- Under the non-analogue framework, we created a 32nd climate zone (Non-Analogue Hotter). Climate zone maps under this new framework are provided per climate model (5) and greenhouse scenario (3) as .tif files in the zipped folder 'NonAnalogueRasters_2023_10_02.zip'. We also include png files to illustrate the location of the new climate zone (number 32) and the climate zones that were considered for transformation to a hotter non-analogue climate zone - see Methods of manuscript and Supplematary Information for more detail.
- In the folder SpeciesClimateExposureMeanSE, you can find the rasters as .tif (and related .png files for easy visualization) for the relative tree diversity (%) exposed to macroclimatic shifts, as average over the five climate models (indicated with 'Mean') or as Standard Error (indicated with SE) as described in the Methods section of the manuscript.
- In the Data folder, you can find the file Current_kg2_zonalHist_pointsBuffered1000m_spaggr.fst, which can  be opened in R using the fst package. In this file, you can find the species precenses over the 32 different climate zones.

- All code used to generate non-analogue hotter climate zones can be found on the Github account of Selwyn Hoeks (SHoeks).
- All code used to calculate species ranges and exposure to macroclimatic shifts can be found on the Github account of Selwyn Hoeks (SHoeks).
- All code to produce global maps concerning the average and standard error of future tree diversity exposure as well as the tree species richness map can be found on the Github account of Selwyn Hoeks (SHoeks).
- All the R code that was used to process the data and create the figures are available numbered by the order of use:
  - 0.Get.Data.R which requires GetDataFunction.R
  - 1.Create.Dataset.R
  - 2.Prepare.Global.Maps.R
  - 3.Figure.maps.R
  - 4.Figures.nomaps.R
  - 5.Numbers.Figures.DiscussionSection.R
  
- All species information can be found in ClimateRefugia.txt for the original framework, and in ClimateRefugia_NonAnalogue.txt for the non-analogue framework. Each row (n=32,094) is a species and each column (n=29) contains different information. The word 'lost' indicates exposure to macroclimatic shifts under the future climate change scenario indicated in the name ssp126 stands for greenhouse gas emission scenario SSP1 RCP2.6, ssp370 stands for greenhouse gas emission scenario SSP3 RCP7.0, ssp585 stands for greenhouse gas emission scenario SSP5 RCP8.5.
  - The files are saved with comma seperator, dot decimal, including header.
  - Columns names and units:
    - 1.'species' species names, bound by _
    - 2.'suitable_climate_InRange_m2' species range (already excluding water, urban, and unsuitable climate zones), with the unit m2 (to convert to km2, divide the EOO by 1,000,000)
    - 3.'lost_area_m2_ssp126_GFDL-ESM4' area within species' range exposed to macroclimatic shifts (i.e. unsuitable climate) by 2100 under the scenario ssp126 under climate model GFDL-ESM4
    - 4.'lost_area_m2_ssp370_GFDL-ESM4' area within species' range exposed to macroclimatic shifts (i.e. unsuitable climate) by 2100 under the scenario ssp370 under climate model GFDL-ESM4
    - 5.'lost_area_m2_ssp585_GFDL-ESM4' area within species' range exposed to macroclimatic shifts (i.e. unsuitable climate) by 2100 under the scenario ssp585 under climate model GFDL-ESM4
    - 6.'lost_area_m2_ssp126_IPSL-CM6A-LR' area within species' range exposed to macroclimatic shifts (i.e. unsuitable climate) by 2100 under the scenario ssp126 under climate model IPSL-CM6A-LR
    - 7.'lost_area_m2_ssp370_IPSL-CM6A-LR' area within species' range exposed to macroclimatic shifts (i.e. unsuitable climate) by 2100 under the scenario ssp370 under climate model IPSL-CM6A-LR
    - 8.'lost_area_m2_ssp585_IPSL-CM6A-LR' area within species' range exposed to macroclimatic shifts (i.e. unsuitable climate) by 2100 under the scenario ssp585 under climate model IPSL-CM6A-LR
    - 9.'lost_area_m2_ssp126_MPI-ESM1-2-HR' area within species' range exposed to macroclimatic shifts (i.e. unsuitable climate) by 2100 under the scenario ssp126 under climate model MPI-ESM1-2-HR
    - 10.'lost_area_m2_ssp370_MPI-ESM1-2-HR' area within species' range exposed to macroclimatic shifts (i.e. unsuitable climate) by 2100 under the scenario ssp370 under climate model MPI-ESM1-2-HR
    - 11.'lost_area_m2_ssp585_MPI-ESM1-2-HR' area within species' range exposed to macroclimatic shifts (i.e. unsuitable climate) by 2100 under the scenario ssp585 under climate model MPI-ESM1-2-HR
    - 12.'lost_area_m2_ssp126_MRI-ESM2-0' area within species' range exposed to macroclimatic shifts (i.e. unsuitable climate) by 2100 under the scenario ssp126 under climate model MRI-ESM2-0
    - 13.'lost_area_m2_ssp370_MRI-ESM2-0' area within species' range exposed to macroclimatic shifts (i.e. unsuitable climate) by 2100 under the scenario ssp370 under climate model MRI-ESM2-0
    - 14.'lost_area_m2_ssp585_MRI-ESM2-0' area within species' range exposed to macroclimatic shifts (i.e. unsuitable climate) by 2100 under the scenario ssp585 under climate model MRI-ESM2-0
    - 15.'lost_area_m2_ssp126_UKESM1-0-LL' area within species' range exposed to macroclimatic shifts (i.e. unsuitable climate) by 2100 under the scenario ssp126 under climate model UKESM1-0-LL
    - 16.'lost_area_m2_ssp370_UKESM1-0-LL' area within species' range exposed to macroclimatic shifts (i.e. unsuitable climate) by 2100 under the scenario ssp370 under climate model UKESM1-0-LL
    - 17.'lost_area_m2_ssp585_UKESM1-0-LL' area within species' range exposed to macroclimatic shifts (i.e. unsuitable climate) by 2100 under the scenario ssp585 under climate model UKESM1-0-LL
    - 18.'lost_area_m2_ssp126' area within species' range exposed to macroclimatic shifts (i.e. unsuitable climate) by 2100 under the scenario ssp126 as the average over the five different climate models
    - 19.'lost_area_m2_ssp370' area within species' range exposed to macroclimatic shifts (i.e. unsuitable climate) by 2100 under the scenario ssp370 as the average over the five different climate models
    - 20.'lost_area_m2_ssp585' area within species' range exposed to macroclimatic shifts (i.e. unsuitable climate) by 2100 under the scenario ssp585 as the average over the five different climate models
    - 21.'lost_area_percent_ssp126' area within species' range exposed to macroclimatic shifts (i.e. unsuitable climate) relative to species range (%) by 2100 under the scenario ssp126 as the average over the five different climate models
    - 22.'lost_area_percent_ssp370' area within species' range exposed to macroclimatic shifts (i.e. unsuitable climate) relative to species range (%) by 2100 under the scenario ssp370 as the average over the five different climate models
    - 23.'lost_area_percent_ssp585' area within species' range exposed to macroclimatic shifts (i.e. unsuitable climate) relative to species range (%) by 2100 under the scenario ssp585 as the average over the five different climate models
    - 24.'stable_climate_m2_ssp126' area within species' range that is not exposed to macroclimatic shifts (i.e. remains suitable climate) by 2100 under the scenario ssp126 as the average over the five different climate models
    - 25.'stable_climate_m2_ssp370' area within species' range that is not exposed to macroclimatic shifts (i.e. remains suitable climate) by 2100 under the scenario ssp370 as the average over the five different climate models
    - 26.'stable_climate_m2_ssp585' area within species' range that is not exposed to macroclimatic shifts (i.e. remains suitable climate) by 2100 under the scenario ssp585 as the average over the five different climate models
    - 27.'stable_climate_percent_ssp126' area within species' range that is not exposed to macroclimatic shifts (i.e. remains suitable climate) relative to species range (%) by 2100 under the scenario ssp126 as the average over the five different climate models
    - 28.'stable_climate_percent_ssp370' area within species' range that is not exposed to macroclimatic shifts (i.e. remains suitable climate) relative to species range (%) by 2100 under the scenario ssp370 as the average over the five different climate models
    - 29.'stable_climate_percent_ssp585' area within species' range that is not exposed to macroclimatic shifts (i.e. remains suitable climate) relative to species range (%) by 2100 under the scenario ssp585 as the average over the five different climate models
    
    
