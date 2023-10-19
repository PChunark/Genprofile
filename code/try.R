i1 <- list()
url <- list()
file <- list()
for(i in 1:87) {
  i1[[i]] <- sprintf('%02d', i)
  url[[i]] <- paste0("http://example.com/orResultsED.cfm?MODE=exED&ED=", i1, "&EventId=31")
  file[[i]] <- paste0("Data/myExcel_", i, ".xlsx")
  # if (!file.exists(file)) download.file(url, file) 
}
year <- 2023
for(i in 1:2) {
  i1 <- sprintf('%02d', i)
  url <- paste0("http://control.egat.co.th/GetNetGen/default.aspx?d=",i1,"/",year)
  xpath <- "/html/body/form"
  loadProfile <-
    url %>% 
    read_html() %>% 
    html_element(xpath = xpath) %>% 
    html_table() %>% 
    rename_all(tolower)
  # file <- paste0("Data/myExcel_", i, ".xlsx")
  # if (!file.exists(file)) download.file(url, file) 
}