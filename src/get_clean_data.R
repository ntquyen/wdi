getCountriesByIndicator <- function(country.codes, indicator) {
  
  countries <- lapply(country.codes, function (country.code) {
    df <- WDI(country = country.code, indicator = NY.GDP.MKTP.CD, start = start.year, end = end.year)
    return (df)
  })
  countries <- do.call(rbind, countries)
  
  return (countries)
}