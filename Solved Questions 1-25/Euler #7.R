# The file below provides the results of the Prime Number Detector function upto 100000
 # source("Prime Number Detector.R") 
 # # this function derives a list of prime numbers upto specified number.
 # primenumbers <- as.data.table(pnd(1000000))

fread("primenumbers.csv")[10001, 1]
