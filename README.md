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
options("googleAuthR.client_secret" = "SERCET KEY")
googleAuthR::gar_auth()
```
During the setup of the Google cloud API set up, I had to use URI redirect as local host.

To set up the Google search console API, head over to [Google Cloud Console](https://cloud.google.com/apis)

