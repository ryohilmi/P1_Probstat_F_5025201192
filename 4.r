# 4.a
x <- 2
v <- 10

p <- dchisq(x, v)
p

# 4.b
x <- 1:100
chi_square <- rchisq(x, 10)
hist(chi_square)

# 4.c
rataan <- v
varian <- 2 * v

cat("Rataan : ", rataan, "\n")
cat("Varian : ", varian, "\n")