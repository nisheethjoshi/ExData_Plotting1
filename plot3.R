raw.data <- read.csv("household_power_consumption.txt", sep=";", 
                     stringsAsFactors = FALSE, na.strings = "?")

raw.data$Date <- as.Date(raw.data$Date, format = "%d/%m/%Y")
data <- subset(raw.data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(raw.data) 

data$datetime  <- as.POSIXct(paste(data$Date, data$Time, sep=" "))

par(mfrow=c(1,1))
with(data, {
  plot(Sub_metering_1~datetime, type="l", col="black", ylab = "Energy sub metering", xlab="")
  lines(Sub_metering_2~datetime, type="l", col="red")
  lines(Sub_metering_3~datetime, type="l", col="blue")
})
legend("topright", col = c("black", "red", "blue"), lty=c(1,1), lwd=c(1,1), cex=0.75,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()

