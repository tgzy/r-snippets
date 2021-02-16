library(tidyverse)

timeStart <- as_datetime(Sys.time())
date <- date("2021-02-28") #date
date2 <- "2020-12-31" #string
date3 <- as.POSIXct("2015-05-15") #POSIXct
date4 <- ymd_hms("2001-11-28T14:02:44")
date5 <- ymd_hms("2001-11-28 14:02:44")

dates <- c(date, date2, date3, date4, date5)
dates <- c(date4, date5)
date_min <- min(dates, na.rm = F)
date_min

dates %>% min(x=., na.rm = T)
date_min %>% floor_date(~x, unit = "day") %>% date()

typeof(date5)

hour(date4)
hour(date5)

date("2021-01-31") + months(1) #NA because of 2021-02-31 not possible
date("2021-01-31") + months(2) #check if formula works
date("2021-01-31") %m+% months(1) #go to last possible date

add_with_rollback(date("2021-01-12"), months(1), roll_to_first = TRUE, preserve_hms = FALSE)
add_with_rollback(ymd_hms("2021-01-31T14:02:44"), months(1), roll_to_first = F, preserve_hms = T)

is.Date(date4)
typeof(date3)

timeEnd <- as_datetime(Sys.time())

scriptRuntime <- interval(ymd_hms(timeStart), ymd_hms(timeEnd)) %>% int_length()
paste("Runtime", scriptRuntime, "seconds")
