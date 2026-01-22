mod_team_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    div(
      class = "team-section",
      
      h2("THE TEAM BEHIND ESI"),
      
      div(
        class = "team-flex team-grid",
        
        div(
          class = "team-grid-wrapper",
          
          # Member 1
          tags$a(
            class = "team-grid-member parallaxit",
            href = "https://researchportalplus.anu.edu.au/en/persons/steven-lade",
            
            tags$img(
              src = "assets/images/steve-lade.jpg",
              alt = "Steve Lade"
            ),
            
            div(
              class = "team-grid-member-info color-white",
              p(class = "name", "Steve Lade"),
              p(class = "title", "ARC Future Fellow at Fenner School of Environment and Society")
            )
          ),
          
          # Member 2
          tags$a(
            class = "team-grid-member parallaxit",
            href = "https://www.stockholmresilience.org/meet-our-team/staff/2012-09-05-fetzer.html",
            
            tags$img(
              src = "assets/images/ingo-fetzer.jpg",
              alt = "Ingo Fetzer"
            ),
            
            div(
              class = "team-grid-member-info color-white",
              p(class = "name", "Ingo Fetzer"),
              p(class = "title", "Researcher")
            )
          ),
          
          # Member 3
          tags$a(
            class = "team-grid-member parallaxit",
            href = "https://www.stockholmresilience.org/meet-our-team/staff/2008-08-19-crona.html",
            
            tags$img(
              src = "assets/images/beatrice-crona.jpg",
              alt = "Beatrice Crona"
            ),
            
            div(
              class = "team-grid-member-info color-white",
              p(class = "name", "Beatrice Crona"),
              p(class = "title", "Professor, Science Director")
            )
          ),
          
          # Member 4
          tags$a(
            class = "team-grid-member parallaxit",
            href = "https://www.gedb.se/team/namnlos",
            
            tags$img(
              src = "assets/images/giulia-rubin.jpg",
              alt = "Giulia Rubin"
            ),
            
            div(
              class = "team-grid-member-info color-white",
              p(class = "name", "Giulia Rubin"),
              p(class = "title", "Research Assistant")
            )
          ),
          
          # Member 5
          tags$a(
            class = "team-grid-member parallaxit",
            href = "https://www.stockholmresilience.org/meet-our-team/staff/2024-04-23-parlato.html",
            
            tags$img(
              src = "assets/images/giorgio-parlato.jpg",
              alt = "Giorgio Parlato"
            ),
            
            div(
              class = "team-grid-member-info color-white",
              p(class = "name", "Giorgio Parlato"),
              p(class = "title", "PhD Candidate")
            )
          ),
          
          # Member 6
          tags$a(
            class = "team-grid-member parallaxit",
            href = "https://fennerschool.anu.edu.au/people/charlotte-kendra-gotangco-gonzales",
            
            tags$img(
              src = "assets/images/kendra-gonzales.jpg",
              alt = "Kendra Gonzales"
            ),
            
            div(
              class = "team-grid-member-info color-white",
              p(class = "name", "Kendra Gonzales"),
              p(class = "title", "Researcher")
            )
          ),
          
          # Member 7
          tags$a(
            class = "team-grid-member parallaxit",
            href = "https://www.gedb.se/team/dario-marone",
            
            tags$img(
              src = "assets/images/dario-marone.jpg",
              alt = "Dario Marone"
            ),
            
            div(
              class = "team-grid-member-info color-white",
              p(class = "name", "Dario Marone"),
              p(class = "title", "Research Assistant")
            )
          ),
          
          # Member 8
          tags$a(
            class = "team-grid-member parallaxit",
            href = "INSERT HERE",
            
            tags$img(
              src = "assets/images/INSERT HERE.jpg",
              alt = "Aryanie Amellina"
            ),
            
            div(
              class = "team-grid-member-info color-white",
              p(class = "name", "Aryanie Amellina"),
              p(class = "title", "Researcher")
            )
          ),
          
          # Member 9
          tags$a(
            class = "team-grid-member parallaxit",
            href = "INSERT HERE",
            
            tags$img(
              src = "assets/images/INSERT HERE.jpg",
              alt = "Hannah Zoller"
            ),
            
            div(
              class = "team-grid-member-info color-white",
              p(class = "name", "Hannah Zoller"),
              p(class = "title", "Postdoc researcher")
            )
          ),
          # Member 10
          tags$a(
            class = "team-grid-member parallaxit",
            href = "INSERT HERE",
            
            tags$img(
              src = "assets/images/INSERT HERE.jpg",
              alt = "Juan Carlos Rocha Gordo"
            ),
            
            div(
              class = "team-grid-member-info color-white",
              p(class = "name", "Juan Carlos Rocha Gordo"),
              p(class = "title", "Researcher")
            )
          ),
          # Member 11
          tags$a(
            class = "team-grid-member parallaxit",
            href = "INSERT HERE",
            
            tags$img(
              src = "assets/images/INSERT HERE.jpg",
              alt = "Lan Wang Erlandsson"
            ),
            
            div(
              class = "team-grid-member-info color-white",
              p(class = "name", "Lan Wang Erlandsson"),
              p(class = "title", "Researcher")
            )
          ),
          # Member 12
          tags$a(
            class = "team-grid-member parallaxit",
            href = "INSERT HERE",
            
            tags$img(
              src = "assets/images/INSERT HERE.jpg",
              alt = "Tanya Fiedler"
            ),
            
            div(
              class = "team-grid-member-info color-white",
              p(class = "name", "Tanya Fiedler"),
              p(class = "title", "Researcher")
            )
          ),
          # Member 13
          tags$a(
            class = "team-grid-member parallaxit",
            href = "INSERT HERE",
            
            tags$img(
              src = "assets/images/INSERT HERE.jpg",
              alt = "Jeanne Vu"
            ),
            
            div(
              class = "team-grid-member-info color-white",
              p(class = "name", "Jeanne Vu"),
              p(class = "title", "Research Assistant")
            )
          )
        )
      )
    )
  )
}

mod_team_server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}

