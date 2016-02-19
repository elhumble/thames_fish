# prepare files

library(dplyr)
require(xts)

tilbury <- read.csv("data/raw/abundancedata.csv", header=T) %>%
        mutate(Effort = Nets * Hours, CPUE = N/Effort) %>%
        mutate(Month = gsub("(^[0-9]{2}/|/[0-9]{4}$)", "", Date), 
               Year = gsub("(^[0-9]{2}/[0-9]{2}/|$)", "", Date)) %>%
        mutate(Date = (as.Date(Date, format = "%d/%m/%Y")))
        

lengths <- read.csv("data/raw/lengthdata.csv", header=TRUE) %>%
        mutate(Month = gsub("(^[0-9]{2}/|/[0-9]{4}$)", "", Date), 
               Year = gsub("(^[0-9]{2}/[0-9]{2}/|$)", "", Date)) %>%
        mutate(Date = (as.Date(Date, format = "%d/%m/%Y")))