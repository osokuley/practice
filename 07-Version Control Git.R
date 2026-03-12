# Version Control and Git lab --------------------------------

#Overview
# We will revisit our homework 4 data and model 
# It's the sea lion data!

#We were interested in assessing how the abundance of sea lions changes #with two variables: (1) human population density and (2) the amount of prey available. 
#We had counts of the number of sea lions at n = 100$ locations.
#No random effects
#Data was standardized

library(ggplot2)
library(lme4)
library(MASS)

load("sea-lions-counts.rda")
str(dat)


#Here's a plot so you remember what the data looks like
ggplot(data = dat, aes(x = pop, y = counts, fill = prey)) + 
  geom_point(pch = 21, size = 4) + 
  theme_bw(base_size = 18) + 
  scale_fill_viridis_c() + 
  labs(x = "Human population density", y = "Number of sea lions", 
       fill = 'Prey Availability')


#Let's fit a Poisson GLM
out.pois <- glm(counts ~ pop * prey, data = dat, family = poisson)
summary(out.pois)


#But a negative binomial GLM fit our data much better, remember= 
#Fit the NB GLM using the glm.nb() function 

out.nb <- glm.nb(counts ~ pop * prey, data = dat,)
summary(out.nb)

# Now, save your new code
# Commit your changes (always write a commit message)
# Push your changes
#Now close RStudio
#Open RStudio again
#Pull your code (in case you made changes elsewhere)
#Continue your work!
