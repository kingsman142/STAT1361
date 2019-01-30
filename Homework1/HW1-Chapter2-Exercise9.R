library(ISLR)

auto = read.csv("Auto.csv", na.strings="?")
auto = auto[complete.cases(auto), ]
str(auto)
summary(auto)

# The quantitative variables are mpg, cylinders, displacement, horsepower, weight, acceleration, year, and origin.  The only qualitative predictor is name.

range(auto$mpg)
range(auto$cylinders)
range(auto$displacement)
range(auto$horsepower)
range(auto$weight)
range(auto$acceleration)
range(auto$year)
range(auto$origin)

# Range of mpg is 9.0 to 46.6 . Range of cylinders is 3 to 8. Range of displacement is 68 to 455. Range of horsepower is 46 to 230. Range of weight is 1613 to 5140. Range of acceleration is 8.0 to 24.8 . Range of year is 70 to 82. Range of origin is 1 to 3.

sapply(auto[, -c(0,9)], mean)
sapply(auto[, -c(0,9)], sd)

# Mean and Std of mpg are 23.446 and 7.805 respectively. Mean and Std of cylinders are 5.472 and 1.706 respectively. Mean and Std of displacement are 194.412 and 104.644 respectively. Mean and Std of horsepower are 104.469 and 38.491 respectively. Mean and Std of weight are 2977.584 and 849.403 respectively. Mean and Std of acceleration are 15.541 and 2.759 respectively. Mean and Std of year are 75.980 and 3.684 respectively. Mean and Std of origin are 1.577 and 0.806 respectively.

autoNew = auto[-c(10:85), -c(0,9)]
sapply(autoNew, mean)
sapply(autoNew, sd)
sapply(autoNew, range)

# Mean and Std of mpg are 24.404 and 7.867 respectively. Mean and Std of cylinders are 5.373 and 1.654 respectively. Mean and Std of displacement are 187.241 and 99.678 respectively. Mean and Std of horsepower are 100.722 and 35.709 respectively. Mean and Std of weight are 2935.972 and 811.300 respectively. Mean and Std of acceleration are 15.727 and 2.694 respectively. Mean and Std of year are 77.146 and 3.106 respectively. Mean and Std of origin are 1.601 and 0.820 respectively.
# The range of mpg is 11.0 to 46.6 . The range of cylinders is 3 to 8. The range of displacement is 68 to 455. The range of horsepower is 46 to 230. The range of weight is 1649 to 4997. The range of acceleration is 8.5 to 24.8 . The range of year is 70 to 82. The range of origin is 1 to 3.

pairs(auto)

# We can see several strong, linear relationships between several pairs of variables. For example, the pairs of (displacement, weight), (displacement, horsepower), (horsepower, weight), (displacement, weight), (horsepower, weight), and (displacement, horsepower). Now relationships are poor, or no relationship exists. Meanwhile, a lot of the relationships with mpg and other predictors is a negative linear relationship, kind of curved downward. The auto's name correlates with none of the other predictors.

# Yes. In particular, displacement, horsepower, and weight would be somewhat accurate representations of predicting mpg. All three predictors represent negative, curved somewhat non-linear relationships. All data points are pretty bunched together, so it is very easy to fix a curve to that data without overfitting to a bunch of noise, such as in the (weight, acceleration) plot.