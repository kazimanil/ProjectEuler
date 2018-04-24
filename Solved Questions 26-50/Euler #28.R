rm(list = ls())
j = 1 ; i = 1 # starting parameters
nums = as.numeric(1) # starting vector
while (2*j + 1 < 1002){
  UR = (i + 2*j) ^ 2 - (j * 0) # UpperRight
  UL = (i + 2*j) ^ 2 - (j * 2) # UpperLeft
  LL = (i + 2*j) ^ 2 - (j * 4) # LowerLeft
  LR = (i + 2*j) ^ 2 - (j * 6) # LowerRight
  jth_add = c(LR, LL, UL, UR)
  nums = append(nums, jth_add)
  j = j + 1
}
sum(nums) #669171001