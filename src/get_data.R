library(jsonlite)

getUrl <- function(url, fmt = "json", page) {
  requestUrl <- paste0(url, "?format=", fmt, "&page=", page)
  res <- fromJSON(txt = requestUrl, flatten = TRUE)
  return (res)
}

getList <- function (url, fmt = "json") {
  df <- data.frame()

  page <- 1
  res <- getUrl(url, fmt, 1)
  df <- res[[2]]
  
  pages <- res[[1]]$pages
  while (page <= pages) {
    page <- page + 1
    res <- getUrl(url, fmt, page)
    
    df <- rbind(df, res[[2]])
  }

  return (df)
}


getIndicatorByCountry = function (country.code, indicator) {
  base.url <- "http://api.worldbank.org/countries"
  url <- paste0(base.url, "/", country.code, "/indicators/", indicator)
  filename <- paste0("./data/", country.code, "_", indicator, ".csv")
  
  df <- getList(url, fmt = "json")
  df <- df[complete.cases(df), ]
  
  df$date <- as.integer(df$date)
  df$value <- as.numeric(df$value)
  
  df <- df %>% 
    arrange(date) %>%
    select(country.id, country.value, date, value)
  
  colnames(df) <- c("country.code", "country.name", "year", indicator)
  
  return (df)
}


getCountryCode <- function (country.name) {
  countries <- read.csv("./data/WDI_csv/WDI_Country.csv", stringsAsFactors = FALSE, fileEncoding="latin1")
  code <- countries[grepl(country.name, countries$Short.Name), ]$X2.alpha.code
  return (code)
}

getIndicatorByCountries <- function(country.codes, indicator) {
  list.df <- list()
  for (i in 1: length(country.codes)) {
    df <- getIndicatorByCountry(tolower(country.codes[i]), indicator)
    list.df[[i]] <- df
  }
  countries.df <- do.call(rbind, list.df)
}