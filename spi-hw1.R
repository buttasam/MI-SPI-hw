# prvni soubor
file1 <- readLines("/home/samik/Downloads/hw1_source/001.txt")

splitted = strsplit(file1[2], " +")
lengths1 = unlist(Map(function(x) nchar(x), splitted))

mean(lengths1)
var(lengths1)
hist(lengths1)


chars1 <- strsplit(gsub(" ", "", file1[2] , fixed = TRUE), "")
t1 <- table(chars1)
plot(prop.table(t1))

# druhy soubor
file2 <- readLines("/home/samik/Downloads/hw1_source/002.txt")

splitted2 = strsplit(file2[2], " +")
lengths2 = unlist(Map(function(x) nchar(x), splitted2))

mean(lengths2)
var(lengths2)
hist(lengths2)


chars2 <- strsplit(gsub(" ", "", file2[2] , fixed = TRUE), "")
t2 <- table(chars2)
plot(prop.table(t2))

# 3
chisq.test(head(lengths1, 1010), lengths2)

# 4
t.test(lengths1, lengths2, var.equal=T)

# 5
chisq.test(t1,t2)

