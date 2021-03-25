# Google Search Daily Data
This is a scripts on gathering data Google search console data for impressions, clicks, ranking, and pages.  This data was gather to run clustering content and finding need keywords to use on site.

# The Purpose 
The purpose of this code was to get Google search consolse data by the day.  I needed an more granler look at my data to understand where my new content needs to go.  I have it saved to a CSV file so I can share it on Google sheets.  That way anyone who needs to see the file can.

The code was written in R and used the following packages
```r
library(tidyverse)
library(httr)
library(searchConsoleR)
library(googleAuthR)
library(lubridate)
```
