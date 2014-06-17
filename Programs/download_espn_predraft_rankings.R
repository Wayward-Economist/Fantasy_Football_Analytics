##############################################################################################################
# Author: Willem Daniel
# Description: This script downloads the pre-draft player ranking data from the ESPN website. 
# Noes: See the data readme document for a more detailed description of the data collection.
# Last Modified: 6/14/14
##############################################################################################################

# Load the required packages.
library(RCurl)
library(XML)

# Deal with the preliminaries.

##############################################################################################################
positionSort <- function(data){
# This function returns the rank that each player has at their position.
  
  pos.rank <- numeric()
  ranks <- list(D = 1, K = 1, QB = 1, RB = 1, TE = 1, WR = 1)
  
  for(i in 1:nrow(data)){
    
    pos.rank[i] <- ranks[as.character(data[i, 3])][[1]]
    ranks[as.character(data[i, 3])][[1]] <- ranks[as.character(data[i, 3])][[1]] + 1
    
  }
  
  pos.rank
  
}

##############################################################################################################
# Download and parse the 2008 data.
# Notes: On this webpage the NFL player table is the second html table. Set which = 2.
##############################################################################################################
espn.url <- "http://sports.espn.go.com/fantasy/football/ffl/story?page=nfl2k8DKtop200"

data.espn.2008 <- readHTMLTable(espn.url, skip.rows = 1, which = 2,
                                colClasses = c("integer", "character", "factor", "character"),
                                as.data.frame = TRUE,
                                stringsAsFactors = FALSE)

data.espn.2008 <- data.espn.2008[, c(1,2,4)]
data.espn.2008[, 3] <- factor(gsub("\\d", "", data.espn.2008[, 3]))
names(data.espn.2008) <- c("rank", "name", "position")
data.espn.2008$year <- 2008
data.espn.2008$pos.rank <- positionSort(data.espn.2008)

##############################################################################################################
# Download and parse the 2009 data.
# Notes: The NFL player table is the first html table. Set which = 1. The players' team abreviation and 
#        position is appended to the players' name. The string takes the form "Frank Gore, RB, SF". Also, an  
#        extra column is added for the expected draft value.
##############################################################################################################
espn.url <- "http://sports.espn.go.com/fantasy/football/ffl/story?page=NFLDK2K9_ranks200"

data.espn.2009 <- readHTMLTable(espn.url, as.data.frame = TRUE, which = 1,
                                colClasses = c("integer", "character", "integer", "character", "character"),
                                stringsAsFactors = FALSE)

data.espn.2009 <- data.espn.2009[, c(1,2,4)]
data.espn.2009[, 3] <- gsub("\\d", "", data.espn.2009[, 3])
data.espn.2009[, 3] <- factor(gsub("D/ST", "D", data.espn.2009[, 3]))
data.espn.2009[, 2] <- gsub("\\,.*", "", data.espn.2009[, 2])
names(data.espn.2009) <- c("rank", "name", "position")
data.espn.2009$year <- 2009
data.espn.2009$pos.rank <- positionSort(data.espn.2009)

##############################################################################################################
# Download and parse the 2010 data.
# Notes: The position abreviation is left off of the name string. The string now looks like "Reggie Bush, NO".
##############################################################################################################
espn.url <- "http://sports.espn.go.com/fantasy/football/ffl/story?page=NFLDK2K10rankstop200"

data.espn.2010 <- readHTMLTable(espn.url, as.data.frame = TRUE, which = 1,
                                colClasses = c("integer", "character", "integer", "character", "character"),
                                stringsAsFactors = FALSE)

data.espn.2010 <- data.espn.2010[, c(1,2,4)]
data.espn.2010[, 3] <- gsub("\\d", "", data.espn.2010[, 3])
data.espn.2010[, 3] <- factor(gsub("DEF", "D", data.espn.2010[, 3]))
data.espn.2010[, 2] <- gsub("\\,.*", "", data.espn.2010[, 2])
names(data.espn.2010) <- c("rank", "name", "position")
data.espn.2010$year <- 2010
data.espn.2010$pos.rank <- positionSort(data.espn.2010)

##############################################################################################################
# Download and parse the 2011 data.
# Notes: ESPN now ranks the top 300 players. Note also the warning message "NAs introduced by coersion" occurs
#        because the free agency players do not have a bye week on the website.
##############################################################################################################
espn.url <- "http://sports.espn.go.com/fantasy/football/ffl/story?page=NFLDK2K11ranksTop300"

data.espn.2011 <- readHTMLTable(espn.url, as.data.frame = TRUE, which = 1,
                                colClasses = c("integer", "character", "integer", "character", "character"),
                                stringsAsFactors = FALSE)

data.espn.2011 <- data.espn.2011[, c(1,2,4)]
data.espn.2011[, 3] <- gsub("\\d", "", data.espn.2011[, 3])
data.espn.2011[, 3] <- factor(gsub("DST", "D", data.espn.2011[, 3]))
data.espn.2011[, 2] <- gsub("\\,.*", "", data.espn.2011[, 2])
names(data.espn.2011) <- c("rank", "name", "position")
data.espn.2011$year <- 2011
data.espn.2011$pos.rank <- positionSort(data.espn.2011)

##############################################################################################################
# Download and parse the 2012 data.
##############################################################################################################
espn.url <- "http://sports.espn.go.com/fantasy/football/ffl/story?page=NFLDK2K12ranksTop300"

data.espn.2012 <- readHTMLTable(espn.url, as.data.frame = TRUE, which = 1,
                                colClasses = c("integer", "character", "integer", "character", "character"),
                                stringsAsFactors = FALSE)

data.espn.2012 <- data.espn.2012[, c(1,2,4)]
data.espn.2012[, 3] <- gsub("\\d", "", data.espn.2012[, 3])
data.espn.2012[, 3] <- factor(gsub("DST", "D", data.espn.2012[, 3]))
data.espn.2012[, 2] <- gsub("\\,.*", "", data.espn.2012[, 2])
names(data.espn.2012) <- c("rank", "name", "position")
data.espn.2012$year <- 2012
data.espn.2012$pos.rank <- positionSort(data.espn.2012)

##############################################################################################################
# Download and parse the 2013 data.
##############################################################################################################
espn.url <- "http://espn.go.com/fantasy/football/story/_/page/2013preseasonFFLranks250/top-300-position"

data.espn.2013 <- readHTMLTable(espn.url, as.data.frame = TRUE, which = 1,
                                colClasses = c("integer", "character", "integer", "character", "character"),
                                stringsAsFactors = FALSE)

data.espn.2013 <- data.espn.2013[, c(1,2,4)]
data.espn.2013[, 3] <- gsub("\\d", "", data.espn.2013[, 3])
data.espn.2013[, 3] <- factor(gsub("DEF", "D", data.espn.2013[, 3]))
data.espn.2013[, 2] <- gsub("\\,.*", "", data.espn.2013[, 2])
names(data.espn.2013) <- c("rank", "name", "position")
data.espn.2013$year <- 2013
data.espn.2013$pos.rank <- positionSort(data.espn.2013)

##############################################################################################################
# Combine the data.
year     <- c(data.espn.2013$year,
              data.espn.2012$year,
              data.espn.2011$year,
              data.espn.2010$year,
              data.espn.2009$year,
              data.espn.2008$year)
position <- factor(c(as.character(data.espn.2013$position),
                     as.character(data.espn.2012$position),
                     as.character(data.espn.2011$position),
                     as.character(data.espn.2010$position),
                     as.character(data.espn.2009$position),
                     as.character(data.espn.2008$position)))
player   <- c(data.espn.2013$name,
              data.espn.2012$name,
              data.espn.2011$name,
              data.espn.2010$name,
              data.espn.2009$name,
              data.espn.2008$name)
ov.rank  <- c(data.espn.2013$rank,
              data.espn.2012$rank,
              data.espn.2011$rank,
              data.espn.2010$rank,
              data.espn.2009$rank,
              data.espn.2008$rank)
pos.rank <- c(data.espn.2013$pos.rank,
              data.espn.2012$pos.rank,
              data.espn.2011$pos.rank,
              data.espn.2010$pos.rank,
              data.espn.2009$pos.rank,
              data.espn.2008$pos.rank)

espn.predraft.rankings <- data.frame(year, position, player, ov.rank, pos.rank)

# Clean up

rm(list = c("espn.url", "positionSort"))
