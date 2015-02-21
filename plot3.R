##Project2

setwd ("~/Coursera_Rcode/Exploratory_Data_Analysis/project2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


##Q3 Of the four types of sources indicated by the type 
#(point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999–2008 
#for Baltimore City? Which have seen increases in emissions from 1999–2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

#subset data (Baltimore city only)
p3 <- NEI[which(NEI$fips == "24510"),]
#sum
p3_plot<- aggregate(p3[c("Emissions")], list(type = p3$type, year = p3$year), sum)

library(ggplot2)
qplot(year, Emissions, data = p3_plot, facets = type~., geom = c("line"), method = "lm"
        , color = type , ylab = "Emissions (PM2.5) in tons", main = "Baltimore City Emission by type")

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()