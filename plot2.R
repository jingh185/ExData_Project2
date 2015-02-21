

##Project2

setwd ("~/Coursera_Rcode/Exploratory_Data_Analysis/project2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Q2
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
#Use the base plotting system to make a plot answering this question.

##summary
unique(NEI$year)  #1999 2002 2005 2008

#subset data
p2 <- NEI[which(NEI$fips == "24510"),]

# Calculate the sume of emissions by year
p2_plot <- aggregate(Emissions ~ year, p2, sum)

#set to display only one row and one column
par(mfrow = c(1,1))

#set margin
par(mar = c(4,4.5,2,2))

#plot
plot(p2_plot, type = "l", col = "red", main = "Total PM2.5 Emission", xlab = "Year"
        ,ylab = "Emissions (PM2.5) in tons")

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()