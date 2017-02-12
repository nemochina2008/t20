#########################################################################################################
#
# Title :  Inswinger - An interactive app to analyze International T20 Players, teams and matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 12 Feb 2017
# File: analyzeT20Bowlers.R
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################
# Analyze T20 bowlers
analyzeT20Bowlers <- function(T20Bowler,func) {
  
    # Check and get the team indices of T20 teams in which the bowler has played
    i <- getTeamIndex_bowler(T20Bowler)
    
    # Get the team names
    teamNames <- getTeams(i)
    # Check if file exists in the directory. This check is necessary when moving between matchType
    
    bowlerDF <- NULL
    
    # Create a consolidated Data frame of batsman for all T20 teams played
    for (i in seq_along(teamNames)){
          df <- getBowlerWicketDetails(team=teamNames[i],name=T20Bowler,dir="./data")
          bowlerDF <- rbind(bowlerDF,df) 
        
    }
 
    # Call the necessary function
    if(func == "Mean Economy Rate of bowler"){
        bowlerMeanEconomyRate(bowlerDF,T20Bowler)
    } else if (func == "Mean runs conceded by bowler"){
        bowlerMeanRunsConceded(bowlerDF,T20Bowler)
    }     else if (func == "Bowler's Moving Average"){
        bowlerMovingAverage(bowlerDF,T20Bowler)
    } else if (func == "Bowler's Cumulative Avg. Wickets"){
        bowlerCumulativeAvgWickets(bowlerDF,T20Bowler)
    } else if (func == "Bowler's Cumulative Avg. Economy Rate"){
        bowlerCumulativeAvgEconRate(bowlerDF,T20Bowler)
    } else if (func == "Bowler's Wicket Plot"){
        bowlerWicketPlot(bowlerDF,T20Bowler)
    } else if (func == "Bowler's Wickets against opposition"){
        bowlerWicketsAgainstOpposition(bowlerDF,T20Bowler)
    } else if (func == "Bowler's Wickets at Venues"){
        bowlerWicketsVenue(bowlerDF,T20Bowler)
    } else if (func == "Bowler's wickets prediction"){
        # This is for the function wicket predict
        bowlerDF1 <- NULL
        # Create a consolidated Data frame of batsman for all T20 teams played
        for (i in seq_along(teamNames)){    
            # The below 2 lines for Bowler's wicket prediction
            df1 <- getDeliveryWickets(team=teamNames[i],dir="./T20matches",name=T20Bowler,save=FALSE)
            bowlerDF1 <- rbind(bowlerDF1,df1)
        }
        bowlerWktsPredict(bowlerDF1,T20Bowler)
        
    }

}

