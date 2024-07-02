library("tidyverse")
library("stringr")
library("purrr")
library("fs")
library("readxl")

##--> This script is for loading the RE profile 8760 hr <--##

# Create file paths #####
## 1. Wind gen profile file paths #####

windEGAT <- 
  fs::dir_ls(path = "rawdata/windEGAT",
             glob = "*2023.xlsx")

windNonFirm <-
  fs::dir_ls(path = "rawdata/windNonFirm",
             glob = "*2023.xlsx")

## 2. Solar gen profile file paths #####

solarEGAT <- 
  fs::dir_ls(path = "rawdata/solarEGAT",
             glob = "*2023.xlsx")

solarSPPFirm <-
  fs::dir_ls(path = "rawdata/solarSPPFirm",
             glob = "*2023.xlsx")

solarSPPNonFirm <-
  fs::dir_ls(path = "rawdata/solarSPPNonFirm",
             glob = "*2023.xlsx")

## 3. Industrial waste gen profile file path #####

wasteSPPNonFirm <-
  fs::dir_ls(path = "rawdata/wasteIndSPPNonFirm",
             glob = "*2023.xlsx")

## 4. Biomass gen profile file paths #####
### 4.1 Paddy husk #####

paddyHuskSPPFirm <-
  fs::dir_ls(path = "rawdata/paddyHuskSPPFirm",
             glob = "*2023.xlsx")

## 4.2 Bagasse #####

bagasseSPPFirm <- 
  fs::dir_ls(path = "rawdata/bagasseSPPFirm",
             glob = "*2023.xlsx")

bagasseSPPNonFirm <-
  fs::dir_ls(path = "rawdata/bagasseSPPNonFirm",
             glob = "*2023.xlsx")

## 4.3 Biomass (not specify fuel type) #####

biomassSPPFirm <- 
  fs::dir_ls(path = "rawdata/biomassSPPFirm",
             glob = "*2023.xlsx")

## 4.4 Parawood (scrap) #####

parawoodSPPFirm <-
  fs::dir_ls(path = "rawdata/parawoodSPPFirm",
             glob = "*2023.xlsx")

parawoodSPPNonFirm <-
  fs::dir_ls(path = "rawdata/parawoodSPPNonFirm",
             glob = "*2023.xlsx")

## 4.5 Palm #####

palmSPPFirm <-
  fs::dir_ls(path = "rawdata/palmSPPFirm",
             glob = "*2023.xlsx")


