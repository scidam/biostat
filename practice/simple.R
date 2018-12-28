# assignment operators <- , ->

width <- 5
height <- 9
length <- 8
volume <- width * height * length
8 -> template
print(volume)
# ====================
# arithmetical operators: +, -, /, *, ^
1+2
1-2
4/5
6*7
3^7
# TRUE, FALSE
1==2
1==1
7<9
# comparison operators: ==, <, >, <=, >=, !
!TRUE
!FALSE
(1+2+3+7+3)/5 > 10
# string (character) data type
name <- 'Dmitry'
# string  concatenation (paste)
paste(name, name, sep='+')
# arrays of data
range10 = 1:10
sum(range10^2)
my_array <- c(1,2,3,5)
# ----- 

get_probability <-function(p, k, N){
  result <- 0.0
  for (j in k:N){
      result <- result + factorial(N)/(factorial(j) * factorial(N-j))*(p^j)*(1-p)^(N-j)
  }
  return(result)
}

N <- 90
k <- 50
p <- 0.7
values <- rep(0, N-k)
for (j in 1:length(values)){
  values[j] <- get_probability(p, k, j+k)
}

plot(51:90, values)



