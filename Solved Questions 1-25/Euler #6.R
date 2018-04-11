a <- as.data.table(seq(1:100)) # 1:100 arasi vektor olusturmak
a[, V2 := V1 ^ 2]              # karelerini tespit etmek.
a[, sum(V1)^2 - sum(V2)]       # sayilarin toplamlarinin karesi - sayilarin kareleri toplami
