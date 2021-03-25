# Google Search Daily Data
This is a scripts on gathering data Google search console data for impressions, clicks, ranking, and pages.  This data was gather to run clustering content and finding need keywords to use on site.

# The Purpose 
The purpose of this code was to get Google search consolse data by the day.  I needed an more granler look at my data to understand where my new content needs to go.  I have it saved to a CSV file so I can share it on Google sheets.  That way anyone who needs to see the file can.

*The code was written in R and used the following packages*
```r
library(tidyverse)
library(httr)
library(searchConsoleR)
library(googleAuthR)
library(lubridate)
```

Then I needed to get the google search console api to allow R to access. 
```r
#Authenticate in the Google Search Console API

options("googleAuthR.scopes.selected" =
          c("https://www.googleapis.com/auth/webmasters",
            "https://www.googleapis.com/auth/webmasters.readonly"))

#Add your client.id and client.secret here

options("googleAuthR.client_id" = "CLIENT ID")
options("googleAuthR.client_secret" = "SECRET KEY")
googleAuthR::gar_auth()
```
During the setup of the Google cloud API set up, I had to use URI redirect as local host.

To set up the Google search console API, head over to [Google Cloud Console](https://cloud.google.com/apis)

*Here is where the API looks like when you search*

![Image API look in could console](https://github.com/LLathrop1/GoogleSearchDailyData/blob/main/images/google%20search%20console%20api%20location.png)

Once you enable the API from the Google cloud console, you need to set up a client OAuth.  This code is set up for the the OAuth 2.0

*Here is where you find the CLIENT ID and SECRET KEY*

![Image of the OAuth 2.0 setup](https://github.com/LLathrop1/GoogleSearchDailyData/blob/main/images/client%20id%20ocation.png)

Once you get the *CLIENT ID* and *SECRET KEY* at it to this part of the code.

```r
#Add your client.id and client.secret here

options("googleAuthR.client_id" = "CLIENT ID")
options("googleAuthR.client_secret" = "SECRET KEY")
googleAuthR::gar_auth()
```
That is it, you are in and good to go!

# Calling the data
Calling the data from R was a little tricky.  If you are getter the error code try changing your site prefix from 'https//www.' to 'sc-domain:'.  This seems werid but it worked and got us into the site we needed.

## Date
The search console has data that is three days old.  The code is set to have it three days prior for the newest date.  
After checking to see if the code works, creating the for loop allowed for data to be gather by day, getting the most data you can get.

```r
# Getting all the data since the start by day (I went by day for the last year)
##It locked me out at aroun 50.  Suggest to make it smaller chunks or add a time tigger.
for (i in c(1:365)) {
  website<- "PAGE URL"
  
  start_date <- Sys.Date() - i
  end_date <- Sys.Date() - i
  
  download_dimensions <- c('date','query', 'page', 'device')
  
  type <- c('web')
  
  
  data <- search_analytics(siteURL = website, 
                           startDate = start_date, 
                           endDate = end_date, 
                           dimensions = download_dimensions, 
                           searchType = type)
  
  query_data <- rbind(query_data, data)
  
}
```

The code is set for the last 365 days.  When running this, Google blocks you on the calls due to the amount of data being called at once.  *Using it as chunks worked best for what we needed. * 

# Saving the data
After all of the data was saved in the table, write the *csv* to save it for later.

```r

#save this as a csv for later.
write.csv(query_data, file="google search console.csv", row.names = FALSE)
```

### I hope this helps those looking for some gudines and walkthrough on the code.
