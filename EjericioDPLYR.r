
library(dplyr)
library(ggplot2)

head(diamonds)

diamondsWork <- filter(diamonds, cut == "Ideal")
head(diamondsWork)

diamondsWork <- select(diamondsWork, carat, cut, color, price, clarity)
head(diamondsWork)

diamondsWork <- mutate(diamondsWork, caretprice = price/carat)
head(diamondsWork)

diamondsWork <- group_by(diamondsWork, color)
head(diamondsWork)
summarise(diamondsWork, max(price))

diamondsWork <- group_by(diamondsWork, color)
head(diamondsWork)
summarise(diamondsWork, max(caretprice))

diamondsWork <- diamondsWork %>% group_by(color) %>% summarise(med = mean(caretprice)) %>% arrange(desc(med))
diamondsWork
