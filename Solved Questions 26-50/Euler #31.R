all = 0
solution = 0

for(twodollars in 0:1){
  for(onedollar in 0:2){
    if (twodollars == 1 & onedollar > 0) next
    for(fiftycents in 0:4){
      if (onedollar == 1 & fiftycents > 2) next
      for(twentycents in 0:10){
        if (fiftycents == 1 & twentycents > 7) next
        if (fiftycents == 2 & twentycents > 5) next
        if (fiftycents == 3 & twentycents > 2) next
        for(tencents in 0:20){
          for(fivecents in 0:40){
            for(twocents in 0:100){
              for(onecent in 0:200){
                all = all + 1
                if (twodollars * 200 + onedollar * 100 + fiftycents * 50 + twentycents * 20 + tencents * 10 + fivecents * 5 + twocents * 2 + onecent * 1 == 200){
                  solution = solution + 1
                }
              }
            }
          }
        }
      }
    }
  }
}
solution # 78284