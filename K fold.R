# Seed the random number generator 
set.seed(2)

# Fit a logistic model using default and income values
glm.fit1 <- glm(default~income + balance, data = Default, family = binomial)

# Create a vector with three blank values
cv.error <- rep(0,3)


# Store the results of each K  validation set into cv.error.  Use K= {3,5,10} 
cv.error[1] <- cv.glm(Default, glm.fit1, K=3)$delta[1]
cv.error[2] <- cv.glm(Default, glm.fit1, K=5)$delta[1]
cv.error[3] <- cv.glm(Default, glm.fit1, K=10)$delta[1]

1- mean(cv.error) 