stats1 <- read.csv(file.choose())

getwd()
setwd("C:\\Users\\smajl\\Documents\\Programming\\Practice\\R Programming Practice\\04_data-frames")
stats2 <- read.csv("Demographic-Data.csv")

######################
nrow(stats2)
ncol(stats2)
head(stats2)
tail(stats2, n = 10)

# str(), runif()
str(stats2)
runif(stats2)
summary(stats2)

##################
stats2[3, 3]
stats2[3, "Birth.rate"]
stats2$Internet.users[2]
levels(stats2$Country.Code)


#################
stats2[, 1, drop = F]
stats2$new.col <- 1 # adding new column
stats2$xyz <- 1:5
stats2$xyz <- NULL # remove column


#################
# Filtering data
filter <- stats2$Internet.users < 2
stats2[filter, ]
stats2[stats2$Birth.rate > 40 & stats2$Internet.users < 2, ]
stats2[stats2$Income.Group == "High income", ]
stats2[stats2$Country.Name == "Malta", ]


################
# qplot()
?qplot
library(ggplot2)
colnames(stats2)
qplot(data = stats2, x = Internet.users)
qplot(data = stats2, x = Income.Group, y = Birth.rate)
qplot(
  data = stats2, x = Income.Group, y = Birth.rate,
  size = I(2),
  color = I("blue")
)
qplot(
  data = stats2, x = Income.Group, y = Birth.rate,
  size = I(2),
  geom = "boxplot"
)

qplot(data = stats2, x = Internet.users, y = Birth.rate)
qplot(
  data = stats2, x = Internet.users, y = Birth.rate,
  size = I(4)
)
qplot(
  data = stats2, x = Internet.users, y = Birth.rate,
  color = I("red"), size = I(4)
)
qplot(
  data = stats2, x = Internet.users, y = Birth.rate,
  color = Income.Group, size = I(5)
)


#####################
Countries_2012_Dataset <- c("Aruba", "Afghanistan", "Angola", "Albania", "United Arab Emirates", "Argentina", "Armenia", "Antigua and Barbuda", "Australia", "Austria", "Azerbaijan", "Burundi", "Belgium", "Benin", "Burkina Faso", "Bangladesh", "Bulgaria", "Bahrain", "Bahamas, The", "Bosnia and Herzegovina", "Belarus", "Belize", "Bermuda", "Bolivia", "Brazil", "Barbados", "Brunei Darussalam", "Bhutan", "Botswana", "Central African Republic", "Canada", "Switzerland", "Chile", "China", "Cote d'Ivoire", "Cameroon", "Congo, Rep.", "Colombia", "Comoros", "Cabo Verde", "Costa Rica", "Cuba", "Cayman Islands", "Cyprus", "Czech Republic", "Germany", "Djibouti", "Denmark", "Dominican Republic", "Algeria", "Ecuador", "Egypt, Arab Rep.", "Eritrea", "Spain", "Estonia", "Ethiopia", "Finland", "Fiji", "France", "Micronesia, Fed. Sts.", "Gabon", "United Kingdom", "Georgia", "Ghana", "Guinea", "Gambia, The", "Guinea-Bissau", "Equatorial Guinea", "Greece", "Grenada", "Greenland", "Guatemala", "Guam", "Guyana", "Hong Kong SAR, China", "Honduras", "Croatia", "Haiti", "Hungary", "Indonesia", "India", "Ireland", "Iran, Islamic Rep.", "Iraq", "Iceland", "Israel", "Italy", "Jamaica", "Jordan", "Japan", "Kazakhstan", "Kenya", "Kyrgyz Republic", "Cambodia", "Kiribati", "Korea, Rep.", "Kuwait", "Lao PDR", "Lebanon", "Liberia", "Libya", "St. Lucia", "Liechtenstein", "Sri Lanka", "Lesotho", "Lithuania", "Luxembourg", "Latvia", "Macao SAR, China", "Morocco", "Moldova", "Madagascar", "Maldives", "Mexico", "Macedonia, FYR", "Mali", "Malta", "Myanmar", "Montenegro", "Mongolia", "Mozambique", "Mauritania", "Mauritius", "Malawi", "Malaysia", "Namibia", "New Caledonia", "Niger", "Nigeria", "Nicaragua", "Netherlands", "Norway", "Nepal", "New Zealand", "Oman", "Pakistan", "Panama", "Peru", "Philippines", "Papua New Guinea", "Poland", "Puerto Rico", "Portugal", "Paraguay", "French Polynesia", "Qatar", "Romania", "Russian Federation", "Rwanda", "Saudi Arabia", "Sudan", "Senegal", "Singapore", "Solomon Islands", "Sierra Leone", "El Salvador", "Somalia", "Serbia", "South Sudan", "Sao Tome and Principe", "Suriname", "Slovak Republic", "Slovenia", "Sweden", "Swaziland", "Seychelles", "Syrian Arab Republic", "Chad", "Togo", "Thailand", "Tajikistan", "Turkmenistan", "Timor-Leste", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Tanzania", "Uganda", "Ukraine", "Uruguay", "United States", "Uzbekistan", "St. Vincent and the Grenadines", "Venezuela, RB", "Virgin Islands (U.S.)", "Vietnam", "Vanuatu", "West Bank and Gaza", "Samoa", "Yemen, Rep.", "South Africa", "Congo, Dem. Rep.", "Zambia", "Zimbabwe")
Codes_2012_Dataset <- c("ABW", "AFG", "AGO", "ALB", "ARE", "ARG", "ARM", "ATG", "AUS", "AUT", "AZE", "BDI", "BEL", "BEN", "BFA", "BGD", "BGR", "BHR", "BHS", "BIH", "BLR", "BLZ", "BMU", "BOL", "BRA", "BRB", "BRN", "BTN", "BWA", "CAF", "CAN", "CHE", "CHL", "CHN", "CIV", "CMR", "COG", "COL", "COM", "CPV", "CRI", "CUB", "CYM", "CYP", "CZE", "DEU", "DJI", "DNK", "DOM", "DZA", "ECU", "EGY", "ERI", "ESP", "EST", "ETH", "FIN", "FJI", "FRA", "FSM", "GAB", "GBR", "GEO", "GHA", "GIN", "GMB", "GNB", "GNQ", "GRC", "GRD", "GRL", "GTM", "GUM", "GUY", "HKG", "HND", "HRV", "HTI", "HUN", "IDN", "IND", "IRL", "IRN", "IRQ", "ISL", "ISR", "ITA", "JAM", "JOR", "JPN", "KAZ", "KEN", "KGZ", "KHM", "KIR", "KOR", "KWT", "LAO", "LBN", "LBR", "LBY", "LCA", "LIE", "LKA", "LSO", "LTU", "LUX", "LVA", "MAC", "MAR", "MDA", "MDG", "MDV", "MEX", "MKD", "MLI", "MLT", "MMR", "MNE", "MNG", "MOZ", "MRT", "MUS", "MWI", "MYS", "NAM", "NCL", "NER", "NGA", "NIC", "NLD", "NOR", "NPL", "NZL", "OMN", "PAK", "PAN", "PER", "PHL", "PNG", "POL", "PRI", "PRT", "PRY", "PYF", "QAT", "ROU", "RUS", "RWA", "SAU", "SDN", "SEN", "SGP", "SLB", "SLE", "SLV", "SOM", "SRB", "SSD", "STP", "SUR", "SVK", "SVN", "SWE", "SWZ", "SYC", "SYR", "TCD", "TGO", "THA", "TJK", "TKM", "TLS", "TON", "TTO", "TUN", "TUR", "TZA", "UGA", "UKR", "URY", "USA", "UZB", "VCT", "VEN", "VIR", "VNM", "VUT", "PSE", "WSM", "YEM", "ZAF", "COD", "ZMB", "ZWE")
Regions_2012_Dataset <- c("The Americas", "Asia", "Africa", "Europe", "Middle East", "The Americas", "Asia", "The Americas", "Oceania", "Europe", "Asia", "Africa", "Europe", "Africa", "Africa", "Asia", "Europe", "Middle East", "The Americas", "Europe", "Europe", "The Americas", "The Americas", "The Americas", "The Americas", "The Americas", "Asia", "Asia", "Africa", "Africa", "The Americas", "Europe", "The Americas", "Asia", "Africa", "Africa", "Africa", "The Americas", "Africa", "Africa", "The Americas", "The Americas", "The Americas", "Europe", "Europe", "Europe", "Africa", "Europe", "The Americas", "Africa", "The Americas", "Africa", "Africa", "Europe", "Europe", "Africa", "Europe", "Oceania", "Europe", "Oceania", "Africa", "Europe", "Asia", "Africa", "Africa", "Africa", "Africa", "Africa", "Europe", "The Americas", "The Americas", "The Americas", "Oceania", "The Americas", "Asia", "The Americas", "Europe", "The Americas", "Europe", "Asia", "Asia", "Europe", "Middle East", "Middle East", "Europe", "Middle East", "Europe", "The Americas", "Middle East", "Asia", "Asia", "Africa", "Asia", "Asia", "Oceania", "Asia", "Middle East", "Asia", "Middle East", "Africa", "Africa", "The Americas", "Europe", "Asia", "Africa", "Europe", "Europe", "Europe", "Asia", "Africa", "Europe", "Africa", "Asia", "The Americas", "Europe", "Africa", "Europe", "Asia", "Europe", "Asia", "Africa", "Africa", "Africa", "Africa", "Asia", "Africa", "Oceania", "Africa", "Africa", "The Americas", "Europe", "Europe", "Asia", "Oceania", "Middle East", "Asia", "The Americas", "The Americas", "Asia", "Oceania", "Europe", "The Americas", "Europe", "The Americas", "Oceania", "Middle East", "Europe", "Europe", "Africa", "Middle East", "Africa", "Africa", "Asia", "Oceania", "Africa", "The Americas", "Africa", "Europe", "Africa", "Africa", "The Americas", "Europe", "Europe", "Europe", "Africa", "Africa", "Middle East", "Africa", "Africa", "Asia", "Asia", "Asia", "Asia", "Oceania", "The Americas", "Africa", "Europe", "Africa", "Africa", "Europe", "The Americas", "The Americas", "Asia", "The Americas", "The Americas", "The Americas", "Asia", "Oceania", "Middle East", "Oceania", "Middle East", "Africa", "Africa", "Africa", "Africa")

myDataFrame <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)
# colnames(myDataFrame) <- c("Country", "Code", "Region")
# head(myDataFrame)
# rm(myDataFrame)
myDataFrame <- data.frame(
  Country = Countries_2012_Dataset,
  Codes = Codes_2012_Dataset,
  Region = Regions_2012_Dataset
)
head(myDataFrame)

# myDataFrame[myDataFrame$Country == "Bosnia and Herzegovina",]


#####################
# merging data frames
mergedDataFrame <- merge(stats2, myDataFrame, by.x = "Country.Code", by.y = "Codes")
mergedDataFrame$Country <- NULL
str(mergedDataFrame)


mergedDataFrame[mergedDataFrame$Income.Group == "High income" & mergedDataFrame$Region == "Africa", ]

qplot(
  data = mergedDataFrame, x = Internet.users, y = Birth.rate,
  color = Region, size = I(7), shape = I(19), alpha = I(0.6),
  main = "Birth Rate vs Internet Users"
)
