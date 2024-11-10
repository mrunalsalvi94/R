# Data (factor) > 
# Aesthetics (how data maps to what you want to see) > 
# Geometry (circle/line/dot) > 
# Statistics (create variables) >
# Facets (Multiples of same chart) >
# Coordinates (chart dimensions) >
# Theme (Visual display)

df <- read.csv("C:/Users/Mrunal/Downloads/R A-Z course/P2-Movie-Ratings.csv")
head(df)
colnames(df) <- c('Film','Genre','CriticRating','AudienceRating','Budgetinmillions','Year')
df
str(df)
summary(df)

#1. USING FACTOR - what should a variable - numerical, categorical, factor

factor(df$Year) #----> gives different levels
df$Year <- factor(df$Year)

#2. AESTHETICS and GEOMETRY
library(ggplot2)
?ggplot

ggplot(data=df, aes(x=CriticRating, y=AudienceRating)) #Doesnt work

#add geometry
ggplot(data=df, aes(x=CriticRating, y=AudienceRating)) + geom_point()
#add color
ggplot(data=df, aes(x=CriticRating, y=AudienceRating, color=Genre)) + geom_point()
#Add size - size of dots to show importance or what is more in value
ggplot(data=df, aes(x=CriticRating, y=AudienceRating, color=Genre, size=Budgetinmillions)) + geom_point()


# CREATING A LAYER OBJECT

#p is an object to which you add the geometry 
p <- ggplot(data=df, aes(x=CriticRating, y=AudienceRating, color=Genre, size=Budgetinmillions))
p + geom_point()
p + geom_line()

# multiple layers
p + geom_line() + geom_point()

# OVERRIDING THE AESTHETICS

#A) MAPPING THE AESTHITICS - ASSIGNING NEW VALUE OUTSIDE THE OBJECT

q <- ggplot(data=df, aes(x=CriticRating, y=AudienceRating, color=Genre, size=Budgetinmillions))

# Now we can override the aesthetics by changing size / color etc
# This will not use the value from the object, but the new value assigned
q + geom_point(aes(size=CriticRating)) #overrides size of budget by critic rating
q + geom_point(aes(color=Budgetinmillions))

# We can also change the x and y by overriding the object aesthetic
q + geom_point(aes(x = Budgetinmillions))
q + geom_point(aes(x = Budgetinmillions)) + xlab("Budget in $millions")

# B) SETTING THE AESTHETICS - No need to use aes() while adjusting a setting
p + geom_line(size=0.5) + geom_point()

#MAPPING VS SETTING ----------------------- VERY IMPORTANT DIFFERENCE

r <- ggplot(data=df, aes(x=CriticRating, y=AudienceRating))
#Mapping new color
r + geom_point(aes(color=Genre))
r + geom_point(aes(size=Budgetinmillions))
#setting new color
r + geom_point(color="DarkGreen")
r + geom_point(size=5)

#3. STATISTICS

#Histograms and density plots
#HISTOGRAMS
t <- ggplot(data=df, aes(x=Budgetinmillions))
t + geom_histogram(binwidth = 8)
#Mapping color
t + geom_histogram(binwidth = 8,aes(fill=Genre))
# Adding border
t + geom_histogram(binwidth = 8,aes(fill=Genre),color="Black")

# Setting color
t + geom_histogram(fill="DarkGreen")

#DENSITY PLOTS
t + geom_density(aes(fill=Genre))
t + geom_density(aes(fill=Genre),position="stack")

# TO have flexibility of aesthetics, put aesthetic in Geometry

u <- ggplot(data=df)
u + geom_histogram(binwidth=10, aes(x=AudienceRating), fill="Blue", color="Black")
u + geom_histogram(binwidth=10, aes(x=CriticRating), fill="White", color="Black")

?geom_smooth # Helps identify patterns to understand the data

v <- ggplot(data=df, aes(x=CriticRating, y=AudienceRating, color=Genre))
v + geom_point() + geom_smooth()
v + geom_point() + geom_smooth(fill=NA)

w <- ggplot(data=df, aes(x=Genre, y=AudienceRating, color=Genre))
w + geom_boxplot()
w + geom_boxplot() + geom_point()
w + geom_boxplot() + geom_jitter()
w + geom_jitter() + geom_boxplot(alpha=0.6)

#4 FACETS - helps provide separate plots and allows to use their own scale

x <- ggplot(data=df, aes(x=Budgetinmillions))
x + geom_histogram(binwidth=10,aes(fill=Genre),color="Black") +
  facet_grid(Genre~.)
x + geom_histogram(binwidth=10,aes(fill=Genre),color="Black") +
  facet_grid(Genre~., scales='free')

y <- ggplot(data=df, aes(x=CriticRating, y=AudienceRating, color=Genre))
y + geom_point()
y + geom_point(size=2) + facet_grid(Genre~.)  + geom_smooth()
y + geom_point(size=2) + facet_grid(.~Year)
y + geom_point(size=2) + facet_grid(Genre~Year)  + geom_smooth()
# The negative ranges can be removed later
y + geom_point(aes(size=Budgetinmillions)) + geom_smooth() + facet_grid(Genre~Year)


#5 COORDINATES TO ZOOM IN
z <- ggplot(data=df, aes(x=CriticRating, y=AudienceRating, size=Budgetinmillions,
                         color=Genre))
z + geom_point()
# This cuts of the data
z + geom_point() + xlim(00,70) + ylim(0,70)

# To zoom in and not cut the data
z <- ggplot(data=df, aes(x=Budgetinmillions))
z + geom_histogram(binwidth = 10, aes(fill=Genre),color="Black")
z + geom_histogram(binwidth = 10, aes(fill=Genre),color="Black") +
  coord_cartesian(ylim = c(0,50))

# We zoom into the data to remove negative ranges
y + geom_point(aes(size=Budgetinmillions)) + geom_smooth() + facet_grid(Genre~Year)+
  coord_cartesian(ylim=c(0,120))


#6 ADDING THEMES - BEAUTIFY THE PLOTS - X and y axis names, titles etc

z <- ggplot(data=df, aes(x=Budgetinmillions))
a <- z + geom_histogram(binwidth = 10, aes(fill=Genre),color="Black")

a + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color="Black",size=15),
        axis.title.y = element_text(color="Red",size=15))

a + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color="Black",size=20),
        axis.title.y = element_text(color="Red",size=15),
        legend.title=element_text(size=20))

a + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color="Black",size=15),
        axis.title.y = element_text(color="Red",size=15),
        legend.title=element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1))

a + xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(color="Black",size=15),
        axis.title.y = element_text(color="Red",size=15),
        legend.title=element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title=element_text(color="Orange",size=40))
