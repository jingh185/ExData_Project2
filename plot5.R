
##Project2

setwd ("~/Coursera_Rcode/Exploratory_Data_Analysis/project2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Q5 How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

#subset data (Baltimore city only)
p5 <- NEI[which(NEI$fips == "24510"),]  

#Get the SCC number based on motor vehicle sources (I choose catagory is Onroad)
veh_data <- SCC[which(SCC$Data.Category == "Onroad"), c("SCC","Data.Category") ]

#Using merge to only get emissions where SCC is matching to veh_data
p5_merge <-  merge(p5,veh_data,by.x="SCC", by.y = "SCC" )

p5_plot <- aggregate(Emissions ~ year, p5_merge, sum)

library(ggplot2)
qplot(year, Emissions, data = p5_plot, geom = c("line"),col = "red"
      ,ylab = "Emissions (PM2.5) tons", main = "Baltimore City motor vehicle emissions")
