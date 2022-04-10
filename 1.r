library(dplyr)
library(ggplot2)
# 1.a
p <- 0.20
n <- 3

res <- dgeom(x = n, prob = p)
cat(res * 100, "%\n")

# 1.b
p <- 0.20

res <- mean(rgeom(n = 10000, prob = p) == 3)
cat(res * 100, "%\n")

# 1.d
p <- 0.20
n <- 3

data.frame(x = 1:10, prob = dgeom(x = 1:10, prob = p))  %>%
  mutate(Gagal = ifelse(x == n, n, "lainnya")) %>%
ggplot(aes(x = factor(x), y = prob, fill = Gagal)) +
  geom_col() +
  geom_text(
    aes(label = round(prob, 2), y = prob + 0.01),
    size = 3
  ) +
  labs(x = "(x) gagal sebelum sukses pertama", y = "Peluang") p <- 0.20

# 1.e
rataan <- 1 / p
varian <- (1 - p) / p^2

cat("Rataan: ", rataan, "\n")
cat("Varian: ", varian, "\n")