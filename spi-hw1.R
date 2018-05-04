#### 1
# nacteni soubrou
file1 <- readLines("/home/samik/Downloads/hw1_source/001.txt")
file2 <- readLines("/home/samik/Downloads/hw1_source/002.txt")

# rozdeleni textu na slova
splitted = strsplit(file1[2], " +")
splitted2 = strsplit(file2[2], " +")

# vektor delek slov
lengths1 = unlist(Map(function(x) nchar(x), splitted))
lengths2 = unlist(Map(function(x) nchar(x), splitted2))

# zakladni hodnoty a histogram souboru 1
mean(lengths1)
var(lengths1)
hist(lengths1)

# zakladni hodnoty a histogram souboru 2
mean(lengths2)
var(lengths2)
hist(lengths2)

#### 2
# rozdeleni na pismena
chars1 <- strsplit(gsub(" ", "", file1[2] , fixed = TRUE), "")
chars2 <- strsplit(gsub(" ", "", file2[2] , fixed = TRUE), "")

# cetnost pismen
t1 <- table(chars1)
t2 <- table(chars2)

plot(prop.table(t1))
plot(prop.table(t2))

# hladina významnosti
alpha = 0.05

#### 3
# Cetnost delek slov prvniho souboru
tlen1 = table(lengths1)
# Cetnost delek slov druheho souboru
tlen2 = table(lengths2)
# Doplneni nulovych cetnosti pro slova delek 12 a 15
tlen1 = append(tlen1, 0, after = 12)
tlen2 = append(tlen2, 0, after = 11)

# Vytvoreni kontingencni tabulky z jednotlivych cetnosti delek slov
contingencyTable1 = matrix(c(tlen1, tlen2), 14, 2)
chisq.test(contingencyTable1)

# p hodnota < alfa => zamítám H0 

####  4
# o datech nic nevíme, takze nepředpokládáme stejný rozptyl
t.test(lengths1, lengths2, var.equal=F)

####  5
conTab2 = matrix(c(t1, t2), 26, 2)
chisq.test(conTab2)
