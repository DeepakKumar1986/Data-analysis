set term pngcairo color enhanced size 1500,1500 font "arial,14"
set title " Distribution/Trend analysis, Time-frame vs Space used on the server"
set output "plot7.png"
set style data histogram
set style histogram cluster gap 0
set style fill solid 1.00 border 0
set style line 1 pt 1 ps 2 lt 1 lw 2 lc rgb "black"
set grid ytics lt 0 lw 2 lc rgb "#bbbbbb"
set grid xtics lt 0 lw 2 lc rgb "#bbbbbb"
set xtic rotate by -90 scale 0 font ",12"
set key
set xlabel "Time frame"
set ylabel "Space used (assuming in MB, converted to GB)"
set boxwidth 0.9
xoffset=0.17
yoffset=0.01 
plot 'histo-realtime-space.dat' using 4:xtic(1) title 'Histogram' smooth frequency with histograms, '' using 0:4:4 with labels left offset first xoffset+0.1,graph yoffset rotate by 90 notitle, '' using 4:xtic(1) title "Linespoints" with lp ls 1
 #'' using 0:3:3 title 'Box errorbars' with boxerrorbars linetype 2,


