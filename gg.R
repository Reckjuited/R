############################
#R visualization#
#Ran Hu#
#2018-1-17#

rm(list=ls())

#load datasets
library(titanic)
data("titanic_train",package="titanic")
titanic<-titanic_train

library(faraway)
data("worldcup")

#plot
library(ggplot2)
ggplot(data=titanic, aes(x=Fare))+
  geom_histogram()

#alternative ggplot(data=titanic) + geom_histogram(aes(x=Fare))
#or ggplot() + geom_histogram(data=titanic+aes(x=Fare))

#Call %>% pipe operator
library(stringr)
titanic %>%
  ggplot() +
  geom_histogram(aes(x=Fare))

#Geoms
ggplot(worldcup, aes(x=Time,y=Passes)) + geom_point()
ggplot(worldcup, aes(x=Time, y=Passes, color=Position, size=Shots)) + geom_point()


#dplyr

library(dplyr)
noteworthy_players <- worldcup %>% filter(Shots == max(Shots) |
                                            Passes == max(Passes)) %>% mutate(point_label = paste(Team, Position, sep = ", "))

ggplot(worldcup, aes(x = Passes, y = Shots)) +
  geom_point() +
  geom_text(data = noteworthy_players, aes(label = point_label),
            vjust = "inward", hjust = "inward")

ggplot(worldcup, aes(x=Time)) +
  geom_histogram(binwidth=10) +
  geom_vline(xintercept=90*0:6,
             color="blue",alpha=0.5)

#

