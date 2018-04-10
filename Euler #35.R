source("Prime Number Detector.R") 
# this function derives a list of prime numbers upto specified number.
primenumbers <- as.data.table(pnd(1000000))
fwrite(primenumbers, "primenumbers.csv")
# NON COMPLETE