# There is a name called NA which is read as a NULL cell by R. Thus, I have renamed it as NA* to avoid this problem.

names <- data.table(names = t(fread("names.txt", sep = ",", header = FALSE, encoding = "UTF-8")))
names <- names[,.(name = as.character(names.V1))]
# Somehow R's lexicographic order is wrong. this is fixed with ordering below.
# names <- names[order(name)]
# names[, index := .I]

nr <- function(x){
  changelist <- data.table(letters = letters,
                           numbers = seq(1, length(letters), 1))
  if(tolower(x) %in% changelist$letters){
    x <- changelist[letters == tolower(x)]$numbers
  } else {
    x <- 0
  }
  x
}
number_replacer <- Vectorize(nr)
maxchars <- max(nchar(names$name))
names[, ':='(Char1  = number_replacer(str_split_fixed(name, "", maxchars)[, 1 ]),
             Char2  = number_replacer(str_split_fixed(name, "", maxchars)[, 2 ]),
             Char3  = number_replacer(str_split_fixed(name, "", maxchars)[, 3 ]),
             Char4  = number_replacer(str_split_fixed(name, "", maxchars)[, 4 ]),
             Char5  = number_replacer(str_split_fixed(name, "", maxchars)[, 5 ]),
             Char6  = number_replacer(str_split_fixed(name, "", maxchars)[, 6 ]),
             Char7  = number_replacer(str_split_fixed(name, "", maxchars)[, 7 ]),
             Char8  = number_replacer(str_split_fixed(name, "", maxchars)[, 8 ]),
             Char9  = number_replacer(str_split_fixed(name, "", maxchars)[, 9 ]),
             Char10 = number_replacer(str_split_fixed(name, "", maxchars)[, 10]),
             Char11 = number_replacer(str_split_fixed(name, "", maxchars)[, 11]))]

names[, CharSum := Char1 + Char2 + Char3 + Char4 + Char5 + Char6 + Char7 + Char8 + Char9 + Char10 + Char11]
names <- names[order(Char1, Char2, Char3, Char4, Char5, Char6, Char7, Char8, Char9, Char10, Char11)]
names[, index := .I]
names[, QValue := index * CharSum]
names[, sum(QValue)] #871198282
