dir()
Source_Classification_Code <- read.table("C:/Users/hizba/Downloads/exdata_data_NEI_data/Source_Classification_Code.rds", header=TRUE, quote="\"")
View(Source_Classification_Code)
summarySCC_PM25 <- read.table("C:/Users/hizba/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds", header=TRUE, quote="\"")
View(summarySCC_PM25)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emissions_by_year <- NEI %>%
     group_by(year) %>%
     summarize(total_emissions = sum(Emissions))
 
with(emissions_by_year, barplot(total_emissions, names.arg = year, xlab = "Year", ylab = "PM2.5 Emissions", main = "Total PM2.5 Emissions over the Years"))
 
dev.copy(png,'plot1.png') 
dev.off()
