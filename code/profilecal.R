genProLargeHydro <- genProLargeHydro %>% 
  reduce(full_join, by = c(colnames(.))) %>% 
  select(!c(hour,minute)) %>% 
  mutate(largehydro = select(.,!timestamp) %>% rowSums(na.rm = T))

genProSmallHydro <- genProSmallHydro %>% 
  reduce(full_join, by = c(colnames(.))) %>% 
  select(!c(hour,minute)) %>% 
  mutate(smallhydro = select(.,!timestamp) %>% rowSums(na.rm = T))

genProImportHydro <- genProImportHydro %>% 
  reduce(full_join, by = c(colnames(.))) %>% 
  select(!c(hour,minute)) %>% 
  mutate(importhydro = select(.,!timestamp) %>% rowSums(na.rm = T))
