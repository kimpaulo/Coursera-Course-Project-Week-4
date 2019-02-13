library(shiny)

shinyUI(
  navbarPage("Shiny Application",
             tabPanel("Analysis",
                      fluidPage(
                        titlePanel("The relationship between Automobile Design and Performance and Fuel consumption"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Number of cylinders" = "cyl",
                                          "Displacement (cu.in.)" = "disp",
                                          "Gross horsepower" = "hp",
                                          "Rear axle ratio" = "drat",
                                          "Weight (lb/1000)" = "wt",
                                          "1/4 mile time" = "qsec",
                                          "V/S" = "vs",
                                          "Transmission" = "am",
                                          "Number of forward gears" = "gear",
                                          "Number of carburetors" = "carb"
                                        )),
                            
                            checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                          ),
                          
                          mainPanel(
                            h3(textOutput("caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                        tabPanel("Model", 
                                                 plotOutput("mpgPlot"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             ),
             tabPanel("Dataset Overview",
                      
                      h3("Background"),
                      helpText("The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles"),
                      h3("Important"),
                      p("A data frame with 32 observations on 11 variables."),
                      
                      a("https://class.coursera.org/regmods-008")
             ),
             tabPanel("Data Details",
                      h2("Format"),
                      p("A data frame with 32 observations on 11 variables."),
                      
                      p("  mpg         Miles/(US) gallon"),
                      p("  cyl	 Number of cylinders"),
                      p("  disp	 Displacement (cu.in.)"),
                      p("  hp	 Gross horsepower"),
                      p("  drat	 Rear axle ratio"),
                      p("  wt	 Weight (lb/1000)"),
                      p("  qsec	 1/4 mile time"),
                      p("  vs	 V/S"),
                      p("  am	 Transmission (0 = automatic, 1 = manual)"),
                      p("  gear	 Number of forward gears"),
                      p("  carb	 Number of carburetors"),
                      
                      h3("Source"),
                      
                      p("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391-411.")
             ),
             tabPanel("Github Repository",
                      a("https://github.com/kimpaulo/Coursera-Course-Project-Week-4"),
                      hr(),
                      h4("Navigate through the application to see the relationship of various variables to mileage"),
                      h4("Github repository is Coursera Course Project Week 4 Course Project")
             )
  )
)