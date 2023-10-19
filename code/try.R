month <- paste0("0", 1:9)
month1 <- 10:12

for(i in 1:9) {
  mon <- paste0("0", i)
}

for(i in seq_along(1:12)) {
  month[i] <- paste0("0", i)
}

for(i in seq_along(1:12)) {
  if(i <= 9){
  month[i] <- paste0("0", i)
  }else{
  month[i] <- paste0(i)  
  }
}

for(j in seq_along(2017:year(Sys.Date()))){
  year[j] <- paste0(2017:j) 
}

for(i in 1:87) {
  i1 <- sprintf('%02d', i)}



for(i in 1:87) {
  i1 <- sprintf('%02d', i)
  url <- paste0("http://example.com/orResultsED.cfm?MODE=exED&ED=", i1, "&EventId=31")
  file <- paste0("Data/myExcel_", i, ".xlsx")
  if (!file.exists(file)) download.file(url, file) 
}