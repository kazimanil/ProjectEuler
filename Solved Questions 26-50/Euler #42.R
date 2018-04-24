# Data Input ----
words <- as.data.table(t(fread("words.txt", header = FALSE, sep = ",")))

# Number Replacer Function ----
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

# Word Values ----
maxchars <- max(nchar(words$V1))
words[, ':='(Char1  = number_replacer(str_split_fixed(V1, "", maxchars)[, 1 ]),
             Char2  = number_replacer(str_split_fixed(V1, "", maxchars)[, 2 ]),
             Char3  = number_replacer(str_split_fixed(V1, "", maxchars)[, 3 ]),
             Char4  = number_replacer(str_split_fixed(V1, "", maxchars)[, 4 ]),
             Char5  = number_replacer(str_split_fixed(V1, "", maxchars)[, 5 ]),
             Char6  = number_replacer(str_split_fixed(V1, "", maxchars)[, 6 ]),
             Char7  = number_replacer(str_split_fixed(V1, "", maxchars)[, 7 ]),
             Char8  = number_replacer(str_split_fixed(V1, "", maxchars)[, 8 ]),
             Char9  = number_replacer(str_split_fixed(V1, "", maxchars)[, 9 ]),
             Char10 = number_replacer(str_split_fixed(V1, "", maxchars)[, 10]),
             Char11 = number_replacer(str_split_fixed(V1, "", maxchars)[, 11]),
             Char12 = number_replacer(str_split_fixed(V1, "", maxchars)[, 12]),
             Char13 = number_replacer(str_split_fixed(V1, "", maxchars)[, 13]),
             Char14 = number_replacer(str_split_fixed(V1, "", maxchars)[, 14]))]

words[, CharSum := Char1 + Char2 + Char3 + Char4 + Char5 + Char6 + Char7 + Char8 + Char9 + Char10 + Char11 + Char12 + Char13 + Char14]
words[, SumChar := (Char1 > 0) + (Char2 > 0) + (Char3 > 0) + (Char4 > 0) + (Char5 > 0) + (Char6 > 0) + (Char7 > 0) + (Char8 > 0) + (Char9 > 0) + (Char10 > 0) + (Char11 > 0) + (Char12 > 0) + (Char13 > 0) + (Char14 > 0)]

# Triangle Values ----
maxvalue <- words[, max(CharSum)]
n = 2 # While must start with 2nd value since 1st value is encoded below.
trianglevalue = 1
while(max(trianglevalue) < maxvalue){
  trianglevalue = append(trianglevalue,
                         n * ((n+1) / 2) )
  n = n + 1
}
sum(words$triangled) #162
words[, triangled := ifelse(CharSum %in% trianglevalue, 1, 0)]
