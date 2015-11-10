# Load the 'ISLR' package
library(ISLR)

# Load the 'dplyr' package
library(dplyr)

# Load the 'ggvis' data set
library(ggvis)

# Visualize the defaults by income and cc balance
 Default %>%ggvis(~balance, ~income) %>% 
   layer_points(size := 15, fill = ~default) %>% 
   add_axis("y", values = seq(20000,60000, by = 20000), title = "Income", title_offset = 70) %>% 
   add_axis("x", title = "Balance", title_offset = 50)


# Visualize the defaults by income status
Default %>% ggvis(~default, ~income)%>% layer_boxplots(fill = ~default) %>%
    add_axis("y", values = seq(20000,60000, by = 20000), title = "Income", title_offset = 70)


# Visualize the defaults by balance status
Default %>% ggvis(~default, ~balance)%>% layer_boxplots(fill = ~default) %>%
    add_axis("y", values = seq(500, 2500, by = 500), title = "Balance",  title_offset = 70) %>%
    add_axis("x", title = "Default")


# Logistic Regression of income, student, and balance on default rate
my_logit <- glm(default~balance + student + income, family = "binomial", data = Default)
summary(my_logit)$coef


# Logistic Regression of student on default rate
my_logit2 <- glm(default~student, family= "binomial", data = Default)
summary(my_logit2)$coef


# Logistic Regression of income on default rate
my_logit3 <- glm(default~balance, family = "binomial", data= Default)
summary(my_logit3)$coef

# Logistic Regression of income on default rate
my_logit4 <- glm(default~income, family = "binomial", data = Default)
> summary(my_logit4)$coef

# Visualize the relationship between student and balance
Default %>% ggvis(~student, ~balance) %>% layer_boxplots(fill = ~student) %>% 
    add_axis("y", values = seq(500,2000, by = 500), title = "Credit Card Balance", title_offset = 70) %>%
    add_axis("x", title = "Student Status")

# Visualize the relationship between student status and defaut
Default %>% ggvis(~student, ~balance) %>% layer_boxplots(fill = ~default) %>%
add_axis("y", values = seq(500,2000, by = 500), title = "Credit Card Balance", title_offset = 70) %>%
add_axis("x", title = "Student Status")










	
	
	
	
	
