getGgplotTheme <- function() {
  return (theme(plot.title = element_text(size = 20, face = "bold", vjust = 2),
        axis.text.x = element_text(size = 13),
        axis.title.x = element_text(size = 16),
        axis.text.y = element_text(size = 13),
        axis.title.y = element_text(size = 16),
        legend.title = element_blank()))
}

scaleY <- function(scale.y) {
  return (scale_y_continuous(label = function(value) {
    return (value/scale.y)
    }))
}

exportPNG <- function(g, file) {
  file.path <- paste(getwd(), file, sep = "/")
  print(file.path)
  ggsave(file = file.path)
}

plot.wdi <- function(data, file = '', 
                     from.year, to.year, 
                     x, y, group,
                     title, xlab, ylab,
                     scale.y = 1) {
  
  g <- ggplot(data, aes_string(x = x, y = y, group = group, color = group))
  g <- g + geom_line(size = 1) + 
    labs(title = title, x = xlab, y = ylab) +
    scaleY(scale.y) + getGgplotTheme() +
    xlim(from.year, to.year)
  
  if(nchar(file) > 0) {
    exportPNG(g, file)
  }
  
  return (g)
}
