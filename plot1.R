library("data.table")

setwd("C:/Users/Quan Nguyen/OneDrive/Work/Self-Studies/DataScience-Coursera/DS_Specialization_JohnsHopkinsUni/TheDataScientistsToolbox/datasciencecoursera/Exploratory_Data_Analysis")

#Importing data
powerDT <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# Prevents histogram from printing in scientific notation
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Changing Date Column to Date Type
powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
powerDT <- powerDT[(Date >= "2007-02-01") & (Date < "2007-02-03")]

png("plot1.png", width=480, height=480)

## Plot 1
hist(powerDT[, Global_active_power], main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="deepskyblue3")

dev.off()
