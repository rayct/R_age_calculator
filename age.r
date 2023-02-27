# Version: 1.0.2
# A few minor improvements:
# 1. Use message() instead of cat() for printing messages. message() prints messages to the console and is the preferred method for printing messages within functions, as it is more flexible than cat().
# 2. Use interval() and floor_date() functions from the lubridate package to simplify the code for calculating the days until the next birthday.
# Here is the optimized R code:

library(lubridate)

get_birthdate <- function() {
  message("Enter your date of birth (format: DD/MM/YYYY): ")
  return(readline())
}

calculate_age <- function(birthdate) {
  birthdate <- dmy(birthdate)
  age_years <- as.numeric(interval(birthdate, Sys.Date())) / 365.25
  return(floor(age_years))
}

days_to_next_birthday <- function(birthdate) {
  birthdate <- dmy(birthdate)
  next_birthday <- floor_date(ymd(paste(year(Sys.Date()), month(birthdate), day(birthdate), sep="-")), "day")
  if (next_birthday < Sys.Date()) {
    next_birthday <- floor_date(ymd(paste(year(Sys.Date()) + 1, month(birthdate), day(birthdate), sep="-")), "day")
  }
  days_to_birthday <- as.numeric(interval(Sys.Date(), next_birthday))
  return(days_to_birthday)
}

main <- function() {
  birthdate <- get_birthdate()
  age <- calculate_age(birthdate)
  days_to_birthday <- days_to_next_birthday(birthdate)
  message("You are ", age, " years old.")
  message("There are ", days_to_birthday, " days until your next birthday.")
}

main()


# Version: 1.0
# This program uses the lubridate package for date/time calculations, 
# which makes it easier to parse and manipulate dates in R.
# The program defines three functions: get_birthdate() to get user input, calculate_age() to calculate age in years, 
# and days_to_next_birthday() to calculate days until the next birthday.
# The main() function runs these functions and prints the output.
# load the lubridate package for date/time calculations
library(lubridate)

# function to get user input for birthdate
get_birthdate <- function() {
  cat("Enter your date of birth (format: DD/MM/YYYY): ")
  return(readline())
}

# function to calculate age in years
calculate_age <- function(birthdate) {
  birthdate <- dmy(birthdate) # convert to Date object
  today <- Sys.Date() # get today's date
  age <- today - birthdate # calculate age in days
  age_years <- as.numeric(age) / 365.25 # convert to years
  return(floor(age_years)) # return age in whole years
}

# function to calculate days until next birthday
days_to_next_birthday <- function(birthdate) {
  birthdate <- dmy(birthdate) # convert to Date object
  today <- Sys.Date() # get today's date
  next_birthday <- ymd(paste(year(today), month(birthdate), day(birthdate), sep="-")) # get next birthday
  if (next_birthday < today) { # if already had birthday this year
    next_birthday <- ymd(paste(year(today) + 1, month(birthdate), day(birthdate), sep="-")) # get next year's birthday
  }
  days_to_birthday <- as.numeric(next_birthday - today) # calculate days to next birthday
  return(days_to_birthday)
}

# main function to run program
main <- function() {
  birthdate <- get_birthdate()
  age <- calculate_age(birthdate)
  days_to_birthday <- days_to_next_birthday(birthdate)
  cat("You are", age, "years old.\n")
  cat("There are", days_to_birthday, "days until your next birthday.\n")
}

# run the program
main()
