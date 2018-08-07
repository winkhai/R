#read the dataset
credit_risk <- read.csv("credit_data.csv",TRUE,",")

head(credit_risk)
nrows(credit_risk)

colnames(credit_risk) <- c("id","income","age","loan","LTI","default")

#reference the column without the $ operator
attach(credit_risk)

#splitting the training and a test dataset (80%-20%)
train_dataset <- id<1600
test_dataset <- !train_dataset

#logistic regression model with 3 predictors (income, age, loan)
model <- glm(formula=default~income+age+loan,data=credit_risk, subset=train_dataset, family="binomial")
summary(model)

#prediction with the model
probability_default <- predict(model, newdata=credit_risk_dataset[test_dataset,], type="response")

#in logistic regression, every output class has a probabilit associated with it.
#if this probability > 50% then it is 1, else it is 0
probability_default
predictions <- ifelse(probability_default>0.5,1,0)

#create confusion matrix
table(default[test_dataset],predictions)
#check the accuracy of this model with 3 predictors
mean(default[test_dataset]==predictions)
