
wdi.indicators <- as.data.frame(WDI_data[[1]])
wdi.countries <- as.data.frame(WDI_data[[2]])

NY.GDP.MKTP.CD <- "NY.GDP.MKTP.CD"
NY.GDP.MKTP.KD.ZG <- "NY.GDP.MKTP.KD.ZG"
SL.GDP.PCAP.EM.KD <- "SL.GDP.PCAP.EM.KD"
NY.GDP.PCAP.CD <- "NY.GDP.PCAP.CD"
GC.DOD.TOTL.GD.ZS <- "GC.DOD.TOTL.GD.ZS"

economy.indicators <- c(
  NY.GDP.MKTP.CD,
  NY.GDP.MKTP.KD.ZG,
  SL.GDP.PCAP.EM.KD,
  NY.GDP.PCAP.CD,
  GC.DOD.TOTL.GD.ZS
  )

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