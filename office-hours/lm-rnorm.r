library(tidyverse)

# How does snow change with latitude across plains and mountains?

# 1. Read the model definition
# ACTUALLY the data generating process
# snow ~ Normal(mu, sigma)
# mu = beta_0 + beta_1 * lat + beta_2 * biomePlain

# 2. Choose parameters and predictors
# parameters
beta_0 <- 70
beta_1 <- 1.5
beta_2 <- -50
beta_3 <- -120
sigma <- 15

# predictors
biome <- sample(c("mountains", "plains", "rivers"), 700, replace = TRUE)
biomePlain <- as.integer(biome == "plains")
biomeRiver <- as.integer(biome == "rivers")
latitude <- rnorm(700, 
                  mean = case_when(
                    biome == "mountains" ~ 50,
                    biome == "plains" ~ 15,
                    biome == "rivers" ~ 70
                  ),
                  sd = 12)

tibble(latitude, biome) %>% 
  ggplot(aes(latitude, color = biome)) +
  geom_density() +
  theme_classic(18)

# 3. use RVs to generate the response
mu <- beta_0 + beta_1 * latitude + beta_2 * biomePlain + beta_3 * biomeRiver
snow <- rnorm(700, mean = mu, sd = sigma)  
snow_data <- tibble(latitude, biome, snow)
ggplot(snow_data, aes(latitude, snow, color = biome)) +
  geom_point() +
  scale_color_manual(values = c("firebrick", "cornflowerblue", "hotpink")) +
  theme_classic(18)

# 4. fit model to simulated data
snow_model_full <- lm(snow ~ latitude + biome, data = snow_data)
summary(snow_model_full)  

# lm model specification
# response ~ predictor1 + predictor2 + predictor3...
  

# What about the WRONG model? I.e., one without the confounding variable included
snow_model_confounded <- lm(snow ~ latitude, data = snow_data)
summary(snow_model_confounded)
  
  
  
  
  
library(palmerpenguins)
ggplot(penguins, aes(body_mass_g, flipper_length_mm, color = island, shape = species)) +
  geom_point() +
  theme_classic(18)
# fit lm to more than 1 categorical *variable* (not to be confused with 1 categorical variable with multiple categories)  
penguin_model <- lm(flipper_length_mm ~ body_mass_g + island + species,
                    data = penguins)
summary(penguin_model)
  
  
  
# PDF
# Not for printing, but for making random numbers
foo <- tibble(x = rnorm(10000, mean = 2, sd = 0.5)) 
ggplot(foo, aes(x)) +
  geom_density() +
  theme_classic(18)
# are 2.5% of the random numbers less than 1?
mean(foo$x < 1)






