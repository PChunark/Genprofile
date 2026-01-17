# Max Gen profile at Q1Q2 2568 29 JUN 2025
# 01 Wind ####
egatWind <- c("LTKW2-N KYT-LTKW2-N")
nonFirmWind <- c("ZZ_NCC  KEY    R1_FKW-N(MW)", # บริษัท เฟิร์ส โคราช วินด์ จำกัด
                 "KRT-N   STN    KRT-N-NCC (MW)", #บริษัท เค.อาร์.ทู จำกัด
                 "KWP-N   STN    KWP-N-NCC (MW)",#บริษัท เขาค้อ วินด์ พาวเวอร์ จำกัด
                 "CYPW-N  STN    CYPW-N-NCC (MW)",#บริษัท ชัยภูมิ วินด์ฟาร์ม จำกัด
                 "WTB-N   STN    WTB-N_GEN (MW)",# บริษัท วะตะแบก วินด์ จำกัด
                 "ZZ_NCC  KEY    R2_WED(MW)", # บริษัท พัฒนาพลังงานลม จำกัด (โครงการวายุวินด์ฟาร์ม)
                 "HKH1-N  STN    HKH1-N_NCC (MW)",# บริษัท อีเอ วินด์ หาดกังหัน 3 จำกัด (โครงการ 1)
                 "HKH2-N  STN    HKH2-N_NCC (MW)",# บริษัท อีเอ วินด์ หาดกังหัน 3 จำกัด (โครงการ 2)
                 "HKH3-N  STN    HKH3-N_NCC (MW)",# บริษัท อีเอ วินด์ หาดกังหัน 3 จำกัด (โครงการ 3)
                 "GNP-N   STN    GNP-N_GEN (MW)", # บริษัท อีเอ วินด์ หาดกังหัน 3 จำกัด (โครงการ 3)
                 "KWE-N   STN    KWE-N_GEN (MW)", # บริษัท โคราชวินด์เอ็นเนอร์ยี จำกัด
                 "KRST-N  STN    KRST-N_GEN (MW)", # บริษัท เค.อาร์.เอส.ทรี จำกัด
                 "TPCW-N  STN    TPCW-N_NCC (MW)", # บริษัท ทรอปิคอล วินด์ จำกัด
                 "TPRW-N  STN    TPRW-N_GEN (MW)", # บริษัท เทพารักษ์ วินด์ จำกัด
                 "KSNW-N  STN    KSNW-N_GEN (MW)", # บริษัท กฤษณา วินด์ พาวเวอร์ จำกัด
                 "NYKD-N  STN    NYKD-N_NCC (MW)", # บริษัท นายางกลัก พัฒนา จำกัด
                 "NYKW-N  STN    NYKW-N_NCC (MW)", # บริษัท นายางกลัก พลังลม จำกัด
                 "KRO-N   STN    KRO-N_GEN (MW)", # บริษัท เค.อาร์.วัน จำกัด
                 "PND-N   STN    PND-N_NCC (MW)", # บริษัท โป่งนก พัฒนา จำกัด
                 "BJRD-N  STN    BJRD-N_NCC (MW)", # บริษัท เบญจรัตน์ พัฒนา จำกัด
                 "WC-N    STN    WC-N_GEN (MW)", # บริษัท วินชัย จำกัด
                 "BCHD-N  STN    BCHD-N_GEN (MW)") # บริษัท บ้านชวน พัฒนา จำกัด

# 02 Solar ####
# ยังไม่ profile ของ ผาบองโซล่า as of 29 June 2025
egatSolar <- c("ZZ_NCC  KEY    R1_TSK-PV(MW)", # ทับสะแก ชุดที่ 1
               "ZZ_NCC  CAL    SRD-PV3(MW)", # เขื่อนสิรินธร
               "UR-PV") # ทุ่นลอยน้ำร่วมกับโรงไฟฟ้าพลังน้ำเขื่อนอุบลรัตน์ ชุดที่ 1 

sppFirmSolar <- c("BASP-P_GEN", #บริษัท บรีซแอนด์ไชน์ เพาเวอร์ จำกัด
                  "SLD-P_GEN", # บริษัท พัฒนาโซลาร์ จำกัด
                  "SSH-F   STN    SSH-F_NCC (MW)") # บริษัท ซุปเปอร์ โซล่าร์ เอนเนอร์ยี จำกัด

sppNonFirmSolar <- c("STPH-NGEN (MW)", # บริษัท แสงไทยพลังงาน จำกัด
                     "SKYP-N_GEN", # บริษัท สกาย เพาเวอร์ จำกัด
                     "PRR-N_GEN", # บริษัท พลังงานรุ่งเรือง จำกัด
                     "NED-N_GEN", # บริษัท พัฒนาพลังงานธรรมชาติ จำกัด
                     "ZZ_NCC  KEY    MCC_BCP-N(MW)",
                     "EAN-N   STN    EAN-N-NCC (MW)",
                     "SSP-N   STN    GEN (MW)",
                     "ZZ_NCC  KEY    R4_EAL-N(MW)",
                     "SPP6    STN    SPP6-NCC (MW)",
                     "EAP-N   STN    EAP-N-NCC (MW)")

# 03 Waste (industrial waste) ####
sppNonFirmWaste <- c("TPI-N1  STN    TPI-N1-NCC (MW)",
                     "TPI-N2  STN    TPI-N2-NCC (MW)",
                     "TPI-N3  STN    TPI-N3-NCC (MW)")

# 05 Biomass ####
## 05.1 Paddy husk ####
sppFirmPaddyHusk <- c("TPS     STN    TPS-NCC (MW)",
                      "ZZ_NCC  KEY    BMP(MW)",
                      "RE1     STN    GPP-NCC(MW)",
                      "ATB-F   STN    ATB-F-NCC (MW)",
                      "SU2     STN    MGP-NCC(MW)",
                      "MGB     STN    MGB-NCC (MW)",
                      "ACES-F  STN    ACES-F_GEN (MW)")

## 05.2 Bagasse ####
sppFirmBagasse <- c("DCB     STN    DCB-NCC (MW)",
                    "MP1     STN    MP1 (MW)",
                    "KKS     STN    KKS-NCC(MW)",
                    "DCB     STN    DCB#2 (MW)",
                    "KPP-N   STN    KPP-N-NCC (MW)",
                    "MPBL-F2 STN    GEN (MW)",
                    "SUE-F   STN    SUE_GEN (MW)")

sppNonFirmBagasse <- c("SRY-N   STN    GEN (MW)",
                       "GKBI-N  STN    GEN (MW)",
                       "ZZ_NCC  KEY    R2_SMP-N(MW)",
                       "ZZ_NCC  KEY    R1_SRM-N(MW)",
                       "ZZ_NCC  KEY    R1_SSR-N(MW)",
                       "ZZ_NCC  KEY    R4_TRI-N(MW)",
                       "ZZ_NCC  KEY    R2_SNM-N(MW)",
                       "ZZ_NCC  KEY    R1_KKS-N2(MW)",
                       "ZZ_NCC  KEY    R1_DCB-N(MW)",
                       "ZZ_NCC  KEY    R2_KBE-N(MW)",
                       "ZZ_NCC  KEY    R4_KTB-N(MW)",
                       "ZZ_NCC  KEY    R1_ESE-N(MW)",
                       "ZZ_NCC  KEY    R4_UBE-N(MW)",
                       "ZZ_NCC  KEY    R1_TRE-N(MW)",
                       "ZZ_NCC  KEY    R4_TEP-N(MW)",
                       "ZZ_NCC  KEY    R4_RPBP-N(MW)",
                       "ZZ_NCC  KEY    R1_ESE2-N(MW)",
                       "MPBL-N1 STN    GEN (MW)",
                       "RPBP2-N STN    GEN (MW)")
## 05.3 Biomass (not specify) ####
sppFirmBiomass <- c("SMP     STN    AA#1-NCC (MW)",
                    "BYBP-F  STN    BYBP-F_GEN (MW)",
                    "UTGP-F  STN    GEN (MW)",
                    "MPBV-F  STN    GEN (MW)",
                    "TPE-F   STN    TPE-F_GEN (MW)",
                    "KI-F    STN    KI-F_GEN (MW)",
                    "TSH-F   STN    GEN (MW)")

## 05.4 Parawood (scrap) ####
sppFirmParawood <- c("YLG-F   GEN    GEN#1 (NMW)")

sppNonFirmParawood <- c("GCG-N   STN    GEN (MW)",
                        "PTNG-N  STN    GEN (MW)")

## 05.5 Palm ####
sppFirmPalm <- c("SRT     STN    SGEC-PEA(MW)")

#6 Waste gas ####
sppNonFirmWasteGas <- c("ZZ_NCC  KEY    R1_TCB-N(MW)")

#7 Mini Hydro ####
sppNonFirmHydro <- c("ZZ_NCC  CAL    R1_DEDE-N(MW)")

#8 Black Liquor ####
sppFirmBlackLiquor <- c("SMP     STN    AA#2-NCC (MW)")