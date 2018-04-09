# first of all lets create empty vectors.
list <- data.table(list = as.character(NA))[!is.na(list)]
i <- 10
maxvalue = 9^5 * 6 # this is the threshold for 6 digits numbers as well.
# since a 7 digit number is above 413343 (9^5 * 7) i will not include 7 digit numbers.

# shortcut
while(i < maxvalue){
  sum = sum(as.data.table(t(str_split(i, "", simplify = TRUE)))[, V1 := as.numeric(V1)^5])
  if (i == sum){
    list = rbind(list, 
                 data.table(list = sum))
  }
  i = i + 1
}
list[, sum(as.numeric(list))]

# algorithm based.
numlist <- data.table(numlist = as.character(NA))[!is.na(numlist)]
i <- 10
maxvalue = 9^5 * 6 # this is the threshold for 6 digits numbers as well.
list = as.numeric(NA)
while(i < maxvalue){
  char = nchar(i)
  for(j in 1:char){
    list = append(list, 
                  substr(i, j, j))
  }
  list = list[!is.na(list)]
  list = data.table(nums = as.numeric(list))
  sum = sum(list$nums^5)
  if (i == sum){
    numlist = rbind(numlist, 
                    data.table(numlist = sum))
  }
  # wrap-up for next step
  list = as.numeric(NA)
  i    = i + 1
}
