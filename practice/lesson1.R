# clear current environment
rm(list=ls())

#  Data types: arrays
array <- c(1, 6, 2)

# array of names
string_array <- c("Dmitry", "Anton", 'Boris')


# lists, note: strange error occurs... 
data <- list(names=c("Anton", "Valya", "Kate", "Misha"), numbers=c(1,6,10,64,90), nouns=c("table", "desk"))

# data frames... 

mydf <- data.frame(names=c("Anton", "Valya", "Kate", "Misha"), numbers=c(1,6,10,64), nouns=c("table", "desk", 'chair', 'lamp'))

# basic comparison operators
1 == 1
1 == 2
1 != 1
1 != 2
c(1,1,2,3,4) == 1
c(1,1,2,3,4) > 1 # strict comparison, greater
c(1,1,2,3,4) >= 2 # greater or equal 
c(1,1,2,3,4) <= 2 # less or equal
c(1,1,2,3,4) < 2 # less
!(c(1,1,2,3,4) < 2) # less 
!TRUE == FALSE # not operation, negative, opposite value to TRUE

#+, -, *, ^ , %%, /
c(1,3,9)*4 # multiply
c(4,5,6)^2 # power of two
c(10,100) %% 3 # modulo by 3 ???
c(10, 60) / 3

# boolean operators: not, and, or

(1==1) & (2!=2) # and operator
(1==1) | (2!=2) # or operator
!TRUE
!FALSE


# data frame indexing
# mydf[row_number/binary mask, column number/binary mask]

# select all setosa specimens with sepal length greater than 5.0
selected_irises <- iris[(iris$Species == "setosa") & (iris$Sepal.Length > 5),]
nrow(selected_irises)
ncol(selected_irises)

selected_irises <- iris[(iris$Species == "setosa") | (iris$Sepal.Length > 6),]
nrow(selected_irises)

# binding rows and columns: cbind, rbind
# column binding example
heights <- data.frame(height=c(100, 200, 300, 500))
mydf <- cbind(mydf, heights)

# row binding example
new_row <-data.frame(names=c('Pavel'), numbers=70, nouns='sky', height=1000)
new_mydf<-rbind(mydf, new_row)
mydf

# renaming rows and columns
colnames(mydf)
rownames(mydf)

colnames(mydf) <- c("new_name1", "new_name2", "new_name3", "new_name4")
colnames(mydf)

rownames(mydf) <- 2:10
rownames(mydf)

# sequences
seq(from=1, to=1000, by=5)

seq(from=1, to=10, by=0.2)

seq(from=1, to=-10, by=-0.2)


# plot sine function
x <- seq(from=0, to=3.14, by=0.01)
y <- sin(x)
plot(x, y, type="l")

# create sequenc of predefined size
seq(from=0, to=100, length.out=200)

seq(0, 100)

# repetitions
c(rep(TRUE, 10), rep(FALSE, 10))

# concatenation operation
c(12,3,4, c(5,6,7))


# NA values
mydf <- data.frame(names=c("Anton", "Valya", "Kate", NA), numbers=c(1, NA, 10, 64), nouns=c("table", "desk", 'chair', 'lamp'))
mydf
is.na(mydf$numbers)

# conditions, if clause

x <- 7
if (x>15) {
  print("1 is equal 1")
  print("... ")
} else if (x%%2 == 0){
  print("the number is even")
} else if (x%%3 == 0){
  print("the number is divisible by 3")
} else {
  print("else clause envoked... ")
}

# loops: for, while, repeat
result <- 0
for (item in seq(1,10)){
  if (item %% 5==0){
   next
  } else if (item==8){
    break
  }
  # very heavy computations.... 
  result <- result + item^2
  print(item)
  }
print(result)

# while loop 

ind <- 0
summa <- 0
while (TRUE){
  if (ind > 100) {
    break
  }
  summa = summa + ind
  ind = ind + 1
  }
  

ind <- 0
summa <- 0
while (ind <= 100){
  summa = summa + ind
  #ind = ind + 1
}

#done = FALSE
#while (!done) {
#  ....
#   if (some_condition1 & somecondition2) {done=TRUE}
#}


# repeat loop: 
# infinite loop 
ind =0
repeat {
  print(ind)
  ind = ind + 1
  if (ind>100) break
}

# repeat == while (TRUE)
empty <- matrix(nrow=2, ncol=2)
sample <- matrix(1:12, nrow=4, ncol=3)
sample
wrong <- matrix(1:12, nrow=5, ncol=3)



#function definition
area_of_triangle<- function(a,b,c){
  # Heron's formula
  p = (a + b + c) / 2
  return(sqrt(p*(p-a)*(p-b)*(p-c)))
}
area_of_triangle(3,4,5)


# -------------------- Clustring, cluster analysis ------------
data <- iris[,1:4]
data <- scale(data)

#result <- kmeans(data, centers=4)
#result$cluster

# How to choose the numer of clusters? Elbow method...

fractions <- c() # empty vector
for (k in 1:14){
  fractions[k] <- sum(kmeans(data, centers=k)$withinss)
}

fractions <- fractions / fractions[1]
print(fractions)
plot(1:14, fractions, xlab='The number of clusters', ylab="Fraction value", type='l', main="Elbow method")
plot(1:14, (1 - fractions)*100.0, xlab='The number of clusters', ylab="Percent of explained variance", type='l', main="Elbow method")


# best choices are : k = 2, k=3

cluster_structure1 <- kmeans(data, centers=2)$cluster
cluster_structure2 <- kmeans(data, centers=3)$cluster
as.numeric(iris$Species)

fossil::rand.index(as.numeric(iris$Species), cluster_structure1)
fossil::rand.index(as.numeric(iris$Species), cluster_structure2)
plot(iris, col=iris$Species)


# =========== Hierarchical clustring   ==============

distance_matrix <- dist(data, method='manhattan')
cluster_tree <- hclust(distance_matrix, method="average")
plot(cluster_tree)


cluster_structure_h1 <- cutree(cluster_tree, k=2)
cluster_structure_h2 <- cutree(cluster_tree, k=3)
fossil::rand.index(as.numeric(iris$Species), cluster_structure_h1)
fossil::rand.index(as.numeric(iris$Species), cluster_structure_h2)


# -------- Chi-square test, Fisher exact test.

cont_table1 <- matrix(c(30, 25, 5, 50), ncol=2, nrow=2)
chisq.test(cont_table1)


cont_table2 <- matrix(c(30, 25, 15, 25), ncol=2, nrow=2)
chisq.test(cont_table2)


fisher.test(cont_table1)
fisher.test(cont_table2)

#   Analysis of variance

model <- aov(Sepal.Width ~ Species, data=iris)
summary(model)
tukey <- TukeyHSD(model)
print(tukey)
plot(tukey)

formulas <-c(Sepal.Width ~ Species, Petal.Width ~ Species, Sepal.Length ~ Species,  Petal.Length ~ Species)
for (f in formulas){
  model <- aov(f, data=iris)
  print("================================")
  print(f)
  print(summary(model))
  print("================================")
}

# Building clusters
newiris<-cbind(iris, data.frame(clusters=as.factor(kmeans(data, centers=5)$cluster)))

plot(newiris[,c(1,2,3,4,6)], col=newiris$clusters)
model<- aov(Petal.Length~clusters, data=newiris)
summary(model)
tuck <- TukeyHSD(model)