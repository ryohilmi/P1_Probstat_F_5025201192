# 5.a
m <- 3
set.seed(1)
p <- dexp(rexp(1, rate = m), rate = m)
p

# 5.b
hist(rexp(10, rate = m))
hist(rexp(100, rate = m))
hist(rexp(1000, rate = m))
hist(rexp(10000, rate = m))

# 5.c
rataan <- 1 / m
varian <- 1 / (m ^2)

cat("rataan: ", rataan, "\n")
cat("varian: ", varian, "\n")