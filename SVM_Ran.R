########################################
#SVM Model#
#Ran Hu#


#Clear Environment
rm(list=ls())

library(e1071)
#Load Dataset
SVMdata <- read.csv("UCI_Credit_Card.csv")
library(reshape)
SVMdata <- rename(SVMdata, c(default.payment.next.month="y"))
SVMdata$y <-as.factor(SVMdata$y)


#Divide original dataset into training and testing datasets.
x<-runif(nrow(SVMdata))
SVMtrain<-SVMdata[x>=0.2,]
SVMtest<-SVMdata[x<0.2,]

#Search for the best parameters of c and g.

#tuned <- tune.svm(y ~., data = SVMtrain, type="C-classification",kernel="radial",gamma=10^(-4:1),cost = 10^(0:2),scale=TRUE) # tune
#summary (tuned) 

#SVM model
svm_model<-svm(y~. , data=SVMtrain, cost=10, gamma=0.001)
svm_pred<-predict(svm_model, SVMtest)
summary(svm_model)
svm_pred
table(svm_pred)

table(svm_pred, SVMtest$y)
classAgreement(table(svm_pred, SVMtest$y))