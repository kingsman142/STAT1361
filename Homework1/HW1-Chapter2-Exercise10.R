library(MASS)

Boston
?Boston

# There are 506 rows and 14 columns. The crim column represents per capita crime rate by town. The zn column represents the proportion of residential land zoned for lots over 25,000 sq. ft. The indus column represents proportion of non-retail business acres per town. The chas column is the Charles River dummy variable (1 if tract bounds river; 0 otherwise). The nox column is nitrogen oxides concentration. The rm column is the average number of rooms per dwelling. The age column is the proportion of owner-occupied units built prior to 1940. The dis column is the weighted mean of distances to five Boston employment centres. The rad column is the index of accessibility to radial highways. The tax column is the full-value property-tax rate per $10,000. The ptratio column is the pupil-teacher ratio by town. The black column is the proportion of blacks by town. The lstat column is the lower status of the population. Finally, the medv column is the median value of owner-occupied homes.
# The columns are a representation of characteristics of Boston suburbs. Each row is data from one suburb.

pairs(Boston)

# Not many of the variables are correlated. From investigation, (rm, lstat), (rm, medv), (lstat, medv), and (age, lstat) all have somewhat strong relationships, while (black, dis) and (ptratio, lstat) have somewhat weak relationships, but it still exists.

# In general, not many variables are closely related to per capita crime rate. But, age has a weak positive relationship, distance has a weak negative relationship, and medv has a weak negative relationship.

summary(Boston$crim)
oddCrim = Boston[Boston$crim > 5.392, ]
nrow(oddCrim)

summary(Boston$tax)
oddTax = Boston[Boston$tax > 580.5, ]
nrow(oddTax)

summary(Boston$ptratio)
oddPt = Boston[Boston$ptratio > 4.2, ]
nrow(oddPt)

# Crime rates range from 0.006 to 88.976, a gap of 88.970. Since 1.5*IQR = 5.392, the crime rates were checked to see if any were significantly above the interquartile range. There were 103 suburbs with very high crime rates.
# Tax rates range from $187 to $711, a gap of 524. The same procedure was performed for tax rates. Outliers held values that were 1.5*IQR = 580.5 or higher. There were 137 suburbs with very high tax rates.
# Finally, pupil-teacher ratios range from 12.6 to 12.0, a gap of 9.4 . The same procedure was carried out again. A high pupil-teacher ratio is considered to be 1.5*IQR = 4.2 or higher. There were 506 suburbs with abnormally high ratios, which is almost the entire dataset.

boundCharles = Boston[Boston$chas == 1, ]
nrow(boundCharles)

# There are 35 suburbs that bound the Charles river.

median(Boston$ptratio)

# The median pupil-teacher ratio is 19.05 .

lowestMedv = Boston[Boston$medv == min(Boston$medv), ]
print(lowestMedv)
sapply(Boston, range)

# There are actually two suburbs sharing the lowest median value of owner-occupied homes. Unfortunately, we are not given suburb names, but they are on row 399 and 406.
# For the row 399 suburb, crime rate is on the lower end, none of the residential land is zoned for lots over 25,000 sq ft, it is generally on the higher end in terms of non-retail businesses per acre, it does not border the Charles River, the nitrogen oxide concentration is very high, the average number of rooms is very high, every single house is built prior to 1940, the houses are very close to employment centres, houses are right next to the highway, they have high property tax rates, it has one of the highest pupil-teacher ratios among suburbs, the suburb is the blackest in Boston, and it has one of the highest percentages of lower status civilians.
# For the row 406 suburb, there are many of the same characteristics. Crime rate is high, none of the residential land is zoned for lots over 25,000 sq ft, there is a relatively high industrial content, it is not bordering the Charles River, the nitrogen oxide concentration is high, the number of rooms per dwelling is abnormally high, all of the homes were built prior to 1940, the houses are very close to Boston's employment centers, the suburb is right next to the highways, property tax rate is high, it has one of the highest pupil-teacher ratios, is one of the blackest suburbs in Boston, and in the middle in terms of lower-status population percentage.
# From what I see, these two suburbs generally have a lot of pollution, both noise and chemicals, crime rate is relatively high, there are a lot of lower status people living there, a lot of rooms are crammed in as possible, employment centers are nearby, and property tax rates are high. Therefore, they do not have access to many resources and suffer due to that. These are predominantly poorer neighborhoods.

bostonRooms = Boston[Boston$rm > 7, ]
nrow(bostonRooms)
bostonRooms = Boston[Boston$rm > 8, ]
nrow(bostonRooms)
print(bostonRooms)

# There are 64 Boston suburbs averaging more than 7 rooms per dwelling.
# There are 13 Boston suburbs averaging more than 8 rooms per dwelling.
# In general, suburbs averaging more than 8 rooms per house have a large proportion of homes built prior to 1940, they have a relatively high proportion of blacks, not much of the population is of lower status, there is almost no crime, and the homes are on the pricier side of Boston. Also, nearly all of the Suburbs do not border the Charles River. Therefore, we can conclude many of these suburbs are historically black, old, and middle class.