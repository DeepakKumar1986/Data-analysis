#!/bin/awk

BEGIN{
  min=1.428476519062e+12;  # lower bound of data (2nd column); 
  max=1.428562936001e+12;  # upper bound of data (2nd column); 
  w=1000000;  # width of the bins 

  for(i=min;i<=max;i+=w){  # loop on the bins
    tab[(i+(i+w)/2)]=0  # initialisation
  }

}

{
  for(i=min;i<=max;i+=w){ 
    if(i<=$2 && $2<(i+w)){ # check if the data is included in the bin limited  by i and i+w
      tab[(i+(i+w)/2)]++   # increment the number of data in the specific bin
      break
    }
  }
}

END{
 
  for(i=min;i<=max;i+=w){ 
    print i,"\t"i+w,"\t"tab[(i+(i+w)/2)]    
  }

}
