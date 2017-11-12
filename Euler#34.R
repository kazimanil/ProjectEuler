curious <- as.data.table(rep(0, 1000)) # creating an empty array of zeros
x <- 3 # setting initial conditions
j <- 1 # setting initial conditions
i <- 1 # setting initial conditions
s <- 0 # setting initial conditions
while(x < 1000000) 
	{
	while(i <= nchar(x)) 
		{
		s <- s + factorial(as.numeric(substr(x, start = i, stop = i))) # s for factorial sums
		i <- i + 1 
		}
	if (s == x) 
		{
		curious[j] <- x
		}
	i <- 1     # resetting back to initial conditions
	s <- 0     # resetting back to initial conditions
	x <- x + 1 # moving on to the next number
	if (curious[j] > 0) 
		{
		j <- j + 1 # adding one to the count
		}
	}
print(paste0("Meraklı sayıların toplamı:", curious[, sum(V1)]))
