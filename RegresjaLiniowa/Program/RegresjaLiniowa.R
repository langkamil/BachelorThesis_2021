library(gapminder)
library(caret)
library(tidyverse)

dane <- gapminder

head(dane)
str(dane)
summary(dane)

ggplot(dane, aes(year, lifeExp, group = country)) + geom_line()

jap <- filter (dane, country == 'Japan')
ggplot(jap, aes(year,lifeExp)) + geom_point(size = 3, colour = 'red')

model <- lm(formula = lifeExp ~ year, data = jap)
coef(model)


ggplot(jap, aes(year, lifeExp)) +   geom_point(size = 3, colour = 'red') +
  geom_abline( aes(intercept = model$coefficients[1], slope = model$coefficients[2]),
               colour = 'blue', size = 1)


residuals(model)

