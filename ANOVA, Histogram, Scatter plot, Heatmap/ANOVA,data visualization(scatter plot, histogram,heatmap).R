# ANOVA
#install.packages(c("ggplot2", "ggpubr", "tidyverse", "broom", "AICcmodavg"))

library(ggplot2)
library(ggpubr)
library(tidyverse)
library(broom)
library(AICcmodavg)

summary(crop.data)

# One way anova
one.way <- aov(yield ~ fertilizer, data = crop.data)
summary(one.way)

# Two way anova
two.way <- aov(yield ~ fertilizer + density, data = crop.data)
summary(two.way) 


# Data visualization 
# histogram
ggplot(wbc.data, aes(x = WBC_Count, fill = Condition)) +
  geom_histogram(binwidth = 200, alpha = 0.7, position = "identity") +
  labs(title = "Histogram of White Blood Cell Counts",
       x = "WBC Count (cells/µL)",
       y = "Frequency") +
  theme_minimal()

# scatter plot

# shows 1st 6 data
head(wbc.data)

#  shows structure of dataset
str(wbc.data)

# shows summary of each variable
summary(wbc.data)

#for scatter plot
ggplot(data=wbc.data,mapping=aes(x=Condition,y=WBC_Count))+ 
  geom_point()

# we can use the follwing code for scatter plot(if we define wbc.data into dataset
#by datset = wbc.data , then we can use the dataset)
dataset = wbc.data
ggplot(wbc.data, aes(x= Condition, y = WBC_Count)) +
  geom_point()

#for changing the point size and shape
ggplot(dataset, aes(x= Condition, y = WBC_Count)) +
  geom_point(size = 2, shape = 18)

# for changing scatterplot point colour
ggplot(wbc.data, aes(x= Condition, y = WBC_Count)) +
  geom_point(color = "red")

# for adding regression line
dataset = mtcars
ggplot(dataset, aes(x = wt, y= mpg)) +
  geom_point() +
  geom_smooth(method = lm)

#removing confidence interval
ggplot(dataset, aes(x = wt, y= mpg)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE)

# loess method
ggplot(dataset, aes(x = wt, y= mpg)) +
  geom_point() +
  geom_smooth()

# changing the line type and color
ggplot(dataset, aes(x = wt, y= mpg)) +
  geom_point() +
  geom_smooth(method = lm, linetype = "dotted", color ="red")

# changing the confidence interval color
ggplot(dataset, aes(x = wt, y= mpg)) +
  geom_point() +
  geom_smooth(method = lm, linetype = "dotted", color ="red", fill = "purple")

# converting the cyl column from a numeric to factor variable
dataset$cyl = as.factor(dataset$cyl)

# changing the point shape by the levels of cyl
ggplot(dataset, aes(x = wt, y= mpg, shape = cyl)) +
  geom_point()

#changing point shape,size,color by the levels of cyl
ggplot(dataset, aes(x = wt, y= mpg, shape = cyl, size = cyl, color = cyl)) +
  geom_point()

#Heatmaps
#for seeing 1st 6 data
head(iris)

#for summary
summary(iris)

#for removing the non numeric data of coloumn 5
data = as.matrix(iris[-5])
data

#for heatmaps
heatmap(data)

#sepal.Length values are masking variations in other variables. scale option will scale variables.
heatmap(data, scale="column")

#for changing size
heatmap(data, scale="column", cexCol = 0.75)

# column dendrogram removed
heatmap(data, scale = 'column',Colv = NA)

#row dendeogram removed
heatmap(data, scale = 'column',Rowv = NA)

#for removing column and row dendrogram
heatmap(data, scale = 'column',Colv = NA, Rowv = NA)

# column axis text size using cexcol
heatmap(data, scale="column", Colv=NA, Rowv = NA, cexCol = 0.75)
