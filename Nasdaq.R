dataset = read.csv("C:\\Users\\cmunger\\Downloads\\NASDAQdaily2021.csv")
dataset
dataset[1,]
date=as.Date(dataset[,1])
nas = dataset[,6]

plot(Adj.Close, type = 'l')
plot(date,nas,main="NASDAQ Prices (1/9/1998-1/15/2021)",ylab ="price",xlab="",type='l')
abline(v=as.numeric(date[5274]), col=2)  #Dec 14, 2018
abline(v=as.numeric(date[2702]), col=2)  #Oct 6, 2008
plot(date[1:1297],nas[1:1297],main="NASDAQ Prices (1/9/1998-3/10/2003)",ylab ="price",xlab="",type='l')
abline(v=as.numeric(date[548]), col=2)  #March 10, 2000
abline(v=as.numeric(date[1194]), col=2)  #Oct 9, 2002
plot(date,nas,main="NASDAQ Prices (1/9/1998-1/15/2021)",ylab ="price",xlab="",type='l')
plot(date[5531:5793],nas[5531:5793],main="NASDAQ Prices (1/2/2020-1/15/2021)",ylab ="price",xlab="",type='l')
abline(v=as.numeric(date[5563]), col=2)  #Feb 19, 2020
abline(v=as.numeric(date[5586]), col=2)  #March 23, 2020

plot(date,log(nas),main="Nasdaq Log Prices (1/9/1998-1/15/2021)",ylab ="log price",xlab="",type='l')

logret = diff(log(nas))

plot(date[-1],logret,main="Nasdaq Logreturns (1/9/1998-1/15/2021)",ylab ="log return",xlab="",type='l')

mean(logret)
var(logret)

nasdaqsorted = sort(nas)
plot(nasdaqsorted,type='l')
nasdaqsorted
length(nasdaqsorted)
.05*length(nasdaqsorted)
nasdaqsorted[1:290]
mean(nasdaqsorted[1:290])

logretsorted = sort(logret)
plot(logretsorted,type='l')
logretsorted
length(logretsorted)
.05*length(logretsorted)
logretsorted[1:290]
mean(logretsorted[1:290])

