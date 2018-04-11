source("Prime Number Detector.R") 
# this function derives a list of prime numbers upto specified number.
primenumbers <- pnd(2000000)
x <- 600851475143 # the number to examine
lpfn <- data.table(n = rep(600851475143, length(primenumbers)),
                   primes = primenumbers)
lpfn[, prime_mod := n %% primes]
lpfn[prime_mod == 0, max(primes)] # 6857 is the answer