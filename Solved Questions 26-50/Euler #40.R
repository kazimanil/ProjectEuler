d1 = as.numeric(substr(as.character(paste0(seq(1, 200000, 1), collapse = "")), 1, 1))
d2 = as.numeric(substr(as.character(paste0(seq(1, 200000, 1), collapse = "")), 10, 10))
d3 = as.numeric(substr(as.character(paste0(seq(1, 200000, 1), collapse = "")), 100, 100))
d4 = as.numeric(substr(as.character(paste0(seq(1, 200000, 1), collapse = "")), 1000, 1000))
d5 = as.numeric(substr(as.character(paste0(seq(1, 200000, 1), collapse = "")), 10000, 10000))
d6 = as.numeric(substr(as.character(paste0(seq(1, 200000, 1), collapse = "")), 100000, 100000))
d7 = as.numeric(substr(as.character(paste0(seq(1, 200000, 1), collapse = "")), 1000000, 1000000))
d = d1 * d2 * d3 * d4 * d5 * d6 * d7
