
##Project2

setwd ("~/Coursera_Rcode/Exploratory_Data_Analysis/project2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


##Q4 Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

#Create a vector containing list of coal combustion-related SCC shortname. 
# Shortname contains both coal and combustion would be selected
coal_combustion <- grep("coal.*combustion", SCC$"Short.Name", ignore.case=T)
#Get SCC ID based on above vector
subset <- SCC[coal_combustion,]

#Get emssions based on SCC ID
p4 <- NEI[(NEI$SCC %in% subset$SCC), ]

p4_plot <- aggregate(Emissions ~ year, p4, sum)


qplot(year, Emissions, data = p4_plot, geom = c("line"), method = "lm", col = "red"
      ,ylab = "Emissions (PM2.5) tons", main = "Coal Combustion Emissions")

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()