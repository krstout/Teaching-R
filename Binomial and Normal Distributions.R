#############################
### Binomial Distribution ###
#############################

### Find probabilities using the binomial distribution

# Check the help on using these commands
?choose
?dbinom
?pbinom

# R has a function for the choose portion of the equation
choose(34, 19)

### Example with rolling dice ###

# Chance of rolling doubles 3 times in a row

doubles.thrice <- dbinom(3, size = 3, prob = .167)
# chance of 3 successful doubles roll out of 3 tries
# probability is .167 or rolling a double


### What is the chance of rolling out of jail in Monopoly? ###

# 3 tries
# need at least 1 double -> could roll 2 or 3 

rollout <- dbinom(1, 3, .167) + dbinom(2, 3, .167) + dbinom(3, 3, .167)
# chance of X = 1, X = 2, and X = 3

# Could also do it backwards
dbinom(0, 3, .167)
# chance of X = 0 

# then you do 1 - (answer to X = 0) to get rollout chance
backwards.rollout <- 1 - dbinom(0, 3, .167)

# Or use pbinom
cdf.rollout <- pbinom(0, 3, .167, F)

# Lastly, only want X = 1 or X = 2 because X = 3 would send you back to jail

safe.rollout <- dbinom(1, 3, .167) + dbinom(2, 3, .167)


###########################
### Normal Distribution ###
###########################

### How to figure out probabilities using the normal distribution

# Check the help file for the normal distribution
?pnorm

pnorm(q = 1, mean = 0, sd = 1, lower.tail = F)
# q = the Z-score
# mean = 0 for standard normal
# sd = 1 for standard normal
# lower.tail = T, then P(X =< x); if lower.tail = F, then P(X > x)

pnorm(1, lower.tail = F)
# You can just do 1 and lower.tail = F since the default is mean 0 and sd 1


# What is Pr(.75 < Z < 2.5)?
a <- pnorm(.75, lower.tail = F) # area under the curve where Z > .75
b <- pnorm(2.5, lower.tail = F) # area under the curve where Z > 2.5

answer <- a-b # subtract b from a to get the area between Z = .75 and 2.5