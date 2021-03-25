library(tidyverse)
library(httr)
library(searchConsoleR)
library(googleAuthR)
library(lubridate)


#Authenticate in the Google Search Console API

options("googleAuthR.scopes.selected" =
          c("https://www.googleapis.com/auth/webmasters",
            "https://www.googleapis.com/auth/webmasters.readonly"))

#Add your client.id and client.secret here

options("googleAuthR.client_id" = "518070240618-35n426t5hat4n0obpuacb0n3fm9072fo.apps.googleusercontent.com")
options("googleAuthR.client_secret" = "H7qo15HNLA0duHrtQkHpHVsb")
googleAuthR::gar_auth()

#Stop and authenticate in your browser


website<- "sc-domain:owllytics.com"

start_date <- Sys.Date() - 3
end_date <- Sys.Date() - 3

download_dimensions <- c('date','query', 'page', 'device')

#I am just getting the web type of search
type <- c('web')


data <- search_analytics(siteURL = website, 
                         startDate = start_date, 
                         endDate = end_date, 
                         dimensions = download_dimensions, 
                         searchType = type)

#creating an empty table to store the data
query_data <- c()


# Getting all the data since the start by day (I went by day for the last year)
##It locked me out at aroun 50.  Suggest to make it smaller chunks or add a time tigger.
for (i in c(1:365)) {
  website<- "sc-domain:owllytics.com"
  
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

#save this as a csv for later.
write.csv(query_data, file="google search console.csv", row.names = FALSE)


