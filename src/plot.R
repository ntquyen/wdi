getGgplotTheme <- function() {
  return (theme(plot.title = element_text(size = 20, face = "bold", vjust = 2),
        axis.text.x = element_text(size = 13),
        axis.title.x = element_text(size = 16),
        axis.text.y = element_text(size = 13),
        axis.title.y = element_text(size = 16),
        legend.title = element_blank()))
}

exportPNG <- function(g, file) {
  file.path <- paste(getwd(), file, sep = "/")
  print(file.path)
  ggsave(file = file.path)
}


plot.NY.GDP.MKTP.CD <- function(data, file = '', from.year, to.year) {
  g <- ggplot(data, aes(year, NY.GDP.MKTP.CD, group = country, color = country))
  g <- g + geom_line(size = 1) + 
    labs(title = "GDP (current US$)", x = "Year", y = "GDP (billion US$)") +
    scale_y_continuous(label = function(value) {
      return (value/1e+9)
    }) + getGgplotTheme() +
    xlim(from.year, to.year)
  
  if(nchar(file) > 0) {
    exportPNG(g, file)
  }
  
  return (g)
}

plot.NY.GDP.MKTP.KD.ZG <- function(data, file = "", from.year, to.year) {
  g <- ggplot(data, aes(year, NY.GDP.MKTP.KD.ZG, group = country, color = country))
  g <- g + geom_line(size = 1) + 
    labs(title = "GDP growth (annual %)", x = "Year", y = "Growth (%)") +
    getGgplotTheme() +
    xlim(from.year, to.year)
  
  if(nchar(file) > 0) {
    exportPNG(g, file)
  }
  
  return (g)
}


plot.SL.GDP.PCAP.EM.KD <- function(data, file = "", from.year, to.year) {
  g <- ggplot(data, aes(year, SL.GDP.PCAP.EM.KD, group = country, color = country))
  g <- g + geom_line(size = 1) + 
    labs(title = "GDP per person employed ($)", x = "Year", y = "GDP") +
    getGgplotTheme() + 
    xlim(from.year, to.year)
  
  if(nchar(file) > 0) {
    exportPNG(g, file)
  }
  
  return (g)
}


plot.NY.GDP.PCAP.CD <- function(data, file = "", from.year, to.year) {
  g <- ggplot(data, aes(year, NY.GDP.PCAP.CD, group = country, color = country))
  g <- g + geom_line(size = 1) + 
    labs(title = "GDP per capita ($)", x = "Year", y = "GDP ($)") +
    getGgplotTheme() + 
    xlim(from.year, to.year)
  
  if(nchar(file) > 0) {
    exportPNG(g, file)
  }
  
  return (g)
}

