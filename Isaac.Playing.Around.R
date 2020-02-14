# directory stuff
getwd()



# install gtrends package

install.packages("gtrendsR")

library(gtrendsR)
(categories$id[categories$name == "Sexual Enhancement"])


quest.searches <- gtrends(keyword = "quest university canada", geo = "", time = "now 1-d",
                          gprop = c("web", "news", "images", "froogle", "youtube"),
                          category = 0, hl = "en-US", low_search_volume = FALSE,
                          cookie_url = "http://trends.google.com/Cookies/NID", tz = 0,
                          onlyInterest = FALSE)

quest.searches$interest_by_country



c(1,3,1,325,56,24,45,2,32) %>%
  sqrt() %>%
  log() %>%
  sum()
  
