#script for the first lecture in R for ABD 2020
#instructions follow below

#instructions are put in the script to be run in the console
3+3 #to run this line, hit ctrl+enter
4   + 2

#commenting out disables instructions
#3+3

#use of mathematical operators
4*6
2+4*6
2^3

#relational operatus
2 >4
2 != 4
2==2

#use of simple functions
2+5+6+7
sum(2,5,6,7)

mean(2,5,6,7)
sqrt(8)

#make use of objects
sqrt(8)
obj<-sqrt(8) #assigment operator <-
sqrt(8)-> obj
obj

ciao<-obj*obj

ciao
Ciao

a<-4==5

a=4==5 #equal as assingment operator
a

#objects can be overwritten
a<-3
a
a<-7
a

#object classes
obj1<-3
obj1
class(obj1)  

obj2<-"3"
obj2
class(obj2)
obj2*obj2 # you cannot multiply strings

obj3<-as.numeric(obj2) #to autocomplete use TAB
obj3

#check class
is.character(obj3)
is.numeric(obj3)

##VECTORS
vec<-c(2,3,4,5,5)
vec
class(vec)

vec1<-c(2,3,4,"5")
vec1
class(vec1)

mean(vec) #functions to vector
min(vec)
cumsum(vec)

vec.u<-unique(vec)
vec
vec.u

v3<-1:10 #using colon
v3

##MATRIX
mat<-matrix(data=100, nrow=3, ncol=5)
mat
nrow(mat)
dim(mat)
colSums(mat)

#make a bigger matrix
mat1<-cbind(mat, mat)
mat1
tmat<-t(mat1)
tmat
head(tmat) #just print the beginning of it

nrow(vec) #matrix function may not apply to vectors!
dim(vec)

#DATAFRAME
df<-data.frame(char=c("A", "B", "C"), num=c(1,2,3))
df

v1<-c("A", "B", "C")
v2<-c(1,2,3)
df<-data.frame(char=v1, num=v2)
df
rownames(df)<-c("row1", "row2", "row3")
df

df1<-data.frame(ch=v1, ch2=v1)
df1
rownames(df1)<-v1
df1

#LISTS
ls<-list("A", 3, "B")
ls

ls1<-list(v1, df1, t(mat1), 3)
ls1

head(ls1)

#characterize your unkonwn object
class(ls1)
str(ls1)

df
class(df)
str(df)

##indexing vectors
v1<-c(1,4,6,7,2,3)
v1
length(v1)

v1[4]#access fouth element
v1[1:3]#elemtns from 1 to 3
v1[-5]
v1[v1==7]
v1[v1>3]
v1[v1!=7]
v1[v1 %in% c(2,4)] #subset by values overlap
v1[!v1 %in% c(2,4)] #subset by values difference

#reassign to orginal object to make indexing permanent
v1<-v1[v1 %in% c(2,4)] #subset by values overlap
v1

#indexing df
df<-data.frame(vec=v1, char=rep("A", length(v1)))
df

df[,1]
v3<-df[1,]
v3
df[1,2]

df[df[,1]>3,] #indexing a vector within a dataframe
df[1:3,]

df$char
df$vec

df[,1]#get first column by selection
df[,-2]#get first column by subtraction

#subsetting list
ls1
class(ls1[[3]][1,])
str(ls1[[3]][1,])
is.vector(ls1[[3]][1,])

#MISSING VALUES
vna<-c(1,4,5:8, NA, 8)
class(vna)

mean(vna)
mean(vna, na.rm=TRUE) #add arguments
is.na(vna)

vmiss<-c(1,4,5:8, "missing", 8) #messing with string and wrong coding of NA values
class(vmiss)
vmiss
mean(vmiss, na.rm=TRUE)


#from vectors to class
obj<-c(1,4,5,5,4,7)
obj
obj<-as.factor(obj)
obj
levels(obj)
obj1<-obj[obj !=5]
obj1
droplevels(obj1)

df1
class(df1[,1])

#don't want factors?
options(stringsAsFactors = F)
df1<-data.frame(ch=c("A", "B", "C"), ch2=c("A", "B", "C"))
class(df1[,1])

#watch out of synthax
badvec<-c(1,4,56, "afhbasdfhgasdf ) #forget to close the quotes

