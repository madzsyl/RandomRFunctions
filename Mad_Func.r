## Custom Functions

checknum = function(x) {
  
  return (suppressWarnings(!is.na(as.numeric(x))))
}

madBin = function(data, n = 0, q = seq(0,1,0.25), side = "<=", na_fill = "empty"){
  if(n>0){
    q = seq(0,1,1.0/n)
    cat("Creating", n, "bins of space (percentile)", round(1.0/n,2),"\n")
  } else{
    
    if(q[1]>0){
      q = c(0,q)
    }
    if(q[length(q)]<1){
      q = c(q,1)
    }
    
    n = (length(q)-1)
    
    cat(cat(q, sep = ", ", cat("Creating ", n, " bins at percentiles [", sep = "")), "]\n", sep = "")
  }
  
  x_quantile = quantile(data, probs = q, na.rm = T)
  
  cat(cat(x_quantile, sep = ", ", cat("Bin boundaries = [")), "]\n", sep = "")
  
  new_col = rep(NA, length(data))
  
  if(side=="<=") {
    for(i in n:2){
      new_col[data<=x_quantile[i]] = paste0(round(x_quantile[i-1],2), "<x<=", round(x_quantile[i],2))
    }
    new_col[data<=x_quantile[1]] = paste0("x<=", round(x_quantile[1],2))
  }
  
  else{
    for(i in 1:(n-1)){
      new_col[data>=x_quantile[i]] = paste0(round(x_quantile[i],2), "<=x<", round(x_quantile[i+1],2))
    }
    new_col[data>=x_quantile[n]] = paste0("x>=", round(x_quantile[n],2))
  } 
  
  new_col[is.na(data)] = na_fill
  
  return(new_col)  
}
