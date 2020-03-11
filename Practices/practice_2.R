# Practice find 20 more functions in R and make an example of it.

# 1. append() - add elements to a vector
append(1:5, 0:1, after = 3) # [1] 1 2 3 0 1 4 5

# 2. cbind() - Combine vectors by row/column
m <- cbind(1, 1:7) 
# |V1 | V2
# | 1 | 1
# | 1 | 2
# | 1 | 3
# | 1 | 4
# | 1 | 5
# | 1 | 6 
# | 1 | 7

# 3. identical() - test if 2 objects are exactly equal
identical(1, -1) ## FALSE 
identical(1, 1.) ## TRUE in R (both are stored as doubles)

# 4. range(x) - minimum and maximum
x <- c(2,7,1,-17,35,21,7)
range(x) #[1] -17  35

# 5. sort(x) - sort the vector x
x<-c(3,5,1,2,4,7) 
sort(x) #[1] 1 2 3 4 5 7
# sorting with sort function in R: descending order 
sort(x,decreasing=TRUE) #[1] 7 5 4 3 2 1

# 6. rank() - returns the ranks of the values in a vector
x <- c(2,7,1,-17,NA,Inf,35,21)
rank(x) #[1] 3 4 2 1 8 7 6 5

# 7. sq() - generates a sequence of numbers
seq(5,10) #[1]  5  6  7  8  9 10
seq(from=0, to=20, length.out=5) #[1]  0  5 10 15 20


# 8. strsplit() - split the string into substrings with the specified delimiter.
mysentence<- "india won the icc worldcup on 2011"
strsplit(mysentence," ") #[1] "india" "won" "the" "icc" "worldcup" "on" "2011"   

# 9. cat() - combine character values and print them to the screen or save them in a file directly
cat('one',2,'three',4,'five') #one 2 three 4 five

# 10. trunk() - rounds to the nearest integer in the direction of 0.
trunc(125.2395) #[1] 125

# 11. round a number with the indicated decimals, if not indicated an integer is given
round (6.78.1)
round (11.80)

# 12. Argument (...)
inverse <- function (...) {
  v <- unlist (list (...)) # Assign the arguments to a vector
  x <- 1 / v
  return (x)
}
inverse (3)

# 13. concatenate
x <- c (1,2,3)
t <- c ("one", "two", "three")
x; t

# 14. root
sqrt (25)

# 15. text and output variable, \ n new line
x <- 5
and <- 2
cat (x, "raised to", y, "is", x ^ y, "\ n")

# 16. shows the number of elements
x <- 7:10
length (x)

# 17. removes decimals
trunc (3.1416)
trunc (23.0987)

# 18. returns T if the condition is met
x <- runif (10, -10, 100)
if (any (x <0)) cat ("In x there are negative numbers \ n")

# 19. sum the vector elements
x <- runif (50,2,15)
sum (x)

# 20. generates random numbers
runif (3,1,10)

