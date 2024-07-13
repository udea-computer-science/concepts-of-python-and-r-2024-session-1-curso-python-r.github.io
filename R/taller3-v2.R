###########################################
# TALLER 4
###########################################

# file contents:
# 1. tv advertise budget
# 2. radio advertise budget
# 3. newspaper advertise budget
# 4. sales

# LOAD DATA:
df=read.csv("Advertising.csv",header = T,sep = ",")
# INFO OF FILE:
#length(df)
#names(df)
#fix(advertise)

# GET VARIABLES FROM HEADERS
attach(df)

# EXPLORING DATA:
plot(radio,sales)
pairs(df)

#LINEAR REGRESSION:
lin_mod=lm(sales~TV,df)
#lin_mod=lm(sales~TV+newspaper+radio,df)
summary(lin_mod)
coef<-coefficients(lin_mod)
beta0=coef[1]
beta1=coef[2]

# DEFINE MODEL FUNCTION:
Ffit <- function(x){
  y=beta0+beta1*x
  return (y)
}

# SAMPLE MODEL PREDICTION:
x=seq(min(TV),max(TV),length=200)
y=Ffit(x)

# PLOT RESULTS:
scatter.smooth(TV,sales)
plot(TV,sales)
abline(lin_mod,col="red")
#plot(x,y)

