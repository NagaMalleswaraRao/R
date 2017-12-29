'Loop to find even or odd numbers'
a <- 1:10

for (i in a)
{
  if ((i %% 2) == 0) {
    print(paste (i, "Even", sep = " "))
  }  else {
    print(paste (i, "Odd", sep = " "))
  }
}