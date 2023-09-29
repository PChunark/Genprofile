source("code/loaddata.R")


genProLargeHydro <-
  genProLargeHydro %>% 
  reduce(full_join, by = c(colnames(.))) %>% 
  select(!c(hour,minute)) %>% 
  mutate(largehydro = select(.,!timestamp) %>% rowSums(na.rm = T)) %>% 
  mutate(quarter = quarter(timestamp), .after = "timestamp")

genProSmallHydro <- 
  genProSmallHydro %>% 
  reduce(full_join, by = c(colnames(.))) %>% 
  select(!c(hour,minute)) %>% 
  mutate(smallhydro = select(.,!timestamp) %>% rowSums(na.rm = T))%>% 
  mutate(quarter = quarter(timestamp), .after = "timestamp")

genProImportHydro <- 
  genProImportHydro %>% 
  reduce(full_join, by = c(colnames(.))) %>% 
  select(!c(hour,minute)) %>% 
  mutate(importhydro = select(.,!timestamp) %>% rowSums(na.rm = T))%>% 
  mutate(quarter = quarter(timestamp), .after = "timestamp")

# sum all hydro profile ####
genProAllHydro<-
  full_join(genProLargeHydro,
            genProSmallHydro,
            by = c("timestamp", "quarter")) %>% 
  full_join(., genProImportHydro,
            by = c("timestamp", "quarter")) %>% 
  pivot_longer(-c(timestamp,quarter), names_to = "pp", values_to = "mw") %>% 
    filter(quarter == 3,
           pp %in% c("largehydro","smallhydro", "importhydro")) %>%
  pivot_wider(names_from = pp, values_from = mw) %>% 
  mutate(allhydro = select(., !c(timestamp, quarter)) %>% rowSums(., na.rm = T))   

## plot all hydro profile ####  
  genProAllHydro %>% 
  pivot_longer(-c(timestamp,quarter), names_to = "pp", values_to = "mw") %>% 
  ggplot()+
  geom_line(aes(x = timestamp, y = mw, group = pp, color = pp))
  
## find max value of all hydro ####
maxHydro<-
  genProAllHydro %>% 
  filter(allhydro == max(allhydro))
