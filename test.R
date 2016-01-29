library(shiny)
library(ggplot2)
library(reshape)

# Rely on the 'AirPassengers' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

# Convert 'AirPassengers' which is in ts class to matrix then dataframe 
dmn <- list(month.abb, unique(floor(time(AirPassengers))))
dfAP<-as.data.frame(t(matrix(AirPassengers, 12, dimnames = dmn)))

#making Year as one of the variables
dfAP1<-cbind(dfAP,rownames(dfAP))
colnames(dfAP1)[13]<-"Year"

#'melt' the data frame into long format
dfAP2 <- melt(dfAP1, id.vars=c("Year"))
colnames(dfAP2)[2]<-"Month"

par(mfrow=c(2,2))

ggplot(dfAP2[dfAP2$Year=="1960",], aes(x=Month, y=value, fill=Month)) + 
  geom_bar(stat="identity")+theme_minimal() + facet_grid(.~Year) +
  labs(x="Month",y="Number of passengers (Thousands)")

ggplot(dfAP2, aes(x=Month, y=value, fill=Month)) + 
  geom_bar(stat="identity")+theme_minimal() + facet_grid(.~Year) +
  labs(x="Month",y="Number of passengers (Thousands)")

ggplot(dfAP2[dfAP2$Year=="1960",], aes(Month, value, group=Year, colour=Year)) + 
  geom_line() +
  labs(x="Month",y="Number of passengers (Thousands)")


ggplot(dfAP2, aes(Month, value, group=Year, colour=Year)) + 
  geom_line() +
  labs(x="Month",y="Number of passengers (Thousands)")

