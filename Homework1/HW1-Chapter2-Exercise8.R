library(ISLR)

# a)
college = read.csv("College.csv")

# b)
rownames(college)=college[,1]
fix(college)

college = college[,-1]
fix(college)

# c.i)
summary(college)

# c.ii)
pairs(college[,1:10])

# c.iii)
plot(college$Private, college$Outstate)

# c.iv)
Elite = rep("No", nrow(college))
Elite[college$Top10perc > 50] = "Yes"
Elite = as.factor(Elite)
college = data.frame(college, Elite)
summary(college)
plot(college$Elite, college$Outstate)

# c.v)
par(mfrow=c(2,2))
hist(college$Enroll)
hist(college$Outstate)
hist(college$Grad.Rate)
hist(college$Books)

# c.vi)
summary(college$Enroll)
summary(college$Outstate)
summary(college$Grad.Rate)
summary(college$Books)

oddGradRate = college[college$Grad.Rate > 100,]
nrow(oddGradRate)
rownames(oddGradRate)

enrollData = college[college$Enroll > 2000,]
nrow(enrollData)
rownames(enrollData)
