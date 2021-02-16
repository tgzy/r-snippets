library(lubridate)

date <- date("2021-02-28") #date
date2 <- "2020-12-31" #string
date3 <- as.POSIXct("2015-05-15") #POSIXct

dates <- c(date, date2, datePOSIXct)
date_min <- min(dates, na.rm = F)

date_min
typeof(date_min)

date + 1
is.Date(date3)
typeof(date3)
