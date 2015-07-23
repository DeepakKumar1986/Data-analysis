set term pngcairo color enhanced size 1500,1500 font "arial,14"
set output "plot4.png"
set title "Actions performed in a time period"
set style data histogram
set style histogram cluster gap 1
set style fill solid 1.00 border 0
set xtic rotate by -90 scale 0 font ",12"
set xlabel "Action"
set ylabel "Number of occurences"
xoffset=0.17
yoffset=0.01
set boxwidth 0.9
plot 'count-actions4.dat' using 2:xtic(1) title 'Bars' smooth frequency with histograms, '' using 0:2:2 with labels left offset first xoffset-0.2,graph yoffset rotate by 90 notitle
