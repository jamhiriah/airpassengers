library(shiny)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Monthly Airline Passenger Numbers from Year 1949 to 1960"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with input
      sidebarPanel(
        selectInput("inyear", "Year:", 
                    choices=c("1949":"1960"),selected = 1949),
        hr(),
        checkboxInput("inallyears", "Show All Year", value = FALSE, width = NULL),
        radioButtons("plottype", "Plot type:", choices=c("bar","line"), selected = "bar"),
        helpText("The classic Box & Jenkins airline data. Monthly totals of international airline passengers, 1949 to 1960."),
        helpText(   a("Source Codes at Github",     href="https://github.com/jamhiriah/airpassengers"))
        ),
      
      # Create a spot for tab panel
      mainPanel(
       tabsetPanel(
          tabPanel("Plot", plotOutput("apPlot")), 
          tabPanel("Table", DT::dataTableOutput("apTable")),
          tabPanel("Documentation", includeHTML("doc.html"))
        )
      )
      
    )
  )
)
