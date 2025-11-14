library(tidyverse)
library(palmerpenguins)

# bill length ~ interaction of body mass and sex
penguin_int_mod <- lm(bill_length_mm ~ body_mass_g + sex + body_mass_g:sex,
                      penguins)
summary(penguin_int_mod)

# Short hand for interactions
penguin_int_mod2 <- lm(bill_length_mm ~ body_mass_g * sex, penguins)
summary(penguin_int_mod2)

# summary gives the more information
# default print in R gives short information