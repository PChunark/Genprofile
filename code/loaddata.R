library("stringr")
library("purrr")
library("readxl")
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
genProLargeHydrocontents <- list()
genProSmallHydrocontents <- list()
genProImportHydrocontents <- list()

## 02.2 For loop loading data
for (i in seq_along(largeHydroFilePath)) {
  genProLargeHydrocontents[[i]] <- read_excel(
    largeHydroFilePath[[i]]
  )
}