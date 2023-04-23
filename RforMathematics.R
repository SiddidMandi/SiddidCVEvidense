read.csv("results/Data.csv")
install.packages(c("knitr","xfun","evaluate","highr"), lib="/home/siddid/Rpackages")
install.packages("cmna", lib="/home/siddid/Rpackages")
install.packages("pracma", lib="/home/siddid/Rpackages")
install.packages("MASS", lib="/home/siddid/Rpackages")
install.packages("Matrix", lib="/home/siddid/Rpackages")
install.packages(c("Ryacas0"), lib="/home/siddid/Rpackages", dependencies=TRUE)
install.packages("rSymPy", lib="/home/siddid/Rpackages")
install.packages("rJython", lib="/home/siddid/Rpackages")
install.packages("fractions", lib="/home/siddid/Rpackages")

install.packages("reticulate", lib="/home/siddid/Rpackages")
install.packages("/home/siddid/Rpackages/rSymPy.tar.gz", repos=NULL, type='source')

.libPaths("/home/siddid/Rpackages")
#once installed just run the commands below
#kp to knit current file
setRepositories()

Sys.getenv("JAVA_HOME")
system("find / -name config.log")
.jinit()


install_sympy(method = "auto", conda = "auto")

library("xfun")
library("highr")
library("evaluate")
library("knitr")
library("Matrix")
library("cmna")
library('MASS')
library("Ryacas")
library("Ryacas0")
library("reticulate")

sessionInfo()

#sympy through python
use_python("/usr/bin/python3", required = TRUE)
s  <- import("sympy")
x = s$Symbol("x")





require("Ryacas")
x <- Sym("x")
y <- Sym(y)
mat1 <- List(
	     List(1, x),
	     List(2, 3)
)
mat1
det(mat1)

matrix2

x <- Sym("x")
x+1+1
matrix2 <- matrix(c(1, 2, 3, Sym("a"), nrow=2, ncol=2, byrow=TRUE)
matrix3 <- matrix(c(1,2,3,4), nrow=2, ncol=2, byrow=TRUE)
matrix3
matrix2

matrix2 <- apply(matrix2,c(1,2), Sym)
matrix2 <- ysym(det(matrix2))
det_matrix2 <- det(matrix2)


x <- ysym("x")
y <- ysym("y")
p <- x^2+x-6
x+y+1+1
matrixX <- matrix(c(x,y,x,y), nrow=2, ncol=2, byrow=TRUE)
matrixX

a <- sym("a")
matrix1 <- matrix(c(1,2,3,a), nrow=2, ncol=2, byrow=TRUE)
det(matrix1)


#question 1, use cmna package
matrix1 <- matrix(c(1,-1,2,1,1,2,2,1,0,0,1,1,0,1,1), nrow=4, ncol=3, byrow=TRUE)
matrix1
matrixAug <- matrix(c(1,0,1,-1), nrow=4, ncol=1, byrow=TRUE)
matrixAug
AB <- cbind(matrix1,matrixAug)
AB
refmatrix(AB)
inalM <- ref(AB)
kable(AB)
Atrans <- t(matrix1)
Atrans
Atrans %*% matrix1

##Question 1 redone
matrixA <- matrix(c(1,-1,2,1,1,2,2,1,0,0,1,1,0,1,1), nrow=4, ncol=3, byrow=TRUE)
matrixb <- matrix(c(1,0,1,-1), nrow=4, ncol=1, byrow=TRUE)
matrixTA  <- t(matrixA)

## Question 3
matrixAandB <- matrix(c(1,1,-1,0,'a'+1,1,-1,'-a'-2, b-a,1,-a,-2), nrow=3, ncol=3, byrow=TRUE)
matrixAandB

knitr::opts_chunk$set(warning=FALSE)
knit("init.Rnw")
