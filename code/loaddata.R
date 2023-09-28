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
