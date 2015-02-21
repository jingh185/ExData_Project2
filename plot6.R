
setwd ("~/Coursera_Rcode/Exploratory_Data_Analysis/project2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
# in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

#subset data (Baltimore city or California )
p6 <- NEI[which(NEI$fips == "24510" | NEI$fips == "06037"),]  

# create city data frame
city <- data.frame(fips=c("06037","24510"),
                   city=c("California","Baltimore City"))

#Adding city names
p6_city <-  merge(p6,city,by.x="fips", by.y = "fips" )

#Get the SCC number based on motor vehicle sources (I choose catagory is Onroad)
veh_data <- SCC[which(SCC$Data.Category == "Onroad"), c("SCC","Data.Category") ]

#Using merge to only get emissions where SCC is matching to veh_data
p6_merge <-  merge(p6_city,veh_data,by.x="SCC", by.y = "SCC" )


#final dataset for plot
p6_plot <- aggregate(p6_merge[c("Emissions")], list(type = p6_merge$city, year = p6_merge$year), sum)

library(ggplot2)
qplot(year, Emissions, data = p6_plot, facets = type~., geom = c("line"), method = "lm"
      , color = type , ylab = "Emissions (PM2.5) in tons", xlab = "Year",
      main = "Baltimore City & California motor vehicle emssiions")


dev.copy(png, file = "plot6.png", width = 480, height = 480)
dev.off()
