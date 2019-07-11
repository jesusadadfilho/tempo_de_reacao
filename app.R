#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)

# Define UI for application that draws a histogram
ui <- fluidPage(dashboardPage(
  skin = "purple",
  dashboardHeader(title = "Analise de chuvas"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Sobre", tabName = "Sobre", icon = icon("search")),
      menuItem("Variaveis", tabName = "Variaveis", icon = icon("th")),
      menuItem("informações dos treinos", tabName = "informacoes_dos_treinos", icon = icon("list-alt")),
      menuItem("Analise grafica", tabName = "Analise_grafica", icon = icon("signal"))
    )
  ),
  dashboardBody(
    
    tabItems(
      tabItem(tabName = "Sobre",
              box(HTML("<h3>Integrantes<br></h3>
                       Paulo Roberto Ferreira Viana Filho<br>
                       Vinicius Tomaz Oliveira Costa Mascarenhas<br>
                       Jesus Abrahão Adad Filho<br>
                       Marcelo Alves Pereira<br>
                       Filipe Vilanova Neiva<br><br>
                       <h3>Base:</h3><br>
                       <h4>Local:</h4>  Testes realizados no IFPI campus teresina central<br>
                       Os atletas obeservados pratica Kendo no propria instituição, são eles:<br>
                        1 Shodan, 1 Ikkyu e 2 atletas sem graduação.
                       <h4>Variáveis:</h4> Temperatura máxima média,
                       Temperatura mínima média, Umidade relativa
                       média, Precipitação total(mm),
                       Data, Hora.<br>
                       <h4>Interesse:</h4>
                       Estimar a média volume mensal de chuvas em Teresina.
                       Estimar os períodos mais chuvosos de Teresina.
                       Estimar os períodos de maior temperatura em Teresina.
                       Estimar os períodos de menor temperatura em Teresina.
                       Estimar os períodos mais úmidos em Teresina."))),
      tabItem(tabName = "Variaveis",
              box(
                fluidRow(
                  column(12,
                         h1(align = "center", "Classificação das variaveis"),
                         align = "center",
                         hr(),
                         fluidRow(
                           column(width = 6 ,
                                  p(align = "center", "Atleta Codigo"),
                                  hr(),
                                  p(align= "center", "Nome"),
                                  hr(),
                                  p(align = "center", "Data e hora de criação"),
                                  hr(),
                                  p(align= "center", "Tempo de reação(ms)"),
                                  hr(),
                                  p(align = "center", "Data de nascimento"),
                                  hr(),
                                  p(align = "center", "Genero")
                           ),
                           column(width = 6,
                                  p(align = "center", "Qualitativa ordinal"),
                                  hr(),
                                  p(align= "center", "Quanlitativa nominal"),
                                  hr(),
                                  p(align = "center", "Quantitativo contínuo"),
                                  hr(),
                                  uiOutput(align = "center", "url")),
                           p(align = "center", "Quantitativo contínuo"),
                           hr(),
                           p(align= "center", "Quantitativo contínuo"),
                           hr(),
                           p(align = "center", "Qualitativa nominal"),
                           hr()
                         )
                  )
                ))),
      tabItem(tabName = "informacoes_dos_treinos",
              box(
                title = "Informações dos treinos", width = NULL, status = "primary",
                div(style = 'overflow-x: scroll', tableOutput("table_treinos")))
              
      ),
      tabItem(tabName = "Analise_grafica",
              mainPanel(
                plotOutput('table_mes_chuvas')
              )
              
              
      )
              )
      ))
   
   
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  base <- read.csv2("TREINO.csv", encoding="UTF-8")
  output$table_treinos <- renderTable(base,bordered = TRUE)
   
}

# Run the application 
shinyApp(ui = ui, server = server)

