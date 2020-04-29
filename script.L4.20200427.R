###################
## about looping and automation


wd<-"C:/Users/admin/OneDrive - Scuola Superiore Sant'Anna/documents/TEACHING/R_for_ABD"
setwd(wd)


mercedes<-1.34
ferrari<-1.22

if(mercedes>ferrari){
  print("ferrari first")
}#if



# if statement excercise

vote<-23
if(vote>18){
  print("passed!")
}#if

vote<-33
if(vote<0 | vote>30){ ## if(!vote %in% 1:30)
  print("ERROR: out of range")
} else if (vote > 18){
  print("passed")
} else {
  print("too bad!")
}

## for loop excercise
tot<-1000
out<-c()
for (i in 1:tot){
  out[i]<-sample(1:6,1)
}
table(out)
chisq.test(x=table(out), p=rep(1/6, 6))

# another exercise
tot<-10
dim<-100
out<-matrix(ncol=tot, nrow=dim)
for (i in 1:tot){
  out[,i]<-rnorm(dim)
}
head(out)

#plot each histogram
for (i in 1:tot){
  png(paste("hist", i, "png", sep="."))
    hist(rnorm(dim), col="red")
  dev.off()
}


## while excercise
money<-10
while(money>0.5){
  #flip the coin
  out<-sample(c("tail", "heads"), 1)
  if(out=="heads"){
    money<-money*2
  } else {
    money<-money/2
  }
  print(money)
}

###################
## excercise at the end of L4

wd<-"C:/Users/admin/OneDrive - Scuola Superiore Sant'Anna/documents/TEACHING/R_for_ABD"
setwd(wd)

#load in the data that is needed
nam<-read.delim("data/EtNAM.data.toy.txt", header=T)
namd<-read.delim("data/EtNAM.data.disease.toy.txt", header=T)

head(nam)
dim(nam)

head(namd)
dim(namd)

# extract columns
colnames(nam)
namsub<-nam[,c(1:3, grep("^D", colnames(nam)))]
head(namsub)

# merge the two datasets
dfout<-merge(namsub, namd, by.x="code", by.y="code", all=T)
#clean removing redundant columns
dfout<-dfout[,c(1:7,10)]
#fix colnmaes
colnames(dfout)<-sub("\\.[xy]$", "", colnames(dfout))
head(dfout)

# split and do something in a loop framework
byfam<-split(dfout, dfout[,"Et_family"] )
class(byfam)
length(byfam)
lapply(byfam, class)

# do some summary stat in a for loop
outmean<-list()
for(i in 1:length(byfam)){  #i=1
  tmp<-byfam[[i]]
  outmean[[i]]<-apply(tmp[,4:ncol(tmp)], 2, function(x) {mean(x, na.rm=T)})
  
  #get plot of septoria
  png(paste0("hist.septoria.family", names(byfam)[i],".png" ))
  hist(tmp[,"septoria"])
  dev.off()
}
outmean

getwd()



