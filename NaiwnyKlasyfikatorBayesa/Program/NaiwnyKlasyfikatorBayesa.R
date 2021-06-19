library(mlbench)
library(e1071)
library(OneR)
library(caret)

data(PimaIndiansDiabetes)
dane <- PimaIndiansDiabetes

head(dane)
str(dane)
summary(dane)

dane <- data.frame(sapply(dane, as.factor))
dane_fix <- dane[!(apply(dane[,2:9], 1, function(y) any(y == 0))),]

podzial <- createDataPartition(dane_fix$diabetes, p = 0.80, list = FALSE)

trening <- dane_fix[podzial, ]
test <- dane_fix[-podzial, ]

model <- naiveBayes(diabetes ~ ., data = trening)


predykcja <- predict(model, test)

table(predykcja, test$diabetes)
eval_model(test$diabetes , predykcja)

