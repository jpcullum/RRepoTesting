#Creating a datafile for analysis

library(dplyr)
library(ggplot2)
library(tidyr)
library(tidyverse)
library(sn)


#here we want to design and create a datafile that simulates natural patterns
#then, we can investigate visually, and then create an ML model off of
#this should be large, large enough to split into building and testing phases
#it should incorporate multiple variables that relate, and should hold a temporal aspect
#we should be able to run PCA tests off of it as well

#Columns:
#unique sample identifier
#data
#value of several variables

#we may also want to play with built in datafiles, such as mtcars
#the problem there is I do not want to replicate work done by others
#this is to show my work, and I cannot copy and paste code for a
#datafile that I created myself

#let us work with something we are familiar with
#for example, let us work with well data
#here, we will have GPS data, depth data, and then values of certain fake elements tested
#we should create patterns based on location, depth and spatially

<<<<<<< HEAD
well.data <- data.frame(Sample.ID = as.character(c(1:10000)),
                        Data.Collected = as.character(runif(10000,0,364)),
                        Lat = as.numeric(runif(10000,38,42)),
                        Lng = as.numeric(runif(10000, 98,102)),
                        Depth.ft = as.numeric(runif(10000,42,700)),
                        Aquifer.ID = as.character(),
                        Compund.a = as.numeric(),
                        Compound.b = as.numeric(),
                        Compound.c = as.numeric())


#another method is to look at the current Kansas Geological Survey well data
#this provides us with some interesting data to look at, at least visually

KGS.well.data <- read.table("C:/Users/Josh_Test/Documents/R/DataFileswwc5_wells.txt", header=T,sep=",",dec=".")


nrow(KGS.well.data)
ncol(KGS.well.data)
str(KGS.well.data)


#really, here, we need ID, county, lat/long, use, comple_date, status, depth and static_depth

KGS.well.clean <- KGS.well.data %>% 
  select(WELL_ID, COUNTY, LONGITUDE, LATITUDE, WELL_USE, COMPLE_DATE, STATUS, WELL_DEPTH, STATIC_DEPTH) %>%
  mutate(COMPLE_DATE = as.Date(COMPLE_DATE, format = "%d-%b-%Y")) %>%
  mutate(COMPLE_YEAR = format(COMPLE_DATE, "%Y"))


summary(KGS.well.clean)
str(KGS.well.clean)

#let us look at the various types of use and status states
#then, we can look at the spread on dates and depths
#we can also see how many counties this encompasses, as there are 105 in Kansas

KGS.well.clean$WELL_USE[!duplicated(KGS.well.clean$WELL_USE)]
KGS.well.clean$STATUS[!duplicated(KGS.well.clean$STATUS)]

well.year <- KGS.well.clean %>% count(COMPLE_YEAR)

barplot(well.year$n, names.arg = well.year$COMPLE_YEAR, log = "y", 
        main = "Wells Completed by Year",
        ylab = "# of Wells")

hist(KGS.well.clean$WELL_DEPTH,breaks = 45,
     main = "Histogram of Well Depth",
     ylab = "# of Wells",
     xlab = "Depth (ft)")

#changes!

#=======
#>>>>>>> 0e0fd07202c1de7216d2836bc15ca1db74c4cf20

#cool beans?
#make sure to use git reset --soft HEAD~number of commits back
#in order to reset


