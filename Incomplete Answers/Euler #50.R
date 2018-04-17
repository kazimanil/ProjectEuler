# this files holds the info of prime numbers upto 1m.
# I have used the "Prime Number Detector.R" code to generate this file in other examples.
primes <- fread(input = "primenumbers.csv")[, 1][order(primenumbers)]
primes[, primesum := cumsum(primenumbers)]
primes[primesum %in% primenumbers]
# did not consider that the starting prime number can be any of the list.