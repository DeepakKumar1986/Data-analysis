#!/bin/awk

BEGIN{
  #min=1.428476519060e+12;  # lower bound of data (2nd column);
  #max=1.42847930825e+12;  # upper bound of data (2nd column);

  min=1.428476519062e+12  # for tmp.out 
  max=1.428562936001e+12  # for tmp.out

  w=1000000;  # width of the bins 

  for(i=min;i<=max;i+=w){  # loop on the bins
    tab[(i+(w/2))]=0  # initialisation
    popnr[(i+(w/2))]=0
    sumidusr[(i+(w/2))]=0    
  }

}

{
  for(i=min;i<=max;i+=w){ 
    if(i<=$2 && $2<(i+w)){ # check if the data is included in the bin limited  by i and i+w
      tab[(i+(w/2))]++   # increment the number of data in the specific bin
      if (dejavu[(i+(w/2)),$1]==0){  # check if the userid belonging to the bin ((i+(w/2))) is the first time
        popnr[(i+(w/2))]++ # increment if it's the first time
        sumidusr[(i+(w/2))]+=$1
        dejavu[(i+(w/2)),$1]=1 # change the "boolean" dejavu
      }
      break
    }
  }
}

END{
 
  for(i=min;i<=max;i+=w){ 
    print i,"\t"i+w,"\t" (i+(w/2)),"\t"tab[(i+(w/2))],"\t",popnr[(i+(w/2))],"\t"sumidusr[(i+(w/2))]
  }

}
