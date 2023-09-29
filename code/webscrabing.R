library(rvest) #for web scraping
library(tidyverse)
library(xml2) #work with xml file
library(glue)

month <- 8
year <- 2023

url <- glue("http://control.egat.co.th/GetNetGen/default.aspx?d={month}/{2023}")

xpath <- '//*[@id="GridView1"]/tbody'

url %>% 
  read_html() %>% 
  html_nodes(xpath = xpath) %>% 
  html_table()

