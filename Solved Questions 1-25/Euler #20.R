# R's core is not capable of such a calculation. Thus I will resort to Python once more to calculate x.
options(scipen = 200)
x = prod(seq(1,100,1))

# x is calculated within Python and;
x = "93326215443944152681699238856266700490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000000000000000000000"
y = sum(as.integer(t(str_split(x, "", nchar(x), simplify = TRUE))))
