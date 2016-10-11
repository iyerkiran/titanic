setwd('c:/Kiran/dummy/ML/Kaggle/Titanic')
train <- read.csv("train.csv", stringsAsFactors = FALSE)
str(train)
summary(train)

prop.table(table(train$Survived))

table(train$Sex, train$Survived) # indicates more females survived 
table(train$Pclass, train$Survived)
table(train$Age, train$Survived)

summary(train$Age)

library(rpart)
fit <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked,
             data=train,
             method="class")

Prediction <- predict(fit, test, type = "class")
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction)
write.csv(submit, file = "Raw_Rpart_Submission1.csv", row.names = FALSE)

