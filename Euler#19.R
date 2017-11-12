as.numeric(as.Date("1901-01-01")) %% 7 # pazartesi
as.numeric(as.Date("2000-12-31")) %% 7 # pazar. pazar'ın modu 3

a <- seq(-25202, 11322, 1)                                # Rda günlere karşılık gelen sayılar
b <- seq(as.Date("1901-01-01"), as.Date("2000-12-31"), 1) # Rda gün serisi
c <- as.data.table(cbind(a, b))  # ikisini birleştirdik
c <- c[, .(Sayisal = a, 
           Tarih = as.Date(b))]  # istediğimiz formata getirdik
c[a %% 7 == 3, Pazar := 1]       # Pazarları tanımladık
c[a %% 7 != 3, Pazar := 0]       # Pazar olmayanları tanımladık
c[mday(Tarih) == 1, IlkGun := 1] # Ayın ilk gününü tanımladık
c[mday(Tarih) != 1, IlkGun := 0] # Ayın ilk günü olmayanları tanımladık
c[IlkGun == 1 & Pazar == 1 , .N] # Ayın ilk günü ve pazar olan günleri saydık.

# a <- length(which(seq(-25561,11322,1) %% 7 == 3)) # Pazar olan 5270 gün var. Sıra bunlardan hangilerinin 
