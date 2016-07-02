
library(ggplot2)

head(diamonds)

numlist100 <- sample(1:length(diamonds[[1]]), 100)
head(numlist100)
length(numlist100)

subset100diamonds <- diamonds[numlist100, ]
head(subset100diamonds)
dim(diamonds)

caremin <- min(subset100diamonds[1])
caremax <- max(subset100diamonds[1])
pricemin <- min(subset100diamonds[7])
pricemax <- max(subset100diamonds[7])
caremin
caremax
pricemin
pricemax

grafica <- ggplot(subset100diamonds, aes(x=carat, y=price, color=color))

grafica + geom_point() + xlab('Quilates') + ylab('Precio') + xlim(caremin, caremax) + ylim(pricemin, pricemax) + geom_smooth(method = 'lm', formula=y~x, aes(group=1))


