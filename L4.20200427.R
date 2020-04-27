###################
## a script about control structures

wdir<-"C:/Users/admin/OneDrive - Scuola Superiore Sant'Anna/documents/TEACHING/R_for_ABD"
setwd(wdir)

#ready to start!

## we start with the if/else stament
ferrari<-1.34
mercedes<-1.45

# this is the synthax
# if(condition is T/F) { do something }

if(ferrari < mercedes){
  print("Ferrari will start first!")
} # if(ferrari < mercedes)

# same as this
if(ferrari < mercedes){ print("Ferrari will start first!") } # if(ferrari < mercedes)

# a false condition will not make R run the code
if(ferrari > mercedes){
  print("Ferrari will start first!")
}

# adding the else statment
ferrari <-1.12
mercedes <-1.145

if(ferrari < mercedes){
  print("Ferrari starts first!")
} else {
  print("Mercedes starts first!")
}

# get to the else if  statement

ferrari <-1.1
mercedes <-1.1

if(ferrari < mercedes){
  print("Ferrari starts first!")
} else if (mercedes < ferrari) {
  print("Mercedes starts first!")
} else {
  print("This is really weird, timings are the same!!")
}

# if you have additional conditions...check consequentiality of the code!

redbull <-1.0
mercedes <-1.1
ferrari <-1.2

if(ferrari < mercedes){
  print("Ferrari starts first!")
} else if (ferrari < redbull) {
  print("Ferrari starts first!")
} else if (redbull < mercedes) {
  print("Redbull starts first!")
} else {
  print("Mercedes starts first!")
}

# a more efficient way to do the same as above
if(ferrari < mercedes & ferrari < redbull){  # "&" for "AND", "|" for "OR"
  print("Ferrari starts first!")
} else if (mercedes < redbull & mercedes < ferrari) {
  print("Mercedes starts first!")
} else {
  print("Redbull starts first!")
} 

# a totally different way to do the same thing
redbull <-1.0
mercedes <-1.1
ferrari <-1.9

laptime<-c(redbull, mercedes, ferrari)
names(laptime)<-c("Redbull", "Mercedes", "Ferrari")
laptime

winner<-names(laptime)[which(laptime == min(laptime))]
print(paste(winner, "will start first!"))

## excercise
tscore<-32

if(!tscore %in% 1:30) { #same as tscore < 1 | tscore < 30
  print("The value is outside the allowed range")
} else if(tscore > 18){
  print("Passed!")
} else {
  print("too bad!")
}

#####
# get into the for loop!

monza<-c(1.23, 1.42, 1.34)
suzuka <-c(1.56,1.50,1.55)
lemans <- c(2.31,2.33,2.43)
outcome<-data.frame(M= monza, S=suzuka, L=lemans)
rownames(outcome)<-c("Ferrari", "Mercedes", "Redbull")
outcome

#make a for loop to print the shortes timelap in each circuit
for (i in 1:3){
  tmp<-min(outcome[,i])
  print(tmp)
}#for loop

for (i in 1:ncol(outcome)){
  nametrack<-colnames(outcome)[i]
  namecar<-rownames(outcome)[which(outcome[,i] == min(outcome[,i]))]
  print(paste(namecar, "starts first on", nametrack))
}#for loop

## nest for loops
listout<-list(outcome, t(outcome), outcome, t(outcome))
for(i in 1:length(listout)){ # i=1
  print(paste("list element number", i))
  tmp<-listout[[i]]
  for (j in 1:nrow(tmp)){ # notice the change of the iterator name!!!
      print(max(tmp[j,]))
  }# for j
}# for i

#add an if statemet in a for loop

for (i in 1:ncol(outcome)){
  nametrack<-colnames(outcome)[i]
  namecar<-rownames(outcome)[which(outcome[,i] == min(outcome[,i]))]
  print(paste(namecar, "starts first on", nametrack))
  if(namecar == "Ferrari"){
    print("yay! cool!")
  } else {
    print("that's too bad!")
  }
}#for loop

#add results to object
ltres<-list()
for (i in 1:ncol(outcome)){
  ltres[[i]]<-rownames(outcome)[which(outcome[,i] == min(outcome[,i]))]
}#for loop
ltres
#unlist the list into a vector
resvec<-unlist(ltres)
resvec

# break the loop
for (i in 1:ncol(outcome)){
  nametrack<-colnames(outcome)[i]
  namecar<-rownames(outcome)[which(outcome[,i] == min(outcome[,i]))]
  print(paste(namecar, "starts first on", nametrack))
  if(namecar != "Ferrari"){
    print(paste("for loop stopped at iteration", i))
    break
  }
}#for loop
i #current value of the iterator

# an example with dices
niter<-1e3
outobj<-c()
for (i in 1:niter){
  dice<-sample(1:6,1)
  outobj<-c(outobj, dice)
}#for i
faces<-table(outobj)
faces
barplot(faces)

chisq.test(faces, p=rep(1/6, 6))

#############
## while loop
laps<-1
maxlap<-20
while(laps <= maxlap){
  print(paste("lap number", laps))
  laps<-laps+1
}

# same result with a for/if loop
for (i in 1:100){
  if(i >= maxlap){
    break
  }
  print(paste("lap number", i))
}

# example of a while loop with coin flip
money<-10
out<-c()
while(money > 0.50){
  coin<-sample(c("tails", "heads"), 1)
  if(coin == "heads"){
    money<-money*2
  } else {
    money<-money/2
  }
  out<-c(out, money)
} #while
#get the output rounding it
round(out, 2)
max(out)


#use a marker to keep track of operations
for (i in 1:1e6) {
  if (i %% 1e5==0){
    print(i)
  }#if loop
  #do something
}#for

###
# apply() function to vectorialize
mat<-matrix(rnorm(40), nrow=10, ncol=4)

# I want to get the mean of each column
#with for loop
out<-c()
for (i in 1:ncol(mat)){
  tmp<-mat[,i]
  out<-c(out,mean(tmp))
}
out

#with apply
apply(mat, 2, FUN=mean)

#use built in function
colMeans(mat) #rowMeans(mat)

#with apply you can use whethever function
myfun<-function(x) {x[1]+x[4]}
apply(mat, 2, FUN=myfun)


## the marge function
df1<-data.frame(col1=c("A", "B", "C", "A"), col2=c(1,2,2,3))
df2<-data.frame(col1=c("C", "D", "A"), col3=c("yellow", "red", "red"))

dfm<-merge(x=df1, y=df2, by="col1", all=T)
dfm

## the split function to iterate operations
byletter<-split(dfm, dfm[,"col1"])
out<-c()
for(i in 1:length(byletter)){
  tmp<-byletter[[i]]
  out<-c(out, min(tmp[,2]))
}
out

#another example with splitting
data(mtcars)
bygear<-split(mtcars, mtcars$gear)
length(bygear)
names(bygear)

for(l in 1:length(bygear)){
  print(l)
  tmp<-bygear[[l]]
  
  png(paste0("plotgear.", l, ".png"))
    plot(tmp$mpg, tmp$disp, col="blue")
  dev.off()
}

## sub() function
vector<-c("Hi", "everyone", "how", "do", "you", "like", "phase 2", "lockdown?")
sub("everyone", "Matteo", vector)
sub("d", "Matteo", vector)

# use regex
sub("^d", "Matteo", vector)

#useful for fixing sample names
samples<-c("LAM_rep3:lane1:20200401", "LAM_rep2:lane2:20200402", "LAM_rep1:lane1:20200411")
newnames<-sub("\\:.*\\:.*$", "", samples)

# the use of double backslash
samp1<-c("asfasd:$LAM_rep4","sdfsd:$LAM_rep5")
sub(".*$", "", samp1) #wrong way
sub(".*\\$", "", samp1) #right way

# use grep
grep("rep3", newnames)
grep("LAM", newnames)


head(mtcars)
#only mazdas
mzds<-mtcars[grep("Mazda", rownames(mtcars)),]
mzds

#only brands starting with F using regex
fs<-mtcars[grep("^[Ff]", rownames(mtcars)),]
fs
