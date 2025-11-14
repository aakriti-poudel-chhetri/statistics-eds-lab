library(tidyverse)

#1. define define the possible outcomes
foo <- tibble(
  x = seq(0, 20, by = 1)
)

#2. Choose our parameters
shape <- 2
rate <- 1

#3. calculate density
foo <- mutate(foo, density = dgamma(x, shape = shape, rate = rate))

#4. plot it
ggplot(foo, aes(x, mass)) +
  geom_line()
