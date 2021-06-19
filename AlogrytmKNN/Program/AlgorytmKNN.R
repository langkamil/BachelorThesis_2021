library(BBmisc)
library(caret)
library(OneR)

dane <- iris
str(dane)
summary(dane)

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
  geom_point()

ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width, col = Species)) +
  geom_point()


dane_norm <- normalize(dane, method = "range", range = c(0,1))
head(dane)
head(dane_norm)

podzial <- createDataPartition(dane_norm$Species, p=0.75, list=FALSE)
trening <- dane_norm[podzial,]
test <- dane_norm[-podzial,]

model <- train(trening[, 1:4], trening[, 5],   method = 'knn')
model

predykcja <- predict.train(object = model, test[,1:4])


table(predykcja, test$Species)

eval_model(test$Species, predykcja)


