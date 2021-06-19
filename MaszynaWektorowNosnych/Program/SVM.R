library(MASS)
library(e1071)
library(caret)
library(OneR)
library(BBmisc)

data(cats)
dane <- cats

str(dane)
summary(dane)


model_dane <- svm(Sex ~ ., data = dane_norm)
plot(model_dane, dane_norm)


dane_norm <- normalize(dane, method = "range", range = c(0,1))
head(dane_norm)
tail(dane_norm)
summary(dane_norm)
podzial <- createDataPartition(dane_norm$Sex, p = 0.60, list = FALSE)
trening <- dane[podzial, ] 
test <- dane[-podzial, ]
model_trening <- svm(Sex ~ ., data = trening)


predykcja <- predict(model_trening, test[, -1], type = "class")

eval_model(predykcja, test[,1])


