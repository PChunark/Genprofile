library("tidyverse")
library("stringr")
library("purrr")
library("fs")
library("readxl")

# 01 Create File paths ####
largeHydroFilePath <-
  fs::dir_ls(path = "rawdata/largeHydro",
           glob = "*2023.xlsx")
smallHydroFilePath <-
  fs::dir_ls(path = "rawdata/smallHydro",
             glob = "*2023.xlsx")
importHydroFilePath <-
  fs::dir_ls(path = "rawdata/importHydro",
             glob = "*2023.xlsx")
maxHydroFilePath <-
  fs::dir_ls(path = "rawdata/maxHydroQ42566",
             glob = "*.xlsx")

# 02 Load data into list ####
## 02.1 Create empty file list ####
# genProLargeHydro <- list()
# genProSmallHydro <- list()
# genProImportHydro <- list()
# 
# ## 02.2.1 For loop loading data ####
# for (i in seq_along(largeHydroFilePath)) {
#   genProLargeHydro[[i]] <- read_excel(
#     largeHydroFilePath[[i]]
#   )
# }
# 
# genProLargeHydro

## 0.2.2.2 Using Purrr map ####
genProLargeHydro<-
  largeHydroFilePath %>% 
  map(function (path){
    read_excel(path) %>% 
      rename_all(tolower) %>% 
      mutate(
             timestamp = as.POSIXct(timestamp, format = "%d-%b-%Y %H:%M", tz = "UTC"),
             hour = hour(timestamp),
             minute = minute(timestamp)) %>% 
      filter(minute == "30" | minute =="0") 
    })


genProSmallHydro<-
  smallHydroFilePath %>% 
  map(function (path){
    read_excel(path) %>% 
      rename_all(tolower) %>% 
      mutate(
        timestamp = as.POSIXct(timestamp, format = "%d-%b-%Y %H:%M", tz = "UTC"),
        hour = hour(timestamp),
        minute = minute(timestamp)) %>% 
      filter(minute == "30" | minute =="0") 
  })

genProImportHydro<-
  importHydroFilePath %>% 
  map(function (path){
    read_excel(path) %>% 
      rename_all(tolower) %>% 
      mutate(
        timestamp = as.POSIXct(timestamp, format = "%d-%b-%Y %H:%M", tz = "UTC"),
        hour = hour(timestamp),
        minute = minute(timestamp)) %>% 
      filter(minute == "30" | minute =="0") 
  })


source("code/abbreviationPP.R")

# 01 Wind ####
genProEGATWind <-
  read_excel(path = maxHydroFilePath,
             sheet = "PointData") %>% 
    rename_all(tolower) %>% 
    filter(measurementname == egatWind)

genProNonFirmWind <-
  read_excel(path = maxHydroFilePath,
             sheet = "PointData") %>% 
  rename_all(tolower) %>% 
  filter(measurementname %in% nonFirmWind)

windProfile <- list(genProEGATWind, genProNonFirmWind)

genProWind <-
  windProfile %>% 
  purrr::reduce(full_join)


# 02 Solar ####

genProEGATSolar <-
  read_excel(path = maxHydroFilePath,
             sheet = "PointData") %>% 
  rename_all(tolower) %>% 
  filter(measurementname %in% egatSolar)

genProSppFirmSolar <-
  read_excel(path = maxHydroFilePath,
             sheet = "PointData") %>% 
  rename_all(tolower) %>% 
  filter(measurementname %in% sppFirmSolar)

genProSppNonFirmSolar <-
  read_excel(path = maxHydroFilePath,
             sheet = "PointData") %>% 
  rename_all(tolower) %>% 
  filter(measurementname %in% sppNonFirmSolar)

solarProfile <- list(genProEGATSolar, genProSppFirmSolar, genProSppNonFirmSolar)

genProSolar <-
  solarProfile %>% 
  purrr::reduce(full_join)

# 03 Waste (industrial waste) ####

genProSppNonFirmWaste <-
  read_excel(path = maxHydroFilePath,
             sheet = "PointData") %>% 
  rename_all(tolower) %>% 
  filter(measurementname %in% sppNonFirmWaste)

wasteProfile <- list(genProSppNonFirmWaste)

genProWaste <-
  wasteProfile %>% 
  purrr::reduce(full_join)

# 05 Biomass ####
## 05.1 Paddy husk ####

genProSppFirmPaddyHusk <-
  read_excel(path = maxHydroFilePath,
             sheet = "PointData") %>% 
  rename_all(tolower) %>% 
  filter(measurementname %in% sppFirmPaddyHusk)

## 05.2 Bagasse ####
genProSppFirmBagasse <-
  read_excel(path = maxHydroFilePath,
             sheet = "PointData") %>% 
  rename_all(tolower) %>% 
  filter(measurementname %in% sppFirmBagasse)

genProNonSppFirmBagasse <-
  read_excel(path = maxHydroFilePath,
             sheet = "PointData") %>% 
  rename_all(tolower) %>% 
  filter(measurementname %in% sppNonFirmBagasse)

## 05.3 Biomass (not specify) ####
genProSppFirmBiomass <-
  read_excel(path = maxHydroFilePath,
             sheet = "PointData") %>% 
  rename_all(tolower) %>% 
  filter(measurementname %in% sppFirmBiomass)

## 05.4 Parawood (scrap) ####
genProSppFirmParawood <-
  read_excel(path = maxHydroFilePath,
             sheet = "PointData") %>% 
  rename_all(tolower) %>% 
  filter(measurementname %in% sppFirmParawood)

genProSppNonFirmParawood <-
  read_excel(path = maxHydroFilePath,
             sheet = "PointData") %>% 
  rename_all(tolower) %>% 
  filter(measurementname %in% sppNonFirmParawood)

## 05.5 Palm ####
genProSppFirmPalm <-
  read_excel(path = maxHydroFilePath,
             sheet = "PointData") %>% 
  rename_all(tolower) %>% 
  filter(measurementname %in% sppFirmPalm)


biomassProfile <- list(genProSppFirmPaddyHusk, 
                       genProSppFirmBagasse, genProNonSppFirmBagasse,
                       genProSppFirmBiomass,
                       genProSppFirmParawood, genProSppNonFirmParawood,
                       genProSppFirmPalm)

genProBiomass <- 
  biomassProfile %>% 
  purrr::reduce(full_join)

# 06 Waste gas ####
genProSppNonFirmWasteGas <-
  read_excel(path = maxHydroFilePath,
             sheet = "PointData") %>% 
  rename_all(tolower) %>% 
  filter(measurementname %in% sppNonFirmWasteGas)

wastegasProfile <- list(genProSppNonFirmWasteGas)

genProWasteGas <- wastegasProfile %>% 
  purrr::reduce(full_join)

#7 MiniHydro ####
genProSppNonFirmHydro <-
  read_excel(path = maxHydroFilePath,
             sheet = "PointData") %>% 
  rename_all(tolower) %>% 
  filter(measurementname %in% sppNonFirmHydro)

minihydroProfile <- list(genProSppNonFirmHydro)

genProMiniHydro <-
  minihydroProfile %>% 
  purrr::reduce(full_join)

#8 Black Liquor ####
genProSppFirmBlackLiq <-
  read_excel(path = maxHydroFilePath,
             sheet = "PointData") %>% 
  rename_all(tolower) %>% 
  filter(measurementname %in% sppFirmBlackLiquor)

blackLiquorProfile <- list(genProSppFirmBlackLiq)

genProBlackLiq <- 
  blackLiquorProfile %>% 
  purrr::reduce(full_join)
