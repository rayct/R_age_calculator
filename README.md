## Here's an example program in R that calculates a person's age and the number of days until their next birthday:

## This program will prompt the user for their date of birth, and then it will calculate current age, the day of the week you were born on, and the number of days until your next birthday.

## To use the program, simply run it in a IDE or code editor environment and follow the prompts.

# Version: 1.0.2
## A few minor improvements: 
## 1. Use message() instead of cat() for printing messages. message() prints messages to the console and is the preferred method for printing messages within functions, as it is more flexible than cat().
## 2. Use interval() and floor_date() functions from the lubridate package to simplify the code for calculating the days until the next birthday.

# Version: 1.0
## This program uses the lubridate package for date/time calculations, which makes it easier to parse and manipulate dates in R. The program defines three functions: get_birthdate() to get user input, calculate_age() to calculate age in years, and days_to_next_birthday() to calculate days until the next birthday. The main() function runs these functions and prints the output. load the lubridate package for date/time calculations

## Ray C. Turner