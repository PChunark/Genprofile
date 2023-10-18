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

a <-
  loadProfile %>% 
  rename_all(tolower) %>% 
  mutate(timestamp = as.POSIXct(timestamp, format = "%d/%m/%Y %H:%M:%S", tz = "UTC"),
         day = day(timestamp),
         hour = hour(timestamp),
         minute = minute(timestamp)) %>% 
  filter(day == 1) %>% 
  
