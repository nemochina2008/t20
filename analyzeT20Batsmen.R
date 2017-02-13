#########################################################################################################
#
# Title :  Inswinger - An interactive app to analyze International T20 Players, teams and matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 12 Feb 2017
# File: analyzeT20Batsmen.R
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################

# Analyze T20 batsmen
analyzeT20Batsmen <- function(T20Batsman,func,country) {
     print("Hello")
   print(T20Batsman)
    print(country)
    #print(T20Batsman)
    # Return when name is NULL at start
    #if(is.null(T20Batsman))
       # return()
    
    # Check and get the team indices of T20 teams in which the batsman has played
    #i <- getTeamIndex(T20Batsman)
    
    # Get the team names
    #teamNames <- getTeams(i)
    # Check if file exists in the directory. This check is necessary when moving between matchType
    
    #batsmanDF <- NULL
    # Create a consolidated Data frame of batsman for all T20 teams played
    #for (i in seq_along(teamNames)){
    #      df <- getBatsmanDetails(team=teamNames[i],name=T20Batsman,dir="./data")
    #      batsmanDF <- rbind(batsmanDF,df) 
    #}
    batsmanDF<- getBatsmanDetails(team=country,name=T20Batsman,dir="./data")
    print(dim(batsmanDF))
    # Call the approporiate function
    
    if(func == "Batsman Runs vs. Deliveries"){
        batsmanRunsVsDeliveries(batsmanDF,T20Batsman)
    } else if (func == "4s and 6s of batsman"){
        batsman46 <- select(batsmanDF,T20Batsman,ballsPlayed,fours,sixes,runs)
        batsmanFoursSixes(batsman46,T20Batsman)
    } else if (func == "Dismissals of batsman"){
        batsmanDismissals(batsmanDF,T20Batsman)
    } else if (func == "Batsman's Runs vs Strike Rate"){
        batsmanRunsVsStrikeRate(batsmanDF,T20Batsman)
    } else if (func == "Batsman's Moving Average"){
        batsmanMovingAverage(batsmanDF,T20Batsman)
    } else if (func == "Batsman's Cumulative Average Runs"){
        batsmanCumulativeAverageRuns(batsmanDF,T20Batsman)
    } else if (func == "Batsman's Cumulative Strike Rate"){
        batsmanCumulativeStrikeRate(batsmanDF,T20Batsman)
    } else if (func == "Batsman's Runs against Opposition"){
        batsmanRunsAgainstOpposition(batsmanDF,T20Batsman)
    } else if (func == "Batsman's  Runs at Venue"){
        batsmanRunsVenue(batsmanDF,T20Batsman)
    } else if (func == "Predict Runs of batsman"){
        batsmanRunsPredict(batsmanDF,T20Batsman)
    } 
}

