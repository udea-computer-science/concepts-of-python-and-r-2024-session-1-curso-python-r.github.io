##################################################
# TALLER 1

# HELP
# https://www.rdocumentation.org
#?q
#?matrix

# DEFININING VECTORS
x <- c(1 ,3 ,2 ,5)
x
y <- c(1 ,4 ,3, 0)
y

# ARITMETHIC OPERATIONS
"adition:"
x+y
"product:"
x*y
"division:"
y/x
"power:"
x^2
"module:"
y %% x


# BUILD IN FUNCTIONS
length(x)
ls()
rm(x)
ls()
exp(0)
sin(0)
cos(0)
x = rnorm (50)
y = x + rnorm (50 , mean =50 , sd =.1)
cor(x , y)

# GENERATING SEQUENCES
x <- 1:30
seq(1, 5, 0.5)
rep(1, 30)
3 + rnorm(1)
x = seq ( - pi , pi , length =50)

# MATRIX
#x = matrix ( data = c (1 ,2 ,3 ,4) , nrow =2 , ncol =2)
x = matrix ( c (1 ,2 ,3 ,4, 0, 8) ,2 ,3)
print(x)
sqrt(x)

# DATA FRAME
name <- "Carmen";
n1 <- 10;
n2 <- 100;
m <- 0.5
df <- data.frame(name,n1, n2, m)
ls.str(pat="df")

# USER DEFINTED FUNCTIONS
sayHello <- function()
{
    # print 
    print('hello world')
}
sayHello()

myFirstFun<-function(n)
{
  # Compute the square of integer `n`
  n*n   
}

fahrenheit_to_kelvin <- function(temp_F) {
  temp_K <- ((temp_F - 32)*(5 / 9)) + 273.15
  return(temp_K)
}

# PLOTTING
# x = rnorm (100)
# y = rnorm (100)
# plot (x , y )
# plot (x ,y , xlab =" this is the x - axis " , ylab =" thismain =", main ="Plot of X vs Y ")
# pdf(" Figure.pdf ")
# plot (x ,y , col =" green ")
# dev.off()


x<-seq( -pi, pi , length=50)
y=x
f = outer(x ,y , function(x , y) cos(y)/(1+ x^2) )
fa =( f - t ( f ) ) /2
pdf("Figure2.pdf ")
image(x ,y , fa )
contour(x ,y , f )
contour(x ,y ,f , nlevels =45 , add = T )
contour(x ,y , fa , nlevels =15)
persp (x ,y , fa )
persp (x ,y , fa , theta =30)
persp (x ,y , fa , theta =30 , phi =20)
persp (x ,y , fa , theta =30 , phi =70)
persp (x ,y , fa , theta =30 , phi =40)
dev.off()

# INSTALLING PACKAGES
#install.packages('ISLR')


# READ AND WRITE FILES
# FILE DETAILS:
# 1. mpg: continuous 
# 2. cylinders: multi-valued discrete 
# 3. displacement: continuous 
# 4. horsepower: continuous 
# 5. weight: continuous 
# 6. acceleration: continuous 
# 7. model year: multi-valued discrete 
# 8. origin: multi-valued discrete 
# 9. car name: string (unique for each instance)

Auto = read.table("Auto.data" , header=T , na.strings ="?")
# read.csv(file, header = TRUE)
#fix(Auto)
#summary ( Auto )
dim(Auto)

# CLEANING
Auto = na.omit( Auto )
dim(Auto)
#summary ( Auto )

# HEADER NAMES
names(Auto)
pdf("Figure3.pdf")
plot ( Auto$cylinders , Auto$mpg ,xlab="cylinders", ylab="mpg")
dev.off()




attach(Auto)

pdf("Figure4.pdf")
plot(cylinders, mpg)
dev.off()


pdf("Figure5.pdf")
hist(mpg)
dev.off()


# cylinders = as.factor(cylinders)
# plot(cylinders,mpg)
# plot(cylinders,mpg,col="red")
# plot(cylinders,mpg,col="red",varwidth=T)
# plot(cylinders,mpg,col="red",varwidth=T, horizontal=T)
# plot(cylinders,mpg,col="red",varwidth=T, horizontal=T,xlab="Cylinders",ylab = "MPG")
# 
# hist (mpg)
# hist (mpg, col=2)
# hist (mpg, col=2 , breaks=15)


pairs(Auto)

pairs(~mpg + displacement + horsepower + weight + acceleration, Auto)

plot(cylinders,mpg,col="red",varwidth=T, horizontal=T)
# write.table()
