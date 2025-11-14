library(tidyverse)

#1. define define the possible outcomes
foo <- tibble(
  x = seq(0, 100, length.out = 100)
)

#2. Choose our parameters
mu <- 45
sigma <- 16

#3. calculate density
foo <- mutate(foo, density = dnorm(x, mean = mu, sd = sigma ))

#4. plot it
ggplot(foo, aes(x, density)) +
  geom_line()
