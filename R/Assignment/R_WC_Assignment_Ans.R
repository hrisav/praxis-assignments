#Make a matrix (6x50) having all zero values

cnames = c("Bowled 1","Bowled 2","Bowled 3","Bowled 4","Bowled 5","Bowled 6")
rnames = seq(1,50,1)
rnames[1:50] = paste("Over-",rnames[1:50])
vScoreMatrix = matrix(0,byrow=TRUE,nrow=50,ncol=6, dimnames=list(rnames,cnames))

#FOR OVERS 1 TO 10
#Dividing overs into odd and even
#Sampling from 0,0,1,1,2,4 in case of odd overs
#Sampling from 0,0,1,1,2,6 in case of even overs

odd = seq(1,10,2) #1,3,5,7,9
even = seq(2,10,2) #2,4,6,8,10

vScoreMatrix[odd,] = sample(c(0,0,1,1,2,4),size=6)
vScoreMatrix[even,] = sample(c(0,0,1,1,2,6),size=6)

#FOR OVERS 11 TO 15
#Sampling from 0,0,1,2,2,4 for overs 11 to 15

vScoreMatrix[11:15,] = sample(c(0,0,1,2,2,4),size=6)

#FOR OVERS 16 TO 25
#Sampling from 0,1,1,2,2,6 in case of odd overs
#Sampling from 0,0,1,1,2,2 in case of even overs

odd1 = seq(17,25,2) #17,19,21,23,25
even1 = seq(16,25,2) #16,18,20,22,24

vScoreMatrix[odd1,] = sample(c(0,1,1,2,2,6),size=6)
vScoreMatrix[even1,] = sample(c(0,0,1,1,2,2),size=6)

#FOR OVERS 26 TO 40

#t0 will have all the overs from 26 to 40
#t1 will have 27,33,39 (starting from 27 and increment by 6)
#t2 will have 30,36 (starting from 30 and increment by 6)
#t3 will have all remaining overs of t0 after t1 and t2 overs are removed

t0 = seq(26,40,1)

t1 = seq(27,40,6) #27,33,39
for (i in 1:3) 
{
  vScoreMatrix[t1[i],] = sample(c(0,1,1,2,2,6),size=6)
}

t2 = seq(30,36,6) #30,36
for (i in 1:2) 
{
  vScoreMatrix[t2[i],] = sample(c(0,1,1,2,2,4),size=6)
}

t3 = setdiff(setdiff(t0, t1), t2) #26,28,29,31,32,34,35,37,38,40
for (i in 1:length(t3)) 
{
  vScoreMatrix[t3[i],] = sample(c(0,0,1,1,2,2),size=6)
}

#FOR OVERS 41 TO 50
#Sampling from 0,1,2,2,3,6 in case of odd overs
#Sampling from 0,1,2,2,3,4 in case of even overs

odd2 = seq(41,50,2) #41,43,45,47,49
even2 = seq(42,50,2) #42,44,46,48,50

vScoreMatrix[odd2,] = sample(c(0,1,2,2,3,6),size=6)
vScoreMatrix[even2,] = sample(c(0,1,2,2,3,4),size=6)

#FINAL RESULT

print(vScoreMatrix)

print(paste("Overall tally of dot balls: ",sum(vScoreMatrix[]==0)))
print(paste("Overall tally of over-boundaries: ",sum(vScoreMatrix[]==6)))
print(paste("Overall tally of doubles: ",sum(vScoreMatrix[]==2)))

vScoreMatrix <- cbind(vScoreMatrix,Score=rowSums(vScoreMatrix))
vScoreMatrix
