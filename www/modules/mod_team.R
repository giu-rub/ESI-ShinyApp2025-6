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
              alt = "C. Kendra Gotangco Gonzales"
            ),
            
            div(
              class = "team-grid-member-info color-white",
              p(class = "name", "C. Kendra Gotangco Gonzales"),
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
            href = "https://fennerschool.anu.edu.au/people/aryanie-amellina",
            
            tags$img(
              src = "assets/images/Aryanie-Amellina.jpg",
              alt = "Aryanie Amellina"
            ),
            
            div(
              class = "team-grid-member-info color-white",
              p(class = "name", "Aryanie-Amellina"),
              p(class = "title", "Researcher")
            )
          ),
          
          # Member 9
          tags$a(
            class = "team-grid-member parallaxit",
            href = "https://www.stockholmresilience.org/meet-our-team/staff/2024-05-13-zoller.html",
            
            tags$img(
              src = "assets/images/Hannah-Zoller.jpg",
              alt = "Hannah Zoller"
            ),
            
            div(
              class = "team-grid-member-info color-white",
              p(class = "name", "Hannah Zoller"),
              p(class = "title", "Postdoctoral Researcher")
            )
          ),
          # Member 10
          tags$a(
            class = "team-grid-member parallaxit",
            href = "https://www.stockholmresilience.org/meet-our-team/staff/2011-08-25-rocha.html",
            
            tags$img(
              src = "assets/images/Juan-Rocha.jpg",
              alt = "Juan Carlos Rocha Gordo"
            ),
            
            div(
              class = "team-grid-member-info color-white",
              p(class = "name", "Juan Carlos Rocha Gordo"),
              p(class = "title", "Senior Researcher")
            )
          ),
          # Member 11
          tags$a(
            class = "team-grid-member parallaxit",
            href = "https://www.stockholmresilience.org/meet-our-team/staff/2013-10-23-wang-erlandsson.html",
            
            tags$img(
              src = "assets/images/Lan-Wang.jpg",
              alt = "Lan Wang Erlandsson"
            ),
            
            div(
              class = "team-grid-member-info color-white",
              p(class = "name", "Lan Wang Erlandsson"),
              p(class = "title", "Senior Researcher")
            )
          ),
          # Member 12
          tags$a(
            class = "team-grid-member parallaxit",
            href = "https://research.unsw.edu.au/people/dr-tanya-fiedler",
            
            tags$img(
              src = "assets/images/Tanya-Fiedler.jpg",
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
            href = "https://www.stockholmresilience.org/meet-our-team/staff/2025-06-09-vu.html",
            
            tags$img(
              src = "assets/images/Jeanne-Vu.jpg",
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

