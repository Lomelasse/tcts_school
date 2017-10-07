set.seed(123)
rnorm(10)
# r по умолчанию использует банковское округление (т.е округление к ближайшему четному)

#90 subj, factors: 0/1, a/b/c, value rnorm+runif with 15% NA for test m = 3, for control group m = 9
id <- 1:90
test <- c(rep(0, 45), rep(1, 45))
colour <- rep(c("a", "b","c"), 30)
value <- c((rnorm(45, 3) + runif(45)), (rnorm(45,9) + runif(45)))
index_NA <- sample(1:90, round(90*0.15))
value[index_NA] <- NA

data <-data.frame(id, test, colour, value)
t.test(value ~ test, data = data[data$colour == 'c',])
