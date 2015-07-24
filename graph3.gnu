set term pngcairo color enhanced size 1500,1500 font "arial,14"
set output "plot6.png"
set title "Linear Regression analysis between actions performed and Users"
set style data histogram
set style histogram cluster gap 1
set style fill solid 1.00 border 0
set grid ytics lt 0 lw 2 lc rgb "#bbbbbb"
set grid xtics lt 0 lw 2 lc rgb "#bbbbbb"
set xtic rotate by -90 scale 0 font ",12"
set xlabel "Users"
set ylabel "Actions"
set boxwidth 0.9
#plot 'count-user-scatter.dat' using 1:xtic(2) title 'Scatter plot' with points, '' using 1:xtic(2) title "Linespoints" with lp ls 1 
f(x) = m*x + b
fit f(x) 'count-user-scatter.dat' using 2:1 via m,b
plot f(x) title 'Line Fit', \
 'count-user-scatter.dat' using 2:1 title 'Scatter plot' with points, '' using 2:1 title "Linespoints" with lp ls 1
