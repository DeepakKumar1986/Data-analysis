set term pngcairo color enhanced size 1500,1500 font "arial,14"
set title "Comparision of Amino-Nucleotide interaction occurence in well and not-well discriminated natives"
set output 'interaction_well_notwell.png'
set style data histogram
set style histogram cluster gap 1
set style fill solid border -1
set xtic rotate by -90 scale 0 font ",12"
set xlabel "Interaction Pair"
set ylabel "Occurence"
fdat="c"

set boxwidth 0.9

p fdat us 2:xtic(1) ti "Well",\
  fdat us 3:xtic(1) ti "Not well"



#set xrange [0:]
#set xlabel "Amino acid"

#set style fill solid 0.8 border -1
#plot 'c' using 1:2 with boxes,\
 #    'c' using 1:3 with boxes
