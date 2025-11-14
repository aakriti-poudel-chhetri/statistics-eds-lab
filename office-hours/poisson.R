library(tidyverse)

#1. define define the possible outcomes
foo <- tibble(
  x = seq(0, 20, by = 1)
)

#2. Choose our parameters
lambda <- 5

#3. calculate density
foo <- mutate(foo, density = dpois(x, lambda = lambda))

#4. plot it
ggplot(foo, aes(x, mass)) +
  geom_line()
