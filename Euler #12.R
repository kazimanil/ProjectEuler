#data input
rm(list = ls()); gc()

#initial parameters
iteration = 1
trianglenumbers = data.table(iteration = 0,
                             triangle_number = 0,
                             divisor = 0)
maxdivisor = max(trianglenumbers$divisor)

# This one takes a WHILE to run like 10 hours.
while(maxdivisor < 500){
    trianglenumbers = rbind(trianglenumbers, 
                            data.table(iteration = iteration,
                                       triangle_number = trianglenumbers[iteration, 2]$triangle_number + iteration,
                                       divisor = 0))
    iteration1 = iteration + 1
    trylist = seq(1, trianglenumbers[iteration1, 2]$triangle_number, 1)
    trylist = data.table(trylist = trylist,
                         trianglenumber = rep(trianglenumbers[iteration1, 2]$triangle_number, length(trylist)))
    trylist[, divisible := ifelse(trianglenumber %% trylist == 0, 1, 0)]
    trianglenumbers[triangle_number == max(triangle_number), divisor := nrow(trylist[divisible == 1])]
    
    #wrap-up for next iteration
    maxdivisor = max(trianglenumbers$divisor)
    rm(trylist)
    iteration = iteration + 1
}

trianglenumbers[divisor > 500]$triangle_number # 76576500
  