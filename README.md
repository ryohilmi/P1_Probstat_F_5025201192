# Soal 1

Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia
bertemu dengan seseorang yang menghadiri acara vaksinasi sebelumnya

```{.R}
library(dplyr)
library(ggplot2)
```

- a\. Berapa peluang penyurvei bertemu x = 3 orang yang tidak
  menghadiri acara vaksinasi sebelum keberhasilan pertama ketika p =
  0,20 dari populasi menghadiri acara vaksinasi ? (distribusi
  Geometrik)

```{.R}
# 1.a
p <- 0.20
n <- 3

res <- dgeom(x = n, prob = p)
cat(res * 100, "%\n")
```

    10.24 %

- b\. mean Distribusi Geometrik dengan 10000 data random , prob = 0,20
  dimana distribusi geometrik acak tersebut X = 3 ( distribusi
  geometrik acak () == 3 )

```{.R}
# 1.b
p <- 0.20

res <- mean(rgeom(n = 10000, prob = p) == 3)
cat(res * 100, "%\n")
```

    10.3 %

- c\. Bandingkan Hasil poin a dan b , apa kesimpulan yang bisa
  didapatkan? `<br />`{=html}Jawaban: Hasil dari poin a dan b memiliki
  perbedaan yang tidak terlalu jauh`<br />`{=html}
- d\. Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum
  Sukses Pertama

```{.R}
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
  labs(x = "(x) gagal sebelum sukses pertama", y = "Peluang")
```

![](https://cdn.discordapp.com/attachments/755737092507566270/962731422022516816/541fa3f829ad2e999366f905145362cac949db95.png){height="420"
width="420"}

- e\. Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Geometrik.

```{.R}
p <- 0.20

rataan <- 1 / p
varian <- (1 - p) / p^2

cat("Rataan: ", rataan, "\n")
cat("Varian: ", varian, "\n")
```

    Rataan:  5
    Varian:  20

# Soal 2

Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2

- a\. Peluang terdapat 4 pasien yang sembuh
-

```{.R}
# 2.a
pasien <- 20
p_sembuh <- 0.2
p_tidak_sembuh <- 1 - p_sembuh
pasien_sembuh <- 4

res <- dbinom(pasien_sembuh, pasien, p_sembuh)
cat("Peluang pasien sembuh: ", res * 100, "%\n")
```

Peluang pasien sembuh: 21.81994 %

- b\. Gambarkan grafik histogram berdasarkan kasus tersebut.
-

```{.R}
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
```

![](https://cdn.discordapp.com/attachments/755737092507566270/962733489449467944/output.png){height="420"
width="420"}

- c\. Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Binomial.
-

```{.R}
# 2.c
rataan <- pasien_sembuh * p_sembuh
cat ("rataan = ", rataan, "\n")
varian <- pasien_sembuh * p_sembuh * p_tidak_sembuh
cat ("varian = ", varian, "\n")
```

rataan = 0.8
varian = 0.64

# Soal 4

Diketahui nilai x = 2 dan v = 10

- a\. Fungsi Probabilitas dari Distribusi Chi-Square.

```{.R}
x <- 2
v <- 10

p <- dchisq(x, v)
p
```

```{=html}
0.00766415502440505
```

- b\. Histogram dari Distribusi Chi-Square dengan 100 data random.

```{.R}
x <- 1:100
chi_square <- rchisq(x, 10)
hist(chi_square)
```

![](https://cdn.discordapp.com/attachments/755737092507566270/962734833908473856/92a182cccbd8183d2c17dbe3864c0baca7d20985.png)

- c\. Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Chi-Square.

```{.R}
rataan <- v
varian <- 2 * v

cat("Rataan : ", rataan, "\n")
cat("Varian : ", varian, "\n")
```

    Rataan :  10
    Varian :  20

# Soal 5

Diketahui bilangan acak (random variable) berdistribusi exponential (λ =
3). Tentukan

- a\. Fungsi Probabilitas dari Distribusi Exponensial

```{.R}
m <- 3
set.seed(1)
p <- dexp(rexp(1, rate = m), rate = m)
p
```

```{=html}
1.40977547699905
```

- b\. Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan
  10000 bilangan random

```{.R}
hist(rexp(10, rate = m))
```

![](https://cdn.discordapp.com/attachments/755737092507566270/962736160495525898/40b89769caacef1c6783edead4be4130ae6f86df.png)

```{.R}
hist(rexp(100, rate = m))
```

![](https://cdn.discordapp.com/attachments/755737092507566270/962736220876714064/35793ea3e85e56e3521cd79e7fe162a84c8b16e9.png)

```{.R}
hist(rexp(1000, rate = m))
```

![](https://cdn.discordapp.com/attachments/755737092507566270/962736230175494194/c6c47aff591ab6049e314e13b13e53e4eb3ceea9.png)

````{.R}
hist(rexp(10000, rate = m))

![](https://cdn.discordapp.com/attachments/755737092507566270/962736240027918406/366ec16c476e12ab5236863acdae41d32ba08b3c.png)

-   c\. Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Exponensial
    untuk n = 100 dan λ = 3

``` {.R}
rataan <- 1 / m
varian <- 1 / (m ^2)

cat("rataan: ", rataan, "\n")
cat("varian: ", varian, "\n")
````

    rataan:  0.3333333
    varian:  0.1111111
