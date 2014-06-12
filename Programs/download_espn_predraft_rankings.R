##############################################################################################################
# Author: Willem Daniel
# Description: This script downloads the pre-draft player ranking data from the ESPN website. 
# Noes: See the data readme document for a more detailed description of the data collection.
# Last Modified: 6/11/14
##############################################################################################################

# Load the required packages.
library(RCurl)
library(XML)

# Deal with the preliminaries.

##############################################################################################################
# Download and parse the 2008 data.
# Notes: On this webpage the NFL player table is the second html table. Set which = 2.
##############################################################################################################
espn.url <- "http://sports.espn.go.com/fantasy/football/ffl/story?page=nfl2k8DKtop200"

data.espn.2008 <- readHTMLTable(espn.url, skip.rows = 1, which = 2,
                                colClasses = c("integer", "character", "factor", "character"),
                                as.data.frame = TRUE,
                                stringsAsFactors = FALSE)

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

##############################################################################################################
# Download and parse the 2010 data.
# Notes: The position abreviation is left off of the name string. The string now looks like "Reggie Bush, NO".
##############################################################################################################
espn.url <- "http://sports.espn.go.com/fantasy/football/ffl/story?page=NFLDK2K10rankstop200"

data.espn.2010 <- readHTMLTable(espn.url, as.data.frame = TRUE, which = 1,
                                colClasses = c("integer", "character", "integer", "character", "character"),
                                stringsAsFactors = FALSE)

##############################################################################################################
# Download and parse the 2011 data.
# Notes: ESPN now ranks the top 300 players. Note also the warning message "NAs introduced by coersion" occurs
#        because the free agency players do not have a bye week on the website.
##############################################################################################################
espn.url <- "http://sports.espn.go.com/fantasy/football/ffl/story?page=NFLDK2K11ranksTop300"

data.espn.2011 <- readHTMLTable(espn.url, as.data.frame = TRUE, which = 1,
                                colClasses = c("integer", "character", "integer", "character", "character"),
                                stringsAsFactors = FALSE)

##############################################################################################################
# Download and parse the 2012 data.
##############################################################################################################
espn.url <- "http://sports.espn.go.com/fantasy/football/ffl/story?page=NFLDK2K12ranksTop300"

data.espn.2012 <- readHTMLTable(espn.url, as.data.frame = TRUE, which = 1,
                                colClasses = c("integer", "character", "integer", "character", "character"),
                                stringsAsFactors = FALSE)

##############################################################################################################
# Download and parse the 2013 data.
##############################################################################################################
espn.url <- "http://espn.go.com/fantasy/football/story/_/page/2013preseasonFFLranks250/top-300-position"

data.espn.2013 <- readHTMLTable(espn.url, as.data.frame = TRUE, which = 1,
                                colClasses = c("integer", "character", "integer", "character", "character"),
                                stringsAsFactors = FALSE)



