#########################################################################################################
#
# Title :  Inswinger - An interactive app to analyze International T20 Players, teams and matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 12 Feb 2017
# File: ui.R
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################
source("data.R")
source("definitions.R")
source("funcs.R")


shinyUI(navbarPage("Inswinger : yorkr analyzes International T20 with plots and tables!",
                   # Batsman tab
                   tabPanel("T20 batsman",
                            h4('Analyze T20 batsman performances'),
                            sidebarPanel(
                                selectInput('batsmanFunc', 'Select function', T20BatsmanFuncs),
                                selectInput('batsman', 'Select batsman', T20Batsmen,selectize=FALSE, size=20)
                            ),
                            mainPanel(
                                plotOutput('batsmanPlot'),
                                column(7, offset=4,
                                       tags$h5((tags$i("Designed and developed by Tinniam V Ganesh"))),
                                       tags$h5((tags$i("Feb 12,2017"))),
                                       tags$h6("Data source Cricsheet: http://cricsheet.org/")
                                )
                            )
                            
                   ),
                   # Bowlers tab
                   tabPanel("T20 bowlers",
                            
                            h4('Analyze T20 bowler performances'),
                            
                            sidebarPanel(
                                selectInput('bowlerFunc', 'Select function', T20BowlerFuncs),
                                selectInput('bowler', 'Select T20 bowler', T20Bowlers,selectize=FALSE, size=20)
                                
                                
                            ),
                            mainPanel(
                                plotOutput('bowlerPlot'),
                                column(7, offset=4,
                                       tags$h5((tags$i("Designed and developed by Tinniam V Ganesh"))),
                                       tags$h5((tags$i("Feb 12,2017"))),
                                       tags$h6("Data source Cricsheet: http://cricsheet.org/")
                                )
                            )
                            
                   ),
                   # Analyze T20 matches
                   tabPanel("T20 Match",
                            h4('Analyze an T20 match'),
                            sidebarPanel(
                                selectInput('matchFunc', 'Select match function', T20MatchFuncs),
                                selectInput('match', 'Select T20 match ', T20Matches,selectize=FALSE, size=15),
                                uiOutput("selectTeam"),
                                radioButtons("plotOrTable", label = h4("Plot or table"),
                                             choices = c("Plot" = 1, "Table" = 2), 
                                             selected = 1,inline=T)
                                
                            ),
                            mainPanel(
                                uiOutput("plotOrPrintT20Match"),
                                column(7, offset=4,
                                       tags$h5((tags$i("Designed and developed by Tinniam V Ganesh"))),
                                       tags$h5((tags$i("Feb 12,2017"))),
                                       tags$h6("Data source Cricsheet: http://cricsheet.org/")
                                )
                            )
                            
                   ),
                   # Analyze 2 Teams T20 matches
                   tabPanel("Head to head",
                            h4('Head-to-head between 2 T20 teams'),
                            sidebarPanel(
                                selectInput('matches2TeamFunc', 'Select function', T20Matches2TeamsFuncs),
                                selectInput('match2', 'Select matches', T20Matches2Teams,selectize=FALSE, size=13),                                
                                uiOutput("selectTeam2"),
                                radioButtons("plotOrTable1", label = h4("Plot or table"),
                                             choices = c("Plot" = 1, "Table" = 2), 
                                             selected = 1,inline=T),
                                radioButtons("repType", label = h4("Report Type"),
                                             choices = c("Summary" = 1, "Detailed" = 2), 
                                             selected = 1,inline=T)
                                
                            ),
                            mainPanel(
                                uiOutput("plotOrPrintT20Match2teams"),
                                column(7, offset=4,
                                       tags$h5((tags$i("Designed and developed by Tinniam V Ganesh"))),
                                       tags$h5((tags$i("Feb 12,2017"))),
                                       tags$h6("Data source Cricsheet: http://cricsheet.org/")
                                )
                            ) 
                           
                   ),
                   # Analyze T20 Team Overall Perf
                   tabPanel("Overall Performance",
                            h4("Analyze T20 team's overall performance"),
                            sidebarPanel(
                                selectInput('overallperfFunc', 'Select function', T20TeamOverallPerfFunc),
                                selectInput('teamMatches', 'Select the team', T20TeamsAll,selectize=FALSE, size=13),
                                uiOutput("Rank"),
                                radioButtons("plotOrTable2", label = h4("Plot or table"),
                                             choices = c("Plot" = 1, "Table" = 2), 
                                             selected = 1,inline=T),
                                radioButtons("repType2", label = h4("Report Type"),
                                             choices = c("Summary" = 1, "Detailed" = 2), 
                                             selected = 1,inline=T)
                            ),
                            mainPanel(
                                uiOutput('printOrPlotT20TeamPerfoverall'),
                                column(7, offset=4,
                                       tags$h5((tags$i("Designed and developed by Tinniam V Ganesh"))),
                                       tags$h5((tags$i("Feb 12,2017"))),
                                       tags$h6("Data source Cricsheet: http://cricsheet.org/")
                                )
                            ) 
                            
                   ),
                  
                   tabPanel("About",
                            h3("Inswinger - Analyzing International T20 Players, teams and matches with plots and tables"),
                            p("This Shiny app is based on my R package 'yorkr'. In this Shiny app, I use  the
                    yorkr package to analyze the performances of Intl. T20 cricketers,teams, matches."),
                            p("The R package 'yorkr' has been authored by Tinniam V Ganesh for analyzing  performances of Intl. T20 cricketers
                    teams, individudal T20 match, head-to-head and Intl. T20 teamds"),
                            p("This Shiny app 'GooglyPlus' has been designed and developed by  Tinniam V Ganesh, Dec 25 2016"),
                            p("The data for this Shiny app has been taken from Cricsheet - http://http://cricsheet.org/"),
                            p("More details about this app and for other posts, see my blog
                    http://gigadom.wordpress.com/")
                   )
                   
))
