##Project2

setwd ("~/Coursera_Rcode/Exploratory_Data_Analysis/project2")


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Q1 Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all sources
#for each of the years 1999, 2002, 2005, and 2008.

##summary
unique(NEI$year)  #1999 2002 2005 2008

#cal total emission by year
p1 <- aggregate(Emissions ~ year, NEI, sum)

#set to display only one row and one column
par(mfrow = c(1,1))

#set margin
par(mar = c(4,4.5,2,2))

p1$Emissions = as.numeric(p1$Emissions)

##plot
plot(p1, type = "l", col = "red", main = "Total PM2.5 Emission",xlab = "Year", 
     ylab = "Emissions (PM2.5) in tons")

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()