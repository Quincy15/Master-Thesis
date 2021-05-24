library(zoo)
library(vars)
library(tseries)
library(readr)
library(plm)
library(earth)
library(urca)

macrodata_diff_logit <- read_csv("macrodata_diff_logit.csv");View(macrodata_diff_logit)

#subsetting X, needs to leave out row 1 and several columns
#because 2020 is not a unique year, so the last 8 points must be leave out  
Xdata1 <- as.matrix(macrodata_diff_logit[-1,c(1,2,3,5,7,9,10,11,13,15,16,18)])
purtest(Xdata1,test = c("levinlin"),exo = c("trend"),lags = c("AIC"),pmax = 10)
X_data <- ts(Xdata1, start = c(2004,2),frequency=4)
y_ds <- as.vector(macrodata_diff_logit$大商logit[-1])
y_gs <- as.vector(macrodata_diff_logit$股商logit[-1])
dsdata <- cbind(X_data, y_ds)
dsdata_sub <- dsdata[,-c(6,7,10,12)]
gsdata <- cbind(X_data, y_gs)


#VAR模型建模
var <- VAR(dsdata_sub, ic="AIC", lag.max=5)
summary(var)
预测好像forecast就行
  #第二种
VARselect(dsdata_sub, lag.max = 8, type = "both")

#MARS
mars <- earth(,)


#using 2019 data to compare the model
y_ds <- as.vector(macrodata_diff_logit$大商logit[-c(1,60:67)])
dsdata <- cbind(X_data[-c(60:67),], y_ds)