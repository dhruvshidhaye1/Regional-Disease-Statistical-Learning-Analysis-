
data <- cause_of_deaths

#exploring frequencies
table(data$Country.Territory)
table(data$Parkinson.s.Disease)
table(data$Tuberculosis)

dataX <- data[data$Country.Territory == "India", ]
explore(dataX$Diabetes.Mellitus)
plot(dataX$Year, dataX$Diabetes.Mellitus, xlab = "year", ylab = "diabetes in india")
lineOfBestFit <- lm(Diabetes.Mellitus~Year, data=dataX)
abline(lineOfBestFit, col="red")

dataY <- data[data$Country.Territory == "Pakistan", ]
explore(dataY$Diabetes.Mellitus)
plot(dataY$Year, dataY$Diabetes.Mellitus, xlab = "year", ylab = "diabetes in pakistan")
lineOfBestFit <- lm(Diabetes.Mellitus~Year, data=dataY)
abline(lineOfBestFit, col="blue")

dataZ <- data[data$Country.Territory == "Spain", ]
explore(dataZ$Diabetes.Mellitus)
plot(dataZ$Year, dataZ$Diabetes.Mellitus, xlab = "year", ylab = "diabetes in Spain")
lineOfBestFit <- lm(Diabetes.Mellitus~Year, data=dataZ)
abline(lineOfBestFit, col="cyan")

#Russia
dataB <- data[data$Country.Territory == "Russia", ]
explore(dataB$Diabetes.Mellitus)
plot(dataB$Year, dataB$Diabetes.Mellitus, xlab = "year", ylab = "diabetes in russia")
lineOfBestFit <- lm(Diabetes.Mellitus~Year, data=dataB)
abline(lineOfBestFit, col="purple")

#Costa Rica
dataB <- data[data$Country.Territory == "Costa Rica", ]
explore(dataB$Diabetes.Mellitus)
plot(dataB$Year, dataB$Diabetes.Mellitus, xlab = "year", ylab = "diabetes in cr")
lineOfBestFit <- lm(Diabetes.Mellitus~Year, data=dataB)
abline(lineOfBestFit, col="purple")

india <- data[data$Country.Territory == "India", ]
china <- data[data$Country.Territory == "China", ]
india_explore <- explore(india$Acute.Hepatitis)
china_explore <- explore(china$Acute.Hepatitis)
sd_in_ch <- sqrt(india_explore[3]^2/india_explore[4] + china_explore[3]^2/china_explore[4])
z_score <- (india_explore[1]-china_explore[1])/sd_in_ch
z_score            
1-pnorm(z_score) 
