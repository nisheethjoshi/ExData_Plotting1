raw.data <- read.csv("household_power_consumption.txt", sep=";", 
                     stringsAsFactors = FALSE, na.strings = "?")


raw.data$Date <- as.Date(raw.data$Date, format = "%d/%m/%Y")
data <- subset(raw.data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(raw.data) 


data$datetime  <- as.POSIXct(paste(data$Date, data$Time, sep=" "))


par(mfrow=c(1,1))
with(data, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
                main="Global Active Power"))


dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
