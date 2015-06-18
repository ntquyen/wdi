setwd("~/Projects/wdi")

source("./src/dependencies.R")
source("./src/constants.R")

source("./src/get_clean_data.R")
source("./src/plot.R")

start.year = 1990
end.year = 2014
eap.countries <- wdi.countries %>% filter(country %in% eap.country.names)

eap.countries.ny.gdp.mktp.cd <- getCountriesByIndicator(eap.countries$iso2c, ny.gdp.mktp.cd, 1990, 2014)
g.NY.GDP.MKTP.CD <- plot.wdi(eap.countries.ny.gdp.mktp.cd, 'graphics/GDP.png', 1990, 2014, 
                             "year", ny.gdp.mktp.cd, "country",
                             "GDP (current US$)", "Year", "GDP (billion $)",
                             scale.y = 1e+9)

eap.countries.ny.gdp.mktp.kd.zg <- getCountriesByIndicator(eap.countries$iso2c, ny.gdp.mktp.kd.zg, 1990, 2014)
g.NY.GDP.MKTP.KD.ZG <- plot.wdi(eap.countries.ny.gdp.mktp.kd.zg, 'graphics/GDP_growth.png', 1990, 2014, 
                                "year", ny.gdp.mktp.kd.zg, "country",
                                "GDP growth (annual %)", "Year", "Growth (%)",
                                scale.y = 1)

eap.countries.sl.gdp.pcap.em.kd <- getCountriesByIndicator(eap.countries$iso2c, sl.gdp.pcap.em.kd, 1990, 2014)
g.SL.GDP.PCAP.EM.KD <- plot.wdi(eap.countries.sl.gdp.pcap.em.kd, 'graphics/GDP_person.png', 1990, 2014, 
                                "year", sl.gdp.pcap.em.kd, "country",
                                "GDP per person employed ($)", "Year", "GDP ($)",
                                scale.y = 1)

eap.countries.ny.gdp.pcap.cd <- getCountriesByIndicator(eap.countries$iso2c, ny.gdp.pcap.cd, 1990, 2014)
g.NY.GDP.PCAP.CD <- plot.wdi(eap.countries.ny.gdp.pcap.cd, 'graphics/GDP_per_capita.png', 1990, 2014, 
                             "year", ny.gdp.pcap.cd, "country",
                             "GDP per capita ($)", "Year", "GDP ($)",
                             scale.y = 1)

g <- arrangeGrob(g.NY.GDP.MKTP.CD, g.NY.GDP.MKTP.KD.ZG, g.SL.GDP.PCAP.EM.KD, g.NY.GDP.PCAP.CD, ncol = 2)
ggsave(file = "./graphics/GDPs.png", g)
