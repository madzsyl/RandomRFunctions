# RandomRFunctions
Random Functions which I write in R and use occasionally

1. checknum: Takes in any value and returns T if numeric and
2. madBin(data = input column, n = 0, q = seq(0,1,0.25), side = "<=", na_fill = "empty) 
    creates bins of either n equal spacings or according to the sequence input (will impute 0,1 at the ends). 
    side: default is "<=", else "<" for each bin boundary
    na_fill: default filler for NA values
    
   returns a new column.
   Suggested usage: 
    df$new_col = madBin(df$old_col, ...)
