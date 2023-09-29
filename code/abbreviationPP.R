# Max Gen profile at Q3 2566 29 AUG 2023

egatWind <- c("LTKW2-N LINE   KYT-LTKW2-N (MW)")
nonFirmWind <- c("ZZ_NCC  KEY    R1_FKW-N(MW)", 
                 "KRT-N   STN    KRT-N-NCC (MW)", 
                 "KWP-N   STN    KWP-N-NCC (MW)",
                 "CYPW-N  STN    CYPW-N-NCC (MW)",
                 "WTB-N   STN    WTB-N_GEN (MW)",
                 "ZZ_NCC  KEY    R2_WED(MW)",
                 "HKH1-N  STN    HKH1-N_NCC (MW)",
                 "HKH2-N  STN    HKH2-N_NCC (MW)",
                 "HKH3-N  STN    HKH3-N_NCC (MW)",
                 "GNP-N   STN    GNP-N_GEN (MW)",
                 "KWE-N   STN    KWE-N_GEN (MW)",
                 "KRST-N  STN    KRST-N_GEN (MW)",
                 "TPCW-N  STN    TPCW-N_NCC (MW)",
                 "TPRW-N  STN    TPRW-N_GEN (MW)",
                 "KSNW-N  STN    KSNW-N_GEN (MW)",
                 "NYKD-N  STN    NYKD-N_NCC (MW)",
                 "NYKW-N  STN    NYKW-N_NCC (MW)",
                 "KRO-N   STN    KRO-N_GEN (MW)",
                 "PND-N   STN    PND-N_NCC (MW)",
                 "BJRD-N  STN    BJRD-N_NCC (MW)",
                 "WC-N    STN    WC-N_GEN (MW)",
                 "BCHD-N  STN    BCHD-N_GEN (MW)")

# ยังไม่ profile ของ ผาบองโซล่า as of 29 Sep 2023
egatSolar <- c("ZZ_NCC  KEY    R1_TSK-PV(MW)",
               "ZZ_NCC  CAL    SRD-PV3(MW)")

sppFirmSolar <- c("SSH-F   STN    SSH-F_NCC (MW)")

sppNonFirmSolar <- c("ZZ_NCC  KEY    R1_NED-N(MW)",
                     "ZZ_NCC  KEY    MCC_BCP-N(MW)",
                     "EAN-N   STN    EAN-N-NCC (MW)",
                     "SSP-N   STN    GEN (MW)",
                     "ZZ_NCC  KEY    R4_EAL-N(MW)",
                     "SPP6    STN    SPP6-NCC (MW)",
                     "EAP-N   STN    EAP-N-NCC (MW)")

sppNonFirmWaste <- c("TPI-N1  STN    TPI-N1-NCC (MW)",
                     "TPI-N2  STN    TPI-N2-NCC (MW)",
                     "TPI-N3  STN    TPI-N3-NCC (MW)")

sppNonFirmBiogas <- c("ZZ_NCC  KEY    R4_UACE-N(MW)")

sppFirmPaddyHusk <- c("TPS     STN    TPS-NCC (MW)",
                      "ZZ_NCC  KEY    BMP(MW)",
                      "RE1     STN    GPP-NCC(MW)",
                      "ATB-F   STN    ATB-F-NCC (MW)",
                      "SU2     STN    MGP-NCC(MW)",
                      "MGB     STN    MGB-NCC (MW)",
                      "ACES-F  STN    ACES-F_GEN (MW)")

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

sppFirmBiomass <- c("SMP     STN    AA#1-NCC (MW)",
                    "BYBP-F  STN    BYBP-F_GEN (MW)",
                    "UTGP-F  STN    GEN (MW)",
                    "MPBV-F  STN    GEN (MW)",
                    "TPE-F   STN    TPE-F_GEN (MW)",
                    "KI-F    STN    KI-F_GEN (MW)",
                    "TSH-F   STN    GEN (MW)")

sppFirmParawood <- c("YLG-F   GEN    GEN#1 (NMW)")

sppNonFirmParawood <- c("GCG-N   STN    GEN (MW)",
                        "PTNG-N  STN    GEN (MW)")

sppFirmPalm <- c("SRT     STN    SGEC-PEA(MW)")

sppNonFirmWasteGas <- c("ZZ_NCC  KEY    R1_TCB-N(MW)")

sppNonFirmHydro <- c("ZZ_NCC  CAL    R1_DEDE-N(MW)")

sppFirmBlackLiquor <- c("SMP     STN    AA#2-NCC (MW)")