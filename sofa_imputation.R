################################################################################
### MaastrICCht cohort
### Auteur: Sander van Kuijk & Frank van Rosmalen
###
### Doel project: Predictie mortaliteit na IC-opname o.b.v. SOFA dag 1-5/7
### Doel syntax: multilevel imputatie van SOFA data
###
### Start: 30/11/2021
### Laatste aanpassing: 30/11/2021
###
### sessionInfo()
###
### R version 4.0.4 (2021-02-15)
### Platform: x86_64-w64-mingw32/x64 (64-bit)
### Running under: Windows 10 x64 (build 19042)
###
### Matrix products: default
###
### locale:
### [1] LC_COLLATE=English_Netherlands.1252  LC_CTYPE=English_Netherlands.1252
### [3] LC_MONETARY=English_Netherlands.1252 LC_NUMERIC=C
### [5] LC_TIME=English_Netherlands.1252
###
### attached base packages:
### [1] stats     graphics  grDevices utils     datasets  methods   base
###
### loaded via a namespace (and not attached):
### [1] compiler_4.0.4
################################################################################

library(mice)

## Databestand gecreeerd met sofa_data.R inlezen
# setwd("C:/Users/sande/Documents/Werk/sofa/data")
load("./Data/sofa_data.Rda")

# setwd("C:/Users/sande/Documents/Werk/sofa/figs")
png("./Figs/missing_pattern.png", width = 400, height = 900, pointsize = 16)
md.pattern(d[, 237:244], rotate.names = TRUE)
dev.off()

## Overbodige variabelen direct verwijderen
keep <- c("Record.Id", "BMI", "gender", "age", "sepsis", "CHC.Diabetes",
          "CHC.Chronic_Kidney_Disease", "CHC.Malignancy", "CHC.Liver_disease",
          "CHC.Chronic_lung_disease", "CHC.Myocardial_infaction",
          "CHC.Congestive_Heart_Faillure", "CHC.Peripheral_vascular_disease",
          "CHC.CVA_or_TIA", "CHC.Dementia", "CHC.Connective_tissue_disease",
          "CHC.Peptic_ulcer_disease", "CHC.Hemiplegia", "CHC.Immunosuppression",
          "ICU_mortality", "HR_low", "HR_high", "RR_low", "RR_high", "temp_low",
          "temp_high", "systolicBP_low", "systolicBP_high", "MAP_low", "MAP_high",
          "urine_output", "fluid_balance", "GCS", "sodium", "potassium", "lactate",
          "ureum", "creatinine", "AF_daily", "yGT", "ASAT", "ALAT", "LD_daily",
          "bilirubine", "CK_daily", "hstnt", "CKmb", "NTproBNP", "CRP", "Albumine",
          "ferritine", "glucose_low", "glucose_high", "WBC", "Hb_", "Ht_low",
          "trombocytes", "PT_", "APTT", "fibrinogen", "D_dimer", "lymfo_abs",
          "steroids", "vasopressors", "nor", "adrenaline", "dobutamine",
          "dopamine", "musclerelax", "analgesia", "PF_low", "PaCO2_low",
          "PaO2_low", "FiO2_low", "PF_high", "PaCO2_high", "PaO2_high",
          "FiO2_high", "vent_mode", "FiO2_ventSettings", "Vfrequency", "Pins",
          "PEEP", "Vtidal", "PIP", "Cdyn", "ECMO", "pH_", "PaCO2", "PaO2", "dag",
          "SOFA_resp", "SOFA_coag", "SOFA_live", "SOFA_card", "SOFA_neur",
          "SOFA_rena", "SOFA_score")

d <- d[, names(d) %in% keep]

## Class van variabelen checken en aanpassen waar nodig
lapply(d, class)

d$age <- as.numeric(d$age)
d$sepsis <- as.numeric(ifelse())

ini <- mice(d, maxit = 0)
pre <- ini$pred
pre
### Einde file.
