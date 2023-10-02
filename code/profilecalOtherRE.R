otherREProfileAtMaxHydro <- list()
# 01 Wind ####
data<-
  genProWind %>% 
  pivot_longer(-measurementname, names_to = "time", values_to = "gen_mw") %>%
  pivot_wider(names_from = "measurementname", values_from = "gen_mw") %>% 
  mutate(wind = select(., !c(time)) %>% rowSums(., na.rm = T)) %>% 
  select(time, wind)

otherREProfileAtMaxHydro <- c(otherREProfileAtMaxHydro, list("genProWind" = data))
# 02 Solar ####
data<-
  genProSolar %>% 
  pivot_longer(-measurementname, names_to = "time", values_to = "gen_mw") %>%
  pivot_wider(names_from = "measurementname", values_from = "gen_mw") %>% 
  mutate(solar = select(., !c(time)) %>% rowSums(., na.rm = T)) %>% 
  select(time, solar)

otherREProfileAtMaxHydro <- c(otherREProfileAtMaxHydro, list("genProSolar" = data))

# 03 Waste (industrial waste) ####

data<-
  genProWaste %>% 
  pivot_longer(-measurementname, names_to = "time", values_to = "gen_mw") %>%
  pivot_wider(names_from = "measurementname", values_from = "gen_mw") %>% 
  mutate(waste = select(., !c(time)) %>% rowSums(., na.rm = T)) %>% 
  select(time, waste)

otherREProfileAtMaxHydro <- c(otherREProfileAtMaxHydro, list("genProWaste" = data))

# 05 Biomass ####
data<-
  genProBiomass %>% 
  pivot_longer(-measurementname, names_to = "time", values_to = "gen_mw") %>%
  pivot_wider(names_from = "measurementname", values_from = "gen_mw") %>% 
  mutate(biomass = select(., !c(time)) %>% rowSums(., na.rm = T)) %>% 
  select(time, biomass)

otherREProfileAtMaxHydro <- c(otherREProfileAtMaxHydro, list("genProBiomass" = data))

# 06 Waste gas ####
data<-
  genProSppNonFirmWasteGas %>% 
  pivot_longer(-measurementname, names_to = "time", values_to = "gen_mw") %>%
  pivot_wider(names_from = "measurementname", values_from = "gen_mw") %>% 
  mutate(wastegas = select(., !c(time)) %>% rowSums(., na.rm = T)) %>% 
  select(time, wastegas)

otherREProfileAtMaxHydro <- c(otherREProfileAtMaxHydro, list("genProSppNonFirmWasteGas" = data))

#7 MiniHydro ####
data<-
  genProMiniHydro %>% 
  pivot_longer(-measurementname, names_to = "time", values_to = "gen_mw") %>%
  pivot_wider(names_from = "measurementname", values_from = "gen_mw") %>% 
  mutate(minihydro = select(., !c(time)) %>% rowSums(., na.rm = T)) %>% 
  select(time, minihydro)

otherREProfileAtMaxHydro <- c(otherREProfileAtMaxHydro, list("genProMiniHydro" = data))

#8 Black Liquor ####
data<-
  genProBlackLiq %>% 
  pivot_longer(-measurementname, names_to = "time", values_to = "gen_mw") %>%
  pivot_wider(names_from = "measurementname", values_from = "gen_mw") %>% 
  mutate(blackliquor = select(., !c(time)) %>% rowSums(., na.rm = T)) %>% 
  select(time, blackliquor)

otherREProfileAtMaxHydro <- c(otherREProfileAtMaxHydro, list("genProBlackLiq" = data))

ls(otherREProfileAtMaxHydro)

genProREAtMaxHydro <-
  otherREProfileAtMaxHydro %>%   
  purrr::reduce(full_join, by = "time") 

writexl::write_xlsx(genProREAtMaxHydro, path = "processdata/genProREAtMaxHydro.xlsx")
