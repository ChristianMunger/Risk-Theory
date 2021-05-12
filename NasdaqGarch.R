library(fGarch)
data = read.csv("~/Documents/NASDAQdaily2021.csv")
prices = data$Adj.Close
date=as.Date(data[,1])

logret = diff(log(prices))

plot(date,prices,type='l',main="NASDAQ Stock 1/09/1998 - 1/15/2021",ylab="Prices",xlab="Year")
plot(date[-1],logret,type='l',main="NASDAQ Stock 1/10/1998 - 1/15/2021",ylab="Log Returns",xlab="Year")

gg <- garchFit(data=logret,include.mean = F) #fit Garch(1,1) model

gg

gg@fit

gg@fit$params$params

mu = gg@fit$params$params[1]
omega = gg@fit$params$params[2]
alpha1 = gg@fit$params$params[3]
beta1 = gg@fit$params$params[5]

resids = (logret-mu)/gg@sigma.t  #gg@sigma.t gives estimated standard deviations

plot(gg)

#forcast volatility
sigma.now = gg@sigma.t[length(gg@sigma.t)]
sigma.next = sqrt(omega + alpha1*logret[length(logret)]^2+beta1*sigma.now^2)
