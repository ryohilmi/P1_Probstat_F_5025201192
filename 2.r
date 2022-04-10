# 2.a
pasien <- 20
p_sembuh <- 0.2
p_tidak_sembuh <- 1 - p_sembuh
pasien_sembuh <- 4

res <- dbinom(pasien_sembuh, pasien, p_sembuh)
cat("Peluang pasien sembuh: ", res * 100, "%\n")

# 2.b
p <- dbinom(1:20, 20, 0.2)
data <- data.frame(y = c(p), x = c(1:20))
ggplot(mapping = aes(x = data$x, y = data$y)) +
  geom_col() +
  geom_text(
    aes(label = round(p, 3), y = p + 0.01),
    size = 3
  ) +
  scale_x_continuous(labels = data$x, breaks = data$x) +
  labs(x = "(x) gagal sebelum sukses pertama", y = "Peluang") 

# 2.c
rataan <- pasien_sembuh * p_sembuh
cat ("rataan = ", rataan, "\n")
varian <- pasien_sembuh * p_sembuh * p_tidak_sembuh
cat ("varian = ", varian, "\n")