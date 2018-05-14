library(markovchain)

K = 11
L = 5
X = ((K * L * 23) %% (20)) + 1
# X = 6 

file <- readLines("/home/zeel/Documents/SPI/hw1_source/006.txt")

### 1 
chars <- strsplit(gsub(" ", "_", file[2] , fixed = TRUE), "")
t <- table(chars)
p1 <- prop.table(t)
barplot(p1)

### 2
tm <- createSequenceMatrix(chars, toRowProbs = TRUE, sanitize = FALSE, possibleStates = character())
View(tm)

### 3
col_num <- 27
# vytvoření početní matice
Ab <- t(diag(rep(1, col_num)) - tm)
# prave strany
Bb <- rep(0, col_num)
# pridat omezeni, vse se rovna 1
Ac <- rbind(Ab, rep(1, col_num))
Bc <- c(Bb, 1)
# solve matice
p2 <- t(solve(t(Ac)%*%Ac, t(Ac)%*%Bc))
barplot(p2%*%tm)

### 4
t.test(p1, p2)
