#excercises from lesson 1
#easy
data(iris)
head(iris)
class(iris)
class(iris[,1])
class(iris[,5])

nrow(iris[iris[,4]>1,])

df<-iris[,c(1,2,5)]

#medium
#method 1
mean(iris[iris[,5]=="versicolor",3])

#method 2
vers<-which(iris[,5]=="versicolor")
versdf<-iris[vers,]
colMeans(versdf[,1:4])[3]

#exercise 2
data("ToothGrowth")
head(ToothGrowth)
#easy
str(ToothGrowth)

un<-unique(ToothGrowth[,2])
vc<-ToothGrowth[ToothGrowth[,2]==un[1],]
oj<-ToothGrowth[ToothGrowth[,2]==un[2],]

mean(vc$len)
mean(oj$len)

mean(vc[vc[,3]==2,1])
#medium
vc1<-split(x = vc, f =vc[,3])
oj1<-split(x = oj, f =oj[,3])
length(vc1)

a<-mean(vc1[[1]][,1])
b<-mean(vc1[[2]][,1])
c<-mean(oj1[[1]][,1])
d<-mean(oj1[[2]][,1])

out<-data.frame(C1=c(a, b), C2=c(c,d))
out

##################################
##LESSON 2

#function arguments
mean(c(2,4,6,7))

obj<-c(2,4,6,7)
mean(x=obj)
mean(obj)

a=1
a==2

vals<-paste("entry", 1:15, sep="_")
mat<-matrix(data=vals, nrow=5, ncol=3)
mat
  
#ask help
?matrix
?paste

matrix(data=vals, nrow=5, ncol=3, byrow=T)
#argumetns not needed
matrix()
#agruments necessary
mean()

#look into function
fix(mean)

#state functions
easyfun<-function(base,exp){
    out<-base^exp
    return(out)
}#end of function

easyfun(base=3,exp=6)
easyfun(7,6)

#convert F to C
(90-32)*0.5555556

F<-90
r<-100/180
C<-(F-32)*r
C

#ssemble to function
f2c<-function(F){
  out<-(F-32)*100/180
  return(paste(F, "Farenheit corresponds to", round(out, 2), "°C"))
}

f2c(90)


f2c<-function(F){
  out<-(F-32)*100/180
  return(out)
}
f2c(90)

#another function
c2k<-function(C){
  K<-C+273.5
  return(K)
}

c2k(23)

#nest functions!
f2k<-function(F){
  C<-f2c(F)
  K<-c2k(C)
  return(data.frame(C=C, K=K))
}

f2k(45)

#install and load package
install.packages("corrplot")
library(corrplot)
#now you can use functions in the package
corrplot(cor(iris[,1:4]))

#look in the workspace
ls()
rm(ratio)
r<-"raplaced"

#save the workspace
save.image(file="L2.image.Rdata")
save(vers, file="specific.object.Rdata")

#setting the working directory
setwd("C:/Users/admin/Documents/")
getwd()
dir()

dir(".")
dir("..")
dir("./R/win-library/3.4/")
setwd("./R/win-library/3.4/")
#mispelling
setwd("./R/win-libary/3.4/")

setwd("C:/Users/admin/Documents/")
save.image(file="L2.image.Rdata")

load("L2.image.Rdata")

#writing a table
tab<-data.frame(col1=1:12, col2=rep(c("A", "B"), 6))
tab
rownames(tab)<-paste("rowname", 1:nrow(tab), sep="_")
head(tab)

write.table(tab, file="example.table.txt", sep="\t")
write.table(tab, file="example.table.2.csv", sep=",") #row.names = 0, quote=F
getwd()

#read.table
tab1<-read.table("example.table.2.csv", sep=",", header= T)
head(tab1)
