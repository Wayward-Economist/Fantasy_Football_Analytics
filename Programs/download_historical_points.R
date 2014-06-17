##############################################################################################################
# Author: Willem Daniel
# Description: This script downloads the pre-draft player ranking data from the ESPN website. 
# Notes: See the data readme document for a more detailed description of the data collection.
# Last Modified: 6/16/14
##############################################################################################################

# Load the required packages.
library(RCurl)
library(XML)

##############################################################################################################

downloadPositionScores <- function(year){
  
  # These are the constructors for the urls.
  part.one   <- "http://fftoday.com/stats/playerstats.php?Season="
  part.two   <- "&GameWeek=&PosID="
  part.three <- "&LeagueID=26955&order_by=FFPts&sort_order=DESC&cur_page="
  
  # Create a data frame to store the data.
  data <- data.frame() 
  
  for(j in c(10, 20, 30, 40, 80, 99))
  
    for(i in 0:3){
    
      # Create the url.
      url <- paste(part.one, year, part.two, j, part.three, i, sep = "")
      
      # Download the data from the first webpage.
      temp <- readHTMLTable(url, skip.rows = 1, which = 10,
                                      as.data.frame = TRUE,
                                      stringsAsFactors = FALSE)
      
      # Subset the data to eliminate the first row which is a meaningless text field.
      temp <- temp[-1, c(1, (ncol(temp) - 1))]
      names(temp) <- c("player", "points")
      
      # Add the temporary data to the data object.
      data <- rbind(data, temp)
    
    }
  
  # Return the data object.
  data
}

trimPlayerName <- function(vector){
  
  vector <- substr(vector, 6, nchar(vector))
  
  for(k in 1:length(vector)){
    
    vector[k] <- trim(vector[k])
    
  }
  
  vector
  
}

trim <- function(name){
  
  if(substr(name, 1, 1) == " "| substr(name, 1, 1) == "."){
    name <- substr(name, 2, nchar(name))
    name <- trim(name)
  }
  
  name
  
}

data.2013 <- downloadPositionScores(2013)
data.2013[, 1] <- trimPlayerName(data.2013[, 1])
data.2013$year <- 2013

data.2012 <- downloadPositionScores(2012)
data.2012[, 1] <- trimPlayerName(data.2012[, 1])
data.2012$year <- 2012

data.2011 <- downloadPositionScores(2011)
data.2011[, 1] <- trimPlayerName(data.2011[, 1])
data.2011$year <- 2011

data.2010 <- downloadPositionScores(2010)
data.2010[, 1] <- trimPlayerName(data.2010[, 1])
data.2010$year <- 2010

data.2009 <- downloadPositionScores(2009)
data.2009[, 1] <- trimPlayerName(data.2009[, 1])
data.2009$year <- 2009

data.2008 <- downloadPositionScores(2008)
data.2008[, 1] <- trimPlayerName(data.2008[, 1])
data.2008$year <- 2008

historical.points <- rbind(data.2013, data.2012, data.2011, data.2010, data.2009, data.2008)
