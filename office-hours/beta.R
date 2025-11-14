library(tidyverse)

### PDF

#1. define the possible outcomes
# Beta (2, 7)
beta_pdf <- tibble(x = seq(0, 1, length.out  = 100))

#2. Choose our parameters
a <- 2
b <- 7

#3. calculate the PMF/PDF
beta_pdf <- mutate(beta_pdf,
                     pdf = dbeta(x, shape1 = a, shape2 = b))
#4. plot it
ggplot(beta_pdf, aes(x, pdf)) +
  geom_line(linewidth = 2) +
  theme_classic()
