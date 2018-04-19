# First three terms of a Fibonacci sequence
x = as.numeric(c(1,1,2))
# Fibonacci Sequence Generator
while (nchar(x) < 1000){
  len = length(x)
  x <- append(x,
              x[len] + x[len - 1])
}
# Generator is stopped at 1000 digits.
print(len + 1)