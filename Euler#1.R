a <- as.data.table(seq(1:999)) # 1000e kadar sayılar sütunu oluşturma
a[, Sayilar := V1] ; a[, V1 := NULL] # Sütun adı düzeltme.
a[Sayilar %% 3 == 0 | Sayilar %% 5 == 0, Bolunme := 1] # 3e ya da 5e bölünebilme
a[is.na(Bolunme), Bolunme := 0] # Bölünemiyorsa 0 yazma
# a[Bolunme == 1 & Sayilar < 10][,sum(Sayilar)] test 23 sonucunu veriyor.
a[Bolunme == 1, sum(Sayilar)] # Bölünen sayıları toplama
# Sonuç 233168