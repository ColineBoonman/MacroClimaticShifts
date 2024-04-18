rm(list = ls())
#

setwd("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/")
InputDir  = "ClimateRefugia.paper/Output/FilesReceivedSelwyn/ShareRasters_2023_10_02/"
OutputDir = "ClimateRefugia.paper/Output/"
FigureDir = "ClimateRefugia.paper/Figures/"

# create one data file with all results combined (scenario and model)
files.ssp126 = list.files(paste0(getwd(),"/",InputDir,"ssp126_CSVs"),full.names = T)
files.ssp370 = list.files(paste0(getwd(),"/",InputDir,"ssp370_CSVs"),full.names = T)
files.ssp585 = list.files(paste0(getwd(),"/",InputDir,"ssp585_CSVs"),full.names = T)
for(model in 1:5){
  a = read.csv(files.ssp126[model],header=T);colnames(a)=c("species","suitable_climate_InRange_m2",paste0(colnames(a)[3],"_ssp126"))
  b = read.csv(files.ssp370[model],header=T);colnames(b)=c("species","suitable_climate_InRange_m2",paste0(colnames(b)[3],"_ssp370"))
  c = read.csv(files.ssp585[model],header=T);colnames(c)=c("species","suitable_climate_InRange_m2",paste0(colnames(c)[3],"_ssp585"))
  d = Reduce(function(df1, df2) merge(df1, df2, by = c("species","suitable_climate_InRange_m2"), all = TRUE), list(a,b,c))
  colnames(d)=paste0(colnames(d),"_",gsub(".csv","",gsub(".*/spOccLossKm2_","",files.ssp126[model])))
  colnames(d)[1]="species"; colnames(d)[2]="suitable_climate_InRange_m2"
  if(model==1) df = d
  if(model >1) df = merge(df,d,by = c("species","suitable_climate_InRange_m2"), all = TRUE)
}

# add columns of mean values over model (per scenario)
df$lost_area_m2_ssp126 = rowMeans(df[grep("lost_area",colnames(df))[grep("lost_area",colnames(df)) %in% grep("ssp126",colnames(df))]])
df$lost_area_m2_ssp370 = rowMeans(df[grep("lost_area",colnames(df))[grep("lost_area",colnames(df)) %in% grep("ssp370",colnames(df))]])
df$lost_area_m2_ssp585 = rowMeans(df[grep("lost_area",colnames(df))[grep("lost_area",colnames(df)) %in% grep("ssp585",colnames(df))]])

# relative area that is lost until end of cenury
df$lost_area_percent_ssp126 = df$lost_area_m2_ssp126*100/df$suitable_climate_InRange_m2
df$lost_area_percent_ssp370 = df$lost_area_m2_ssp370*100/df$suitable_climate_InRange_m2
df$lost_area_percent_ssp585 = df$lost_area_m2_ssp585*100/df$suitable_climate_InRange_m2

# area is stable in climate until end of century
df$stable_climate_m2_ssp126 = df$suitable_climate_InRange_m2-df$lost_area_m2_ssp126
df$stable_climate_m2_ssp370 = df$suitable_climate_InRange_m2-df$lost_area_m2_ssp370
df$stable_climate_m2_ssp585 = df$suitable_climate_InRange_m2-df$lost_area_m2_ssp585

# relative area that is stable until end of cenury
df$stable_climate_percent_ssp126 = df$stable_climate_m2_ssp126*100/df$suitable_climate_InRange_m2
df$stable_climate_percent_ssp370 = df$stable_climate_m2_ssp370*100/df$suitable_climate_InRange_m2
df$stable_climate_percent_ssp585 = df$stable_climate_m2_ssp585*100/df$suitable_climate_InRange_m2


# load iucn data
iucn = read.table("TREECHANGE_InputData/IUCNstatus/StatusList.txt", sep=",", header=T)
iucn = iucn[grep(" ",iucn$Species),]
iucn$species=stringr::str_replace(iucn$Species," ","_")
iucn$Assess_year = as.numeric(as.character(iucn$Assess_year))
iucn$IUCNstatus.recat=NA
iucn[which(iucn$IUCNstatus == "LR/lc"),"IUCNstatus.recat"] = "LeastConcern"
iucn[which(iucn$IUCNstatus == "LR/nt"),"IUCNstatus.recat"] = "LeastConcern"
iucn[which(iucn$IUCNstatus == "LR/cd"),"IUCNstatus.recat"] = "LeastConcern"
iucn[which(iucn$IUCNstatus == "CR"),"IUCNstatus.recat"] = "Threatened"
iucn[which(iucn$IUCNstatus == "EN"),"IUCNstatus.recat"] = "Threatened"
iucn[which(iucn$IUCNstatus == "VU"),"IUCNstatus.recat"] = "Threatened"
iucn[which(iucn$IUCNstatus == "NT"),"IUCNstatus.recat"] = "LeastConcern"
iucn[which(iucn$IUCNstatus == "LC"),"IUCNstatus.recat"] = "LeastConcern"
iucn[which(iucn$IUCNstatus == "DD"),"IUCNstatus.recat"] = "DataDeficient"
iucn[which(iucn$IUCNstatus == "EW"),"IUCNstatus.recat"] = "Threatened"
iucn[which(iucn$IUCNstatus == "EX"),"IUCNstatus.recat"] = "Threatened"
iucn[which(is.na(iucn$IUCNstatus)),"IUCNstatus.recat"] = "NotEvaluated"
iucn$IUCNstatus.recat=as.factor(iucn$IUCNstatus.recat)
iucn = iucn[,c(4,5)] #select columns with species names and recategorized IUCNstatus
df = merge(df,iucn, by=c("species"),all.x=T)

####################
## Save the data
write.table(df,paste0(OutputDir,"ClimateRefugia.txt"),dec=".",sep=",",row.names = F)


##############################################
##############################################
## now rerun data file creation but using the future predictions including the Non-Analogue Hotter climate zone
##############################################
##############################################

rm(list = ls())
#

setwd("O:/Nat_Ecoinformatics/C_Write/_User/ColineBoonman_au710911/")
InputDir  = "ClimateRefugia.paper/Output/FilesReceivedSelwyn/ShareRasters_2023_10_02/"
OutputDir = "ClimateRefugia.paper/Output/"
FigureDir = "ClimateRefugia.paper/Figures/"

# create one data file with all results combined (scenario and model)
files.ssp126 = list.files(paste0(getwd(),"/",InputDir,"ssp126_NonAna_CSVs"),full.names = T)
files.ssp370 = list.files(paste0(getwd(),"/",InputDir,"ssp370_NonAna_CSVs"),full.names = T)
files.ssp585 = list.files(paste0(getwd(),"/",InputDir,"ssp585_NonAna_CSVs"),full.names = T)
for(model in 1:5){
  a = read.csv(files.ssp126[model],header=T);colnames(a)=c("species","suitable_climate_InRange_m2",paste0(colnames(a)[3],"_ssp126"))
  b = read.csv(files.ssp370[model],header=T);colnames(b)=c("species","suitable_climate_InRange_m2",paste0(colnames(b)[3],"_ssp370"))
  c = read.csv(files.ssp585[model],header=T);colnames(c)=c("species","suitable_climate_InRange_m2",paste0(colnames(c)[3],"_ssp585"))
  d = Reduce(function(df1, df2) merge(df1, df2, by = c("species","suitable_climate_InRange_m2"), all = TRUE), list(a,b,c))
  colnames(d)=paste0(colnames(d),"_",gsub(".csv","",gsub(".*/spOccLossKm2_","",files.ssp126[model])))
  colnames(d)[1]="species"; colnames(d)[2]="suitable_climate_InRange_m2"
  if(model==1) df = d
  if(model >1) df = merge(df,d,by = c("species","suitable_climate_InRange_m2"), all = TRUE)
}

# add columns of mean values over model (per scenario)
df$lost_area_m2_ssp126 = rowMeans(df[grep("lost_area",colnames(df))[grep("lost_area",colnames(df)) %in% grep("ssp126",colnames(df))]])
df$lost_area_m2_ssp370 = rowMeans(df[grep("lost_area",colnames(df))[grep("lost_area",colnames(df)) %in% grep("ssp370",colnames(df))]])
df$lost_area_m2_ssp585 = rowMeans(df[grep("lost_area",colnames(df))[grep("lost_area",colnames(df)) %in% grep("ssp585",colnames(df))]])

# relative area that is lost until end of cenury
df$lost_area_percent_ssp126 = df$lost_area_m2_ssp126*100/df$suitable_climate_InRange_m2
df$lost_area_percent_ssp370 = df$lost_area_m2_ssp370*100/df$suitable_climate_InRange_m2
df$lost_area_percent_ssp585 = df$lost_area_m2_ssp585*100/df$suitable_climate_InRange_m2

# area is stable in climate until end of century
df$stable_climate_m2_ssp126 = df$suitable_climate_InRange_m2-df$lost_area_m2_ssp126
df$stable_climate_m2_ssp370 = df$suitable_climate_InRange_m2-df$lost_area_m2_ssp370
df$stable_climate_m2_ssp585 = df$suitable_climate_InRange_m2-df$lost_area_m2_ssp585

# relative area that is stable until end of cenury
df$stable_climate_percent_ssp126 = df$stable_climate_m2_ssp126*100/df$suitable_climate_InRange_m2
df$stable_climate_percent_ssp370 = df$stable_climate_m2_ssp370*100/df$suitable_climate_InRange_m2
df$stable_climate_percent_ssp585 = df$stable_climate_m2_ssp585*100/df$suitable_climate_InRange_m2


# load iucn data
iucn = read.table("TREECHANGE_InputData/IUCNstatus/StatusList.txt", sep=",", header=T)
iucn = iucn[grep(" ",iucn$Species),]
iucn$species=stringr::str_replace(iucn$Species," ","_")
iucn$Assess_year = as.numeric(as.character(iucn$Assess_year))
iucn$IUCNstatus.recat=NA
iucn[which(iucn$IUCNstatus == "LR/lc"),"IUCNstatus.recat"] = "LeastConcern"
iucn[which(iucn$IUCNstatus == "LR/nt"),"IUCNstatus.recat"] = "LeastConcern"
iucn[which(iucn$IUCNstatus == "LR/cd"),"IUCNstatus.recat"] = "LeastConcern"
iucn[which(iucn$IUCNstatus == "CR"),"IUCNstatus.recat"] = "Threatened"
iucn[which(iucn$IUCNstatus == "EN"),"IUCNstatus.recat"] = "Threatened"
iucn[which(iucn$IUCNstatus == "VU"),"IUCNstatus.recat"] = "Threatened"
iucn[which(iucn$IUCNstatus == "NT"),"IUCNstatus.recat"] = "LeastConcern"
iucn[which(iucn$IUCNstatus == "LC"),"IUCNstatus.recat"] = "LeastConcern"
iucn[which(iucn$IUCNstatus == "DD"),"IUCNstatus.recat"] = "DataDeficient"
iucn[which(iucn$IUCNstatus == "EW"),"IUCNstatus.recat"] = "Threatened"
iucn[which(iucn$IUCNstatus == "EX"),"IUCNstatus.recat"] = "Threatened"
iucn[which(is.na(iucn$IUCNstatus)),"IUCNstatus.recat"] = "NotEvaluated"
iucn$IUCNstatus.recat=as.factor(iucn$IUCNstatus.recat)
iucn = iucn[,c(4,5)] #select columns with species names and recategorized IUCNstatus
df = merge(df,iucn, by=c("species"),all.x=T)

####################
## Save the data
write.table(df,paste0(OutputDir,"ClimateRefugia_NonAnalogue.txt"),dec=".",sep=",",row.names = F)

