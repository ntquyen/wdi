
wdi.indicators <- as.data.frame(WDI_data[[1]])
wdi.countries <- as.data.frame(WDI_data[[2]])

ny.gdp.mktp.cd <- "NY.GDP.MKTP.CD"
ny.gdp.mktp.kd.zg <- "NY.GDP.MKTP.KD.ZG"
sl.gdp.pcap.em.kd <- "SL.GDP.PCAP.EM.KD"
ny.gdp.pcap.cd <- "NY.GDP.PCAP.CD"
gc.dod.totl.gd.zs <- "GC.DOD.TOTL.GD.ZS"

# East Asia & Pacific
eap.country.names <- c(
  "Vietnam", 
  "Thailand", 
  "Singapore", 
  "Malaysia", 
  "Myanma", 
  "Lao PDR", 
  "Cambodia", 
  "Indonesia", 
  "Philippines"
#   "American Samoa",
#   "China",
#   "Fiji",
#   "Kiribati",
#   "Korea, Dem. Rep.",
#   "Marshall Islands",
#   "Micronesia, Fed. Sts.",
#   "Mongolia",
#   "Palau",
#   "Papua New Guinea",
#   "Samoa",
#   "Solomon Islands",
#   "Timor-Leste",
#   "Tonga",
#   "Tuvalu",
#   "Vanuatu"
)