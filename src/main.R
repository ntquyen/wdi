setwd("~/Projects/wdi")

source("./src/dependencies.R")
source("./src/constants.R")

source("./src/get_clean_data.R")
source("./src/plot.R")

start.year = 1990
end.year = 2014
eap.countries <- wdi.countries %>% filter(country %in% eap.country.names)

eap.countries.ny.gdp.mktp.cd <- getCountriesByIndicator(eap.countries$iso2c, ny.gdp.mktp.cd, 1990, 2014)
g.NY.GDP.MKTP.CD <- plot.NY.GDP.MKTP.CD(eap.countries.ny.gdp.mktp.cd, "graphics/GDP.png", 1990, 2014)

eap.countries.ny.gdp.mktp.kd.zg <- getCountriesByIndicator(eap.countries$iso2c, ny.gdp.mktp.kd.zg, 1990, 2014)
g.NY.GDP.MKTP.KD.ZG <- plot.NY.GDP.MKTP.KD.ZG(eap.countries.ny.gdp.mktp.kd.zg, "graphics/GDP_growth.png", 1990, 2014)

eap.countries.sl.gdp.pcap.em.kd <- getCountriesByIndicator(eap.countries$iso2c, sl.gdp.pcap.em.kd, 1990, 2014)
g.SL.GDP.PCAP.EM.KD <- plot.SL.GDP.PCAP.EM.KD(eap.countries.sl.gdp.pcap.em.kd, "graphics/GDP_person.png", 1990, 2014)

eap.countries.ny.gdp.pcap.cd <- getCountriesByIndicator(eap.countries$iso2c, ny.gdp.pcap.cd, 1990, 2014)
g.NY.GDP.PCAP.CD <- plot.NY.GDP.PCAP.CD(eap.countries.ny.gdp.pcap.cd, "graphics/GDP_per_capita.png", 1990, 2014)

g <- arrangeGrob(g.NY.GDP.MKTP.CD, g.NY.GDP.MKTP.KD.ZG, g.SL.GDP.PCAP.EM.KD, g.NY.GDP.PCAP.CD, ncol = 2)
ggsave(file = "./graphics/GDPs.png", g)
