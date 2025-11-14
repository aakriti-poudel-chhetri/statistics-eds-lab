library(tidyverse)

#1. define the possible outcomes
# Binomial(1, 0.5) -> 0, 1
binom_pmf <- tibble(x = c(0, 1))

#2. Choose our parameters
n <- 1
p <- 0.5

#3. calculate the PMF/PDF
binom_pmf <- mutate(binom_pmf,
                    pmf = dbinom(x, size =n, prob =p))
#4. plot it
ggplot(binom_pmf, aes(x, pmf)) +
  geom_point(size =3) +
  theme_classic()


#1. define the possible outcomes
# Binomial(10, 0.4)
binom_pmf <- tibble(x = 0:10)

#2. Choose our parameters
n <- 10
p <- 0.4

#3. calculate the PMF/PDF
binom_pmf <- mutate(binom_pmf,
                    pmf = dbinom(x, size =n, prob =p))
#4. plot it
ggplot(binom_pmf, aes(x, pmf)) +
  geom_point(size = 3) +
  theme_classic()


### PDF

#1. define the possible outcomes
# Normal(0, 1)
normal_pdf <- tibble(x = seq(-3, 3, length.out  = 100))

#2. Choose our parameters
mu <- 0
sigma <- 1

#3. calculate the PMF/PDF
normal_pdf <- mutate(normal_pdf,
                     pdf = dnorm(x, mean = mu, sd = sigma))
#4. plot it
ggplot(normal_pdf, aes(x, pdf)) +
  geom_line(linewidth = 2) +
  geom_point(data = slice(normal_pdf, 50),
             color = "gold", size =3)
  theme_classic()

  pnorm(-2, mean = mu, sd = sigma)