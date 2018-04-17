numlist <- data.table(nums = as.character(NA))[!is.na(nums)]
for(a in 2:100){
  for(b in 2:100){
    x <- a^b 
    if(!x %in% numlist$nums){
      numlist <- rbind(numlist,
                       data.table(nums = x))
    }
  }
}
numlist <- numlist[order(nums)]
# the answer is 9183
