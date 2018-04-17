
####UW Biostatistics 561####
# Ran
# HUE HUE HUE

rm(list=ls())

#function
my_function <- function(data) {
  med <- median(data,na.rm=TRUE)
  mea <- mean(data,na.rm=TRUE)
  nas <- sum(is.na(data))
  out <- data.frame("median"=med, "mean" = mea, "NAs"= nas)
  stripchart(data)
  abline(v=med)
  abline(v=mea)
  print(out)
}

#Test the function
set.seed(1234)
my_data <- c(rgamma(50,shape=5,rate=1),NA)
my_function(my_data)

starwars %>% group_by(species) %>% summarise(n = n(),
                                             mean.mass = mean(mass, na.rm = TRUE),
                                             sd.mass = sd(mass, na.rm = TRUE)) %>% filter(n > 2)