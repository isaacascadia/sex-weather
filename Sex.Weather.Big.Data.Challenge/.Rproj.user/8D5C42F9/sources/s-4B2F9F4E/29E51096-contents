#
# permutation test example
#


# In this example want to derive our own null distribution be resampling 
# an existing data set.
# we want to know if the means of the two groups is different
# H0 no difference in the mean
# Ha there is a difference in the mean

nA <- 40 # has to be an even number
nB <- 40 # this can be any positive integer

# step 1 the data
A <- c(rnorm(nA/2, 5, 2), rnorm(nA/2, 15, 2))
hist(A)
mean(A)
abline(v=mean(A), col = "red")
# bimodal distribution!
B <- rnorm(40, 20, 2)
hist(B)
mean(B)

# as test statistic we take the difference between A and B
stats.diff <- mean(A) - mean(B)

# what is the problem?


# let's resample and remember that under H0 there is no difference
# so we can pool A and B and randomly pick Na indiv for group A and nB for B
AB <- c(A, B)
hist(AB)
# reshuffle
AB.shuffl <- sample(length(AB), replace = FALSE)
# assign first nA to A.temp
A.temp <- AB.shuffl[1:nA]
# the rest of the reshuffled vector goes to B.temp
B.temp <- AB.shuffl[-c(1:nA)]

# calculate the test stats under the null hypothesis
stats.diff.H0 <- mean(A.temp) - mean(B.temp)

storage.vector <- rep(NA, 10)

for(i in 1:10){
  storage.vector[i] <- i^2
  
}



# we'd like to do this many times...
# let's use  a loop to do it n.permut
n.permut <- 1000
null.test.stats <- rep(NA, n.permut)

for(i in 1:n.permut){
  AB.shuffl <- sample(length(AB), replace = FALSE)
  # assign first nA to A.temp
  A.temp <- AB.shuffl[1:nA]
  # the rest of the reshuffled vector goes to B.temp
  B.temp <- AB.shuffl[-c(1:nA)]
  
  # calculate the test stats under the null hypothesis
  stats.diff.H0 <- mean(A.temp) - mean(B.temp)
  # store the stats.diffH0 in a storgae vector
  null.test.stats[i] <- stats.diff.H0
}

hist(null.test.stats)
abline(v=stats.diff, col = "red")

number.more.extreme <- length(null.test.stats[ null.test.stats <= stats.diff])
# p value for one tailed would be
(number.more.extreme/n.permut)
# for two tailed test
(2*number.more.extreme/n.permut)

