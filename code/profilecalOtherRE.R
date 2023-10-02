otherREProfileAtMaxHydro <- list()
# 01 Wind ####
data<-
  genProWind %>% 
  pivot_longer(-measurementname, names_to = "time", values_to = "gen_mw") %>%
  pivot_wider(names_from = "measurementname", values_from = "gen_mw") %>% 
  mutate(total = select(., !c(time)) %>% rowSums(., na.rm = T)) %>% 
  select(time, total)

otherREProfileAtMaxHydro <- c(otherREProfileAtMaxHydro, list("genProWind" = data))
# 02 Solar ####
data<-
  genProSolar %>% 
  pivot_longer(-measurementname, names_to = "time", values_to = "gen_mw") %>%
  pivot_wider(names_from = "measurementname", values_from = "gen_mw") %>% 
  mutate(total = select(., !c(time)) %>% rowSums(., na.rm = T)) %>% 
  select(time, total)

otherREProfileAtMaxHydro <- c(otherREProfileAtMaxHydro, list("genProSolar" = data))

# 03 Waste (industrial waste) ####

data<-
  genProWaste %>% 
  pivot_longer(-measurementname, names_to = "time", values_to = "gen_mw") %>%
  pivot_wider(names_from = "measurementname", values_from = "gen_mw") %>% 
  mutate(total = select(., !c(time)) %>% rowSums(., na.rm = T)) %>% 
  select(time, total)

otherREProfileAtMaxHydro <- c(otherREProfileAtMaxHydro, list("genProWaste" = data))

# 05 Biomass ####
data<-
  genProBiomass %>% 
  pivot_longer(-measurementname, names_to = "time", values_to = "gen_mw") %>%
  pivot_wider(names_from = "measurementname", values_from = "gen_mw") %>% 
  mutate(total = select(., !c(time)) %>% rowSums(., na.rm = T)) %>% 
  select(time, total)

otherREProfileAtMaxHydro <- c(otherREProfileAtMaxHydro, list("genProBiomass" = data))

# 06 Waste gas ####
data<-
  genProSppNonFirmWasteGas %>% 
  pivot_longer(-measurementname, names_to = "time", values_to = "gen_mw") %>%
  pivot_wider(names_from = "measurementname", values_from = "gen_mw") %>% 
  mutate(total = select(., !c(time)) %>% rowSums(., na.rm = T)) %>% 
  select(time, total)

otherREProfileAtMaxHydro <- c(otherREProfileAtMaxHydro, list("genProSppNonFirmWasteGas" = data))

#7 MiniHydro ####
data<-
  genProMiniHydro %>% 
  pivot_longer(-measurementname, names_to = "time", values_to = "gen_mw") %>%
  pivot_wider(names_from = "measurementname", values_from = "gen_mw") %>% 
  mutate(total = select(., !c(time)) %>% rowSums(., na.rm = T)) %>% 
  select(time, total)

otherREProfileAtMaxHydro <- c(otherREProfileAtMaxHydro, list("genProMiniHydro" = data))

#8 Black Liquor ####
data<-
  genProBlackLiq %>% 
  pivot_longer(-measurementname, names_to = "time", values_to = "gen_mw") %>%
  pivot_wider(names_from = "measurementname", values_from = "gen_mw") %>% 
  mutate(total = select(., !c(time)) %>% rowSums(., na.rm = T)) %>% 
  select(time, total)

otherREProfileAtMaxHydro <- c(otherREProfileAtMaxHydro, list("genProBlackLiq" = data))

ls(otherREProfileAtMaxHydro)

# genProREAtMaxHydro <-
  otherREProfileAtMaxHydro %>%   
  purrr::reduce(join_all, by = c(colnames(.)))
  
  Reduce(function(...) merge(..., all=T), otherREProfileAtMaxHydro)