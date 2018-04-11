pd <- function(x){
  if(nchar(x) == 5){
    test1 <- str_split(x, "", 5)[[1]][1] == str_split(x, "", 5)[[1]][5]
    test2 <- str_split(x, "", 5)[[1]][2] == str_split(x, "", 5)[[1]][4]
    if(test1 == TRUE & test2 == TRUE){
      y <- "Palindrome"
    } else {
      y <- "Non-Polindrome"
    }
  } else if(nchar(x) == 6){
    test1 <- str_split(x, "", 6)[[1]][1] == str_split(x, "", 6)[[1]][6]
    test2 <- str_split(x, "", 6)[[1]][2] == str_split(x, "", 6)[[1]][5]
    test3 <- str_split(x, "", 6)[[1]][3] == str_split(x, "", 6)[[1]][4]
    if(test1 == TRUE & test2 == TRUE & test3 == TRUE){
      y <- "Palindrome"
    } else {
      y <- "Non-Palindrome"
    }
  } else {
    warning("Given number is not a product of two 3-digit numbers.")
  }
  y
}
palindrome_detector <- Vectorize(pd)
# 100*100 to 999*999
cjdt <- function(a,b){
  cj = CJ(1:nrow(a),1:nrow(b))
  cbind(a[cj[[1]],],b[cj[[2]],])
}

i = data.table(i = seq(100, 999, 1))
j = data.table(j = seq(100, 999, 1))
list <- cjdt(i, j); rm(i,j)

list <- list[, numbers := i * j][, .(numbers)][!duplicated(numbers)]
list[, Status := palindrome_detector(numbers)]
list[Status == "Palindrome", max(numbers)]
