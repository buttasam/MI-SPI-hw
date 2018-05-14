library(markovchain)

K = 11
L = 5
X = ((K * L * 23) %% (20)) + 1
# X = 6 

# prvni soubor
file <- readLines("/home/zeel/Documents/SPI/hw1_source/006.txt")

# 1 
chars <- strsplit(gsub(" ", "_", file[2] , fixed = TRUE), "")
t <- table(chars)
p <- prop.table(t)
plot(p)

# 2
tm <- createSequenceMatrix(chars, toRowProbs = TRUE, sanitize = FALSE, possibleStates = character())
View(tm)

# 3

