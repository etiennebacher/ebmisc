#' Print the R code to make the vector of 38 OECD countries used in Beine et al. 2020

oecd_countries <- function() {

  oecd <- c("United States", "France", "United Kingdom", "Germany",
            "Canada", "Spain", "Australia", "Italy", "Switzerland",
            "Sweden", "Japan", "Netherlands", "Turkey", "Austria",
            "Norway", "Belgium", "New Zealand", "Greece", "Denmark",
            "Korea", "Finland", "Ireland", "Portugal", "Czech Republic",
            "Poland", "Cyprus", "Luxembourg", "Romania", "Bulgaria",
            "Croatia", "Iceland", "Slovenia", "Hungary", "Malta",
            "Estonia", "Lithuania", "Slovakia", "Latvia")
  print(
    paste0("c('", paste(oecd, collapse = "', '"), "')")
  )
}
