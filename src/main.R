setwd("~/Projects/wdi")

source("./src/dependencies.R")
source("./src/constants.R")

source("./src/get_data.R")

start.year = 1990
end.year = 2014
eapcountries <- wdi.countries %>% filter(country %in% eap.country.names)

eap.countries.df <- getCountriesByIndicator(eap.countries$iso2c, NY.GDP.MKTP.CD)

png("./graphics/GDP.png")
g_NY.GDP.MKTP.CD <- ggplot(eap.countries.df, aes(year, NY.GDP.MKTP.CD, group = country, color = country))
g_NY.GDP.MKTP.CD <- g_NY.GDP.MKTP.CD + geom_line(size = 1) + 
  labs(title = "GDP (current US$)", x = "Year", y = "GDP (billion US$)") +
  scale_y_continuous(label = function(value) {
    return (value/1e+9)
  }) +
  theme(plot.title = element_text(size = 20, face = "bold", vjust = 2),
        axis.text.x = element_text(size = 13),
        axis.title.x = element_text(size = 16),
        axis.text.y = element_text(size = 13),
        axis.title.y = element_text(size = 16),
        legend.title = element_blank()) + 
  xlim(1990, 2014)
g_NY.GDP.MKTP.CD
dev.off()

png("./graphics/GDP_growth.png")
g_NY.GDP.MKTP.KD.ZG <- ggplot(eap.countries.df, aes(year, NY.GDP.MKTP.KD.ZG, group = country.name, color = country.name))
g_NY.GDP.MKTP.KD.ZG <- g_NY.GDP.MKTP.KD.ZG + geom_line(size = 1) + 
  labs(title = "GDP growth (annual %)", x = "Year", y = "Growth (%)") +
  theme(plot.title = element_text(size = 20, face = "bold", vjust = 2),
        axis.text.x = element_text(size = 13),
        axis.title.x = element_text(size = 16),
        axis.text.y = element_text(size = 13),
        axis.title.y = element_text(size = 16),
        legend.title = element_blank()) + 
  xlim(1990, 2014)

dev.off()

png("./graphics/GDP_person.png")
g_SL.GDP.PCAP.EM.KD <- ggplot(eap.countries.df, aes(year, SL.GDP.PCAP.EM.KD, group = country.name, color = country.name))
g_SL.GDP.PCAP.EM.KD <- g_SL.GDP.PCAP.EM.KD + geom_line(size = 1) + 
  labs(title = "GDP per person employed ($)", x = "Year", y = "GDP") +
  theme(plot.title = element_text(size = 20, face = "bold", vjust = 2),
        axis.text.x = element_text(size = 13),
        axis.title.x = element_text(size = 16),
        axis.text.y = element_text(size = 13),
        axis.title.y = element_text(size = 16),
        legend.title = element_blank()) + 
  xlim(1990, 2014)

dev.off()

png("./graphics/GDP_per_capita.png")
g_NY.GDP.PCAP.CD <- ggplot(eap.countries.df, aes(year, NY.GDP.PCAP.CD, group = country.name, color = country.name))
g_NY.GDP.PCAP.CD <- g_NY.GDP.PCAP.CD + geom_line(size = 1) + 
  labs(title = "GDP per capita ($)", x = "Year", y = "GDP ($)") +
  theme(plot.title = element_text(size = 20, face = "bold", vjust = 2),
        axis.text.x = element_text(size = 13),
        axis.title.x = element_text(size = 16),
        axis.text.y = element_text(size = 13),
        axis.title.y = element_text(size = 16),
        legend.title = element_blank()) + 
  xlim(1990, 2014)

dev.off()

png("./graphics/GDPs.png", height = 640, width = 800)
grid.arrange(g_NY.GDP.MKTP.CD, g_NY.GDP.MKTP.KD.ZG, g_SL.GDP.PCAP.EM.KD, g_NY.GDP.PCAP.CD, ncol = 2)
dev.off()
