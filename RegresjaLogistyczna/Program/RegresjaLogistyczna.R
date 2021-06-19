library(OneR)
library(caret)

dane <- breastcancer

str(dane)
summary(dane)

podzial <- createDataPartition(dane$Class, p = 0.60, list = FALSE)
trening <- dane[podzial, ] 
test <- dane[-podzial, ]

model <- train(Class ~ `Clump Thickness` + `Uniformity of Cell Size`+ `Uniformity of Cell Shape` 
               + `Single Epithelial Cell Size` ,data = trening, method = "glm", family = "binomial")

predykcja <- predict(model, test[, -10])
table(predykcja, test[, 10])

eval_model(prediction = predykcja, test)

