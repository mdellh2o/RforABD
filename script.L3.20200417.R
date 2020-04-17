wd<-"C:/Users/admin/OneDrive - Scuola Superiore Sant'Anna/documents/TEACHING/R_for_ABD"
setwd(wd)

getwd()
#plotting

#devices
mean(c(1,2,3,56))
mn<-mean(c(1,2,3,56))
mn

#device 0
v1<-sample(1:30, 15)
v2<-sample(1:30, 15)

plot(v1,v2)

#save it on disk
png("trialplot.png")
  plot(v1,v2)
dev.off()




#remeber to close after you are done!!!!

#change size of teh graphical device
png("trialplot1.png", width=800, height=200)
  plot(v1,v2)
dev.off()

png("trialplot2.png", width=400, height=800)
  plot(v1,v2)
dev.off()

# set higher resolution
png("trialplot2.hires.png", res=200)
  plot(v1,v2)
dev.off()

#set graphical parameters
plot(v1, v2)

par(mai=c(0.5,1,0.5,3))
plot(v1, v2)
#graphical parameter are valid until you keep the device open! even if is just the screen
dev.off()

plot(v1, v2)

png("doubleplot.png")
  par(mfrow=c(1,2))
  plot(v1, v2)
  plot(v2, v1)
dev.off()

#tweaking arguments
plot(x=v1, y=v2)
plot(x=v1, y=v2, main="nice plot!")
plot(x=v1, y=v2, main="nice plot!", ylim=c(-10,50))
plot(x=v1, y=v2, main="nice plot!", ylim=c(-10,50), xlab="variable 1")
plot(x=v1, y=v2, main="nice plot!", ylim=c(-10,50), xlab="variable 1", col="pink")
plot(x=v1, y=v2, main="nice plot!", ylim=c(-10,50), xlab="variable 1", col="pink", cex=2)
plot(x=v1, y=v2, main="nice plot!", ylim=c(-10,50), xlab="variable 1", col="red", cex=2, pch=64)

#add features to the plot
plot(x=v1, y=v2, main="nice plot!", ylim=c(-10,50), xlab="variable 1", col="red", cex=2)
points(x=15, y=40, col="blue", cex=3)
legend("topright", legend=c("red dot","blue dot"), pch =20, col=c("red", "blue"))

#another plot
dat<-rnorm(100)
plot(sort(dat), col=rainbow(20))
abline(h=c(-1,1), lty=2)
#check the proportion of occurrences within 1 sd of the mean
tmp<-which(dat < 1 & dat > -1)
length(tmp)/length(dat)

#different plot types
data(mtcars)
head(mtcars)

plot(mtcars$mpg, mtcars$disp)
plot(mtcars[,c(1,3)])
plot(mtcars$mpg ~ mtcars$disp)

hist(mtcars[,"hp"], col="gray90")
boxplot(mtcars[,"hp"], col="gray90")
boxplot(mtcars[,"hp"] ~ mtcars$cyl, col="gray90")

pairs(mtcars[,1:4])

x<-as.matrix(scale(mtcars))
heatmap(x)


#make things more fancy with packages
library("corrplot")
cr<-cor(mtcars[,1:4])
corrplot(cr, "pie", "lower")

#install.packages("vioplot")
library("vioplot")
vioplot(mtcars[,"hp"])

#specify colors
boxplot(mtcars[,"hp"] ~ mtcars$cyl, col=c("red", "blue", "green"))
boxplot(mtcars[,"hp"] ~ mtcars$cyl, col=terrain.colors(3))
boxplot(mtcars[,"hp"] ~ mtcars$cyl, col=c("#890029","#bea60a","#f377e3"))

#usage of ggplot to make super cool graphs
#install.packages("ggplot2")
library(ggplot2)
#fix the dataframe
data(mtcars)
head(mtcars)
mtcars[,2]<-as.factor(mtcars[,2])

#make a ggplot
ggplot(data=mtcars, aes(x=cyl, y=hp)) + geom_boxplot()

ggplot(data=mtcars, aes(x=cyl, y=hp, fill=cyl)) + geom_boxplot()

#use different ahestetics
ggplot(data=mtcars, aes(x=mpg, y=hp)) + geom_point()
ggplot(data=mtcars, aes(x=mpg, y=hp)) + geom_line()


ggplot(data=mtcars, aes(x=mpg, y=hp, size=disp, col=cyl)) + 
      geom_point() +
      theme_bw()

#faceting
ggplot(data=mtcars, aes(x=mpg, y=hp, size=disp, col=cyl)) + 
  geom_point() +
  facet_grid(. ~ gear) +
  theme_bw()

#add statistics
ggplot(data=mtcars, aes(x=mpg, y=hp, size=disp)) + 
  geom_point() +
  stat_smooth(method="lm") +
  theme_bw()

ggplot(data=mtcars, aes(x=cyl, y=hp, fill=cyl)) +  
   geom_boxplot()

#redirect plot to object
plt1<-ggplot(data=mtcars, aes(x=mpg, y=hp)) + geom_point()
plt2<-plt1 + geom_line() + theme_bw() 
plt2 + labs(title="fancy plot")


#side by site plotting
ggplot(data=mtcars, aes(x=mpg, fill=cyl)) +
  geom_density(width=1, position="dodge", alpha=0.4)
  
## use additional packages with a different flavour of ggplot

#install.packages("ggpubr")
library(ggpubr)

#use a KW test
ggboxplot(data=mtcars, x="cyl", y="hp", col="cyl") +
  stat_compare_means()
#same test as this
kruskal.test(hp ~ cyl, data = mtcars)

#assemble multple plots
#install.packages("patchwork")
library(patchwork)

p1<-ggboxplot(data=mtcars, x="cyl", y="hp", col="cyl") +
  stat_compare_means()+
  labs(tag="A")


p2<-ggplot(data=mtcars, aes(x=mpg, y=hp)) + geom_point()+
  labs(tag="B")


#use patchwork notation
p1|p2

p1/p2

comb<-p1/(p2|p2)

#to save a ggplot
#you do not use the same notation as base plot!
ggsave(comb, file="doubleplot.pdf", height = 4, width = 4)



#one plot into the other
#install.packages("grid")
library(grid)

a_plot<-ggplot(data=mtcars, aes(x=mpg, y=hp)) + geom_point()
a_plot
vp <- viewport(width = 0.4, height = 0.4, x = 0.8, y = 0.8)

pdf("inset.plot.pdf")
  print(a_plot)
  print(a_plot, vp = vp)
dev.off()

# will not work!
#pdf("inset.plot.pdf")
#  a_plot
#dev.off()

#change axis appearance

px<-ggplot(data=mtcars, aes(x=mpg, fill=cyl)) +
  geom_density(width=1, position="dodge", alpha=0.4)
  
#set features of text
it <- element_text(face = "italic")

## axis.text.x for x axis only
px + theme(axis.text.y = it)

