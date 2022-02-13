#Creating a datafile for analysis

library(dplyr)
library(ggplot2)
library(tidyr)
library(tidyverse)


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

