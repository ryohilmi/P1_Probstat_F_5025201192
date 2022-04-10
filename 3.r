# 3.a
m <- 4.5
x <- 6
p <- dpois(x, m)

cat("Peluang 6 bayi lahir: ", p * 100, "%\n")

# 3.b
n <- 6

data.frame(x = 1:15, prob = dpois(x, m)) %>%
mutate(Kelahiran = ifelse(x == n, n, "other")) %>%
ggplot(aes(x = factor(x), y = prob, fill = Kelahiran)) +
geom_col() +
geom_text(
  aes(label = round(prob,2), y = prob + 0.01),
  position = position_dodge(0.9),
  size = 3,
  vjust = 0
) +
labs(title = "Peluang 6 bayi lahir",
     x = "Jumlah Kelahiran",
     y = "Peluang")

# 3.c
rataan <- m
varian <- m

cat("Rataan: ", rataan, "\n")
cat("Varian: ", varian, "\n")