source("Prime Number Detector.R") 
# this function derives a list of prime numbers upto specified number.
primenumbers <- as.data.table(pnd(2000000))
sum(primenumbers$V1) #142913828922

# fwrite(primenumbers, "primenumbers-2m.csv")
