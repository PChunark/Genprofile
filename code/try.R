i1 <- list()
loadProfile <- list()
max <- list() 
year <- 2023

for(i in 1:87) {
  i1[[i]] <- sprintf('%02d', i)
  url[[i]] <- paste0("http://example.com/orResultsED.cfm?MODE=exED&ED=", i1, "&EventId=31")
  file[[i]] <- paste0("Data/myExcel_", i, ".xlsx")
  # if (!file.exists(file)) download.file(url, file) 
}
# scraping from web

for(i in 1:2) {
  i1[[i]] <- sprintf('%02d', i)
  url <- paste0("http://control.egat.co.th/GetNetGen/default.aspx?d=",i1,"/",year)
  xpath <- "/html/body/form"
  loadProfile[[i]] <-
    session(url[i]) %>% 
    read_html() %>% 
    html_element(xpath = xpath) %>% 
    html_table() %>% 
    rename_all(tolower)
}
# Finding max value
for (j in 1:ncol(loadProfile[[1]])){
  
  if(j>=ncol(loadProfile[[1]]))
  {break}
  else{
    max[[j]] <- loadProfile[[i]] %>% 
      select(timestamp, j+1) 
  }
  max[[j]] <- max[[j]] %>% 
    filter(max[[j]][,2] == max(.[,2]))
}
#### Merge for loop

for(i in 1:2) {
  i1[[i]] <- sprintf('%02d', i)
  url <- paste0("http://control.egat.co.th/GetNetGen/default.aspx?d=",i1,"/",year)
  xpath <- "/html/body/form"
  loadProfile[[i]] <-
    session(url[i]) %>% 
    read_html() %>% 
    html_element(xpath = xpath) %>% 
    html_table() %>% 
    rename_all(tolower)
  
  for (j in 1:ncol(loadProfile[[i]])){
    
    if(j>=ncol(loadProfile[[i]]))
    {break}
    else{
      max[[j]] <- loadProfile[[i]] %>% 
        select(timestamp, j+1) 
    }
    max[[j]] <- max[[j]] %>% 
      filter(max[[j]][,2] == max(.[,2]))
  }  
}
