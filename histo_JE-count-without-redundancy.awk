#!/bin/awk

BEGIN{
  min=1.428476519062e+12;  # lower bound of data (2nd column);
  max=1.428562936001e+12;  # upper bound of data (2nd column);
  w=1000000;  # width of the bins 

  for(i=min;i<=max;i+=w){  # loop on the bins
    tab[(i+(w/2))]=0  # initialisation
  }

}

{
  for(i=min;i<=max;i+=w){ 
    if(i<=$2 && $2<(i+w)){ # check if the data is included in the bin limited  by i and i+w
      tab[(i+(w/2))]++   # increment the number of data in the specific bin
      if (dejavu[(i+(w/2)),$1]==0){  # check if the userid belonging to the bin ((i+(w/2))) it's the first time you see it
        popnr[(i+(w/2))]++ # increment if it's the first time
        dejavu[(i+(w/2)),$1]=1 # change the "boolean" dejavu to skip this user id the next time you meet it for the same bin
      }
      break
    }
  }
}

END{
 
  for(i=min;i<=max;i+=w){ 
    print i,"\t"i+w,"\t" (i+(w/2)),"\t"tab[(i+(w/2))],"\t",popnr[(i+(w/2))]
  }

}
