a <- as.data.table(rep(0, 10000)) # Creating an empty vector
a[1] <- 1 # Setting first  element to start a Fibonacci series.
a[2] <- 2 # Setting second element to start a Fibonacci series.
while (max(a$V1) < 10^1000) # while loop to create other elements of a Fibonacci series upto 4m
{
	lena <- which.max(a$V1) + 1
	a[lena]$V1 <- a[lena - 1]$V1 + a[lena - 2]$V1
}
a <- a[V1 != 0 & V1 < 4000000] # Lets get rid of undesired lines
a[V1 %% 2 == 0, sum(V1)]       # An operation to get the result. (even means çift)
