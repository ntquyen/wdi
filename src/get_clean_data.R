
### Given a list of country ISO2 code and the indicator, return data frame
getCountriesByIndicator <- function(country.codes, indicator, from.year, to.year) {
  
  countries <- lapply(country.codes, function (country.code) {
    df <- WDI(country = country.code, indicator = indicator, start = from.year, end = to.year)
    return (df)
  })
  countries <- do.call(rbind, countries)
  
  return (countries)
}