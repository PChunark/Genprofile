library(rvest) #for web scraping
library(tidyverse)
library(xml2) #work with xml file
library(glue)

month <- paste0("0","8")
year <- 2023

url <- glue("http://control.egat.co.th/GetNetGen/default.aspx?d={month}/{year}")

xpath <- "/html/body/form"

loadProfile <-
  url %>% 
  read_html() %>% 
  html_element(xpath = xpath) %>% 
  html_table()

loadProfile %>% 
  rename_all(tolower) %>% 
  mutate(timestamp = as.POSIXct(timestamp, format = "%e-%b-%Y %H:%M:%S", tz = "UTC"),
         hour = hour(timestamp),
         minute = minute(timestamp))
