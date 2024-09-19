source("code/getREProfiles.R")
library(writexl)

# Wind generation Profile #####
## EGAT wind #####
genProWindEGAT <- 
  windEGAT %>% 
  map(function(path){
    read_excel(path) %>% 
      rename_all(tolower) %>% 
      mutate(
        timestamp = as.POSIXct(timestamp, format = "%d-%b-%Y %H:%M", tz = "UTC"),
        hour = hour(timestamp),
        minute = minute(timestamp)) %>% 
      filter(minute == "30" | minute =="0")
 
  })

## Unnest list to dataframe
genProWindEGAT <-
  genProWindEGAT %>% 
  reduce(full_join, by = c(colnames(.)))

## Export data to excel
writexl::write_xlsx(genProWindEGAT, path = "processdata/2023WindEGATProfile.xlsx")

## SPP Non-firm Wind #####
genProWindNonFirm <- 
  windNonFirm %>% 
  map(function(path){
    read_excel(path) %>% 
      rename_all(tolower) %>% 
      mutate(
        timestamp = as.POSIXct(timestamp, format = "%d-%b-%Y %H:%M", tz = "UTC"),
        hour = hour(timestamp),
        minute = minute(timestamp)) %>% 
      filter(minute == "30" | minute =="0")
    
  })

## Unnest list to dataframe
genProWindNonFirm <-
  genProWindNonFirm %>% 
  reduce(full_join, by = c(colnames(.)))

## Export data to excel
writexl::write_xlsx(genProWindNonFirm, path = "processdata/2023WindNonFirmProfile.xlsx")

# Solar generation profile #####
## EGAT solar #####

genProSolarEGAT <- 
  solarEGAT %>% 
  map(function(path){
    read_excel(path) %>% 
      rename_all(tolower) %>% 
      mutate(
        timestamp = as.POSIXct(timestamp, format = "%d-%b-%Y %H:%M", tz = "UTC"),
        hour = hour(timestamp),
        minute = minute(timestamp)) %>% 
      filter(minute == "30" | minute =="0")
    
  })

## Unnest list to dataframe
genProSolarEGAT <-
  genProSolarEGAT %>% 
  reduce(full_join, by = c(colnames(.)))

## Export data to excel
writexl::write_xlsx(genProSolarEGAT, path = "processdata/2023SolarEGATProfile.xlsx")

## SPP firm solar #####

genProSolarSPPFirm <- 
  solarSPPFirm %>% 
  map(function(path){
    read_excel(path) %>% 
      rename_all(tolower) %>% 
      mutate(
        timestamp = as.POSIXct(timestamp, format = "%d-%b-%Y %H:%M", tz = "UTC"),
        hour = hour(timestamp),
        minute = minute(timestamp)) %>% 
      filter(minute == "30" | minute =="0")
    
  })

## Unnest list to dataframe
genProSolarSPPFirm <-
  genProSolarSPPFirm %>% 
  reduce(full_join, by = c(colnames(.)))

## Export data to excel
writexl::write_xlsx(genProSolarSPPFirm, path = "processdata/2023SolarSPPFirmProfile.xlsx")

## SPP Non-firm solar #####

genProSolarSPPNonFirm <- 
  solarSPPNonFirm %>% 
  map(function(path){
    read_excel(path) %>% 
      rename_all(tolower) %>% 
      mutate(
        timestamp = as.POSIXct(timestamp, format = "%d-%b-%Y %H:%M", tz = "UTC"),
        hour = hour(timestamp),
        minute = minute(timestamp)) %>% 
      filter(minute == "30" | minute =="0")
    
  })

## Unnest list to dataframe
genProSolarSPPNonFirm <-
  genProSolarSPPNonFirm %>% 
  reduce(full_join, by = c(colnames(.)))

## Export data to excel
writexl::write_xlsx(genProSolarSPPNonFirm, path = "processdata/2023SolarSPPNonFirmProfile.xlsx")

# Waste (industrial waste) generation profile #####

genProWasteSPPNonFirm <- 
  wasteSPPNonFirm %>% 
  map(function(path){
    read_excel(path) %>% 
      rename_all(tolower) %>% 
      mutate(
        timestamp = as.POSIXct(timestamp, format = "%d-%b-%Y %H:%M", tz = "UTC"),
        hour = hour(timestamp),
        minute = minute(timestamp)) %>% 
      filter(minute == "30" | minute =="0")
    
  })

## Unnest list to dataframe
genProWasteSPPNonFirm <-
  genProWasteSPPNonFirm %>% 
  reduce(full_join, by = c(colnames(.)))

## Export data to excel
writexl::write_xlsx(genProWasteSPPNonFirm, path = "processdata/2023WasteSPPNonFirmProfile.xlsx")























# Biomass generation profile #####
## Paddy husk SPP Firm #####

genProPaddyHuskSPPFirm <- 
  paddyHuskSPPFirm %>% 
  map(function(path){
    read_excel(path) %>% 
      rename_all(tolower) %>% 
      mutate(
        timestamp = as.POSIXct(timestamp, format = "%d-%b-%Y %H:%M", tz = "UTC"),
        hour = hour(timestamp),
        minute = minute(timestamp)) %>% 
      filter(minute == "30" | minute =="0")
    
  })

## Unnest list to dataframe
genProPaddyHuskSPPFirm <-
  genProPaddyHuskSPPFirm %>% 
  reduce(full_join, by = c(colnames(.)))

## Export data to excel
writexl::write_xlsx(genProPaddyHuskSPPFirm, path = "processdata/2023PaddyHuskSPPFirmProfile.xlsx")


## Bagasse SPP Firm #####

genProBagasseSPPFirm <- 
  bagasseSPPFirm %>% 
  map(function(path){
    read_excel(path) %>% 
      rename_all(tolower) %>% 
      mutate(
        timestamp = as.POSIXct(timestamp, format = "%d-%b-%Y %H:%M", tz = "UTC"),
        hour = hour(timestamp),
        minute = minute(timestamp)) %>% 
      filter(minute == "30" | minute =="0")
    
  })

## Unnest list to dataframe
genProBagasseSPPFirm <-
  genProBagasseSPPFirm %>% 
  reduce(full_join, by = c(colnames(.)))

## Export data to excel
writexl::write_xlsx(genProBagasseSPPFirm, path = "processdata/2023BagasseSPPFirmProfile.xlsx")










## Bagasse SPP Non-Firm #####

genProBagasseSPPNonFirm <- 
  bagasseSPPNonFirm %>% 
  map(function(path){
    read_excel(path) %>% 
      rename_all(tolower) %>% 
      mutate(
        timestamp = as.POSIXct(timestamp, format = "%d-%b-%Y %H:%M", tz = "UTC"),
        hour = hour(timestamp),
        minute = minute(timestamp)) %>% 
      filter(minute == "30" | minute =="0")
    
  })

## Unnest list to dataframe
genProBagasseSPPNonFirm <-
  genProBagasseSPPNonFirm %>% 
  reduce(full_join, by = c(colnames(.)))

## Export data to excel
writexl::write_xlsx(genProBagasseSPPNonFirm, path = "processdata/2023BagasseSPPNonFirmProfile.xlsx")


## Biomass (not specify fuel type) SPP Non-Firm #####

genProBiomassSPPFirm <- 
  biomassSPPFirm %>% 
  map(function(path){
    read_excel(path) %>% 
      rename_all(tolower) %>% 
      mutate(
        timestamp = as.POSIXct(timestamp, format = "%d-%b-%Y %H:%M", tz = "UTC"),
        hour = hour(timestamp),
        minute = minute(timestamp)) %>% 
      filter(minute == "30" | minute =="0")
    
  })

## Unnest list to dataframe
genProBiomassSPPFirm <-
  genProBiomassSPPFirm %>% 
  reduce(full_join, by = c(colnames(.)))

## Export data to excel
writexl::write_xlsx(genProBiomassSPPFirm, path = "processdata/2023BiomassSPPFirmProfile.xlsx")

## Parawood SPP Firm #####

genProParawoodSPPFirm <- 
  parawoodSPPFirm %>% 
  map(function(path){
    read_excel(path) %>% 
      rename_all(tolower) %>% 
      mutate(
        timestamp = as.POSIXct(timestamp, format = "%d-%b-%Y %H:%M", tz = "UTC"),
        hour = hour(timestamp),
        minute = minute(timestamp)) %>% 
      filter(minute == "30" | minute =="0")
    
  })

## Unnest list to dataframe
genProParawoodSPPFirm <-
  genProParawoodSPPFirm %>% 
  reduce(full_join, by = c(colnames(.)))

## Export data to excel
writexl::write_xlsx(genProParawoodSPPFirm, path = "processdata/2023ParawoodSPPFirmProfile.xlsx")


## Parawood SPP Non-Firm #####

genProParawoodSPPNonFirm <- 
  parawoodSPPNonFirm %>% 
  map(function(path){
    read_excel(path) %>% 
      rename_all(tolower) %>% 
      mutate(
        timestamp = as.POSIXct(timestamp, format = "%d-%b-%Y %H:%M", tz = "UTC"),
        hour = hour(timestamp),
        minute = minute(timestamp)) %>% 
      filter(minute == "30" | minute =="0")
    
  })

## Unnest list to dataframe
genProParawoodSPPNonFirm <-
  genProParawoodSPPNonFirm %>% 
  reduce(full_join, by = c(colnames(.)))

## Export data to excel
writexl::write_xlsx(genProParawoodSPPNonFirm, path = "processdata/2023ParawoodSPPNonFirmProfile.xlsx")

## Palm SPP Firm #####

genProPalmSPPFirm <- 
  palmSPPFirm %>% 
  map(function(path){
    read_excel(path) %>% 
      rename_all(tolower) %>% 
      mutate(
        timestamp = as.POSIXct(timestamp, format = "%d-%b-%Y %H:%M", tz = "UTC"),
        hour = hour(timestamp),
        minute = minute(timestamp)) %>% 
      filter(minute == "30" | minute =="0")
    
  })

## Unnest list to dataframe
genProPalmSPPFirm <-
  genProPalmSPPFirm %>% 
  reduce(full_join, by = c(colnames(.)))

## Export data to excel
writexl::write_xlsx(genProPalmSPPFirm, path = "processdata/2023PalmSPPFirmProfile.xlsx")
