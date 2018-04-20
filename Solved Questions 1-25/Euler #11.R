grid   = fread("grid_problem11.txt")
maxprod = 0
for(i in 1:20){ 
  for(j in 1:20){ 
    down = 0; right = 0; diagL = 0; diagR = 0;
    if(j + 3 < 21){ 
      right  = grid[i, get(paste0("V", j))] * grid[i, get(paste0("V", j + 1))] * grid[i, get(paste0("V", j + 2))] * grid[i, get(paste0("V", j + 3))]
    }    
    if(i + 3 < 21){ 
      down = grid[i, get(paste0("V", j))] * grid[i + 1, get(paste0("V", j))] * grid[i + 2, get(paste0("V", j))] * grid[i + 3, get(paste0("V", j))]
    }
    if(i + 3 < 21 & j + 3 < 21){ 
      diagR  = grid[i, get(paste0("V", j))] * grid[i + 1, get(paste0("V", j + 1))] * grid[i + 2, get(paste0("V", j + 2))] * grid[i + 3, get(paste0("V", j + 3))]
    }
    if(i - 3 > 0 & j + 3 < 21 ){ 
      diagL  = grid[i, get(paste0("V", j))] * grid[i - 1, get(paste0("V", j + 1))] * grid[i - 2, get(paste0("V", j + 2))] * grid[i - 3, get(paste0("V", j + 3))]
    }
    
    ijmax = max(down, right, diagL, diagR)
    if(ijmax > maxprod){ 
      maxprod = ijmax
    }
  }
}
maxprod #70600674