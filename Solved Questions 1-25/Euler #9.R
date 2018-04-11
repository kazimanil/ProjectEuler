a <- 1
b <- 2

while(a < 400){
  while(b < 600 && b < 1000 - a - b){
    c = 1000 - a - b
    a2 = a^2
    b2 = b^2
    c2 = c^2
    if(a2 + b2 == c2){
      print(paste0("a: ", a, " b: ", b, " c: ", c))
      break()
    }
    b = b + 1
  }
  a = a + 1
  b = a + 1
}

## a: 200 b: 375 c: 425
## Result is : 31875000