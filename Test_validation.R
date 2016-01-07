# Open the ISLR package
library(ISLR)

# Set up the random number generator so that others can repeat results
set.seed(1)

# Create a sample of 5000 observations
train <- sample(10000,5000)

# Defaultx is a subset of the Default data that does not include the training data that
# we will fit the model on 
Defaultx <- Default[-train,]

# Fit the logistic model using the training data.  
glm.fit <- glm(default~ balance + student, data = Default, family = binomial, subset = train)

# Use the logistic model to fit the same logistic model, but use the test data.  
glm.probs <- predict(glm.fit, Defaultx, type = "response")

# Make a vector that contains 5000 no responses.   
glm.pred <- rep("No", 5000)

# Replace the no reponsees in the glm.pred vector where the probability is greater than 50% with "Yes"
glm.pred[glm.probs > .5] = "Yes"

# Create a vector that contains the defaults from the testing data set, Defaultx
defaultVector <- Defaultx$default 


# Calculate the mean of the values where the predicted value from the training equals the held out set.  
mean(glm.pred == defaultVector)





