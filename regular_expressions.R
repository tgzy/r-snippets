library(stringr)
searchString <- "1. Target - Fahrwerk vorne - Messwerte.csv\n15. Target - Achse 3 - Konfiguration.csv"
#pattern <- "((?<objectName>[A-Za-z\\s]+[a-z0-9]+) \\- (?<objectType>[A-Za-z]+)\\.(?<fileextension>[a-z]+))"
pattern <- "(?<Anfang>[0-9]{1,2}\\. [A-Za-z]+) - (?<Mittelteil>[A-Za-z0-9\\s]+) - (?<Ende>[A-Za-z0-9\\s]+)\\.(?<Dateiendung>[A-Za-z0-9]+)"
ergebnis <- trimws(str_match(searchString, pattern))
# foundTargetNumber <- ergebnis[,2]
# foundObjectName <- ergebnis[,3]
# foundObjectType <- ergebnis[,4]
# foundFileextension <- ergebnis[,5]
str_match(searchString, pattern)
str_match_all(searchString, pattern)

#https://regex101.com/r/toYJ7e/1
#delete-link https://regex101.com/delete/yiQJOCLFsxZGZUbt65jfz5Yv
