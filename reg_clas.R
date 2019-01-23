
# ------------------ Building linear regression model ------------

# starting with iris dataset
data <- iris

plot(iris$Sepal.Length, iris$Petal.Length, xlab="Sepal Length", ylab="Petal Length", 
     main="Size of Irises")

lr <- lm(Petal.Length ~ Sepal.Length + Petal.Width, data=iris)
# ============  checking residual for normality =========
shapiro.test(lr$residuals)

abline(lr)
summary(lr)

# Why we should prefer adj-R2 instead of raw R2 ? 

# building non-linear regression model

nlr <- nls(Petal.Length~a * cos(Sepal.Length)^2 + b, data=data, start=list(a=1, b=2))
plot(data$Sepal.Length, data$Petal.Length)
points(data$Sepal.Length, predict(nlr, data$Sepal.Length), col="red")
summary(nlr)


# ========== Building supervised classification model ============

# Basic steps:
# 1) Determining the number of features, applying some feature engeneering technique. 
# 2) Selecting values features; remove correlated ones
# 3) building the model
# 4) evaluating the model
# 5) selecting the best model, applying the model and making valuable interpretations


# Supervised learning: building a simple model

# Making all caret utilites available in the main scope/environment
library(caret)
set.seed(14)

indices <- createDataPartition(iris$Species, p=0.7, list=FALSE)
load(iris)
iris <- predict(pr, iris[,1:5])

training.data <- iris[indices, ]
test.data <- iris[-indices, ]


clf_model <- train(training.data[,1:4], training.data[,5], method="knn",
                   preProcess=c("scale", "center"))

print(clf_model)
plot(clf_model)
predicted <- predict.train(clf_model, test.data[,1:4])



cfm <- confusionMatrix(predicted, test.data[,5])

print(cfm)






