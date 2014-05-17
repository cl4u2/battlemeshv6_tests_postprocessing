#!/usr/bin/gnuplot

set terminal png notransparent truecolor large enhanced font DejaVuSansMono 16 size 1024,768;

set output 'out.png';

set title 'Netperf Throughput Test 0'
set ylabel 'throughput (Kbps)';
set xlabel 'time (s)';
#set xtics 5
set grid xtics ytics mytics;

#set tmargin 1
#set bmargin 2
#set lmargin 5
#set rmargin 1

#set xrange [0:50] 


#set style fill transparent solid 0.5

timemin1=`head -n 1 data/netperfdata2.batadv.throughput | awk '{print $1}'`
#timemin1=0

plot \
 'data/netperfdata2.babel.throughput'  using ($1-timemin1):2 title 'Babel'           with linespoints linewidth 2,\
 'data/netperfdata2.batadv.throughput' using ($1-timemin1):2 title 'BATMAN Advanced' with linespoints linewidth 2,\
 'data/netperfdata2.bmx6.throughput'   using ($1-timemin1):2 title 'BMX6'            with linespoints linewidth 2,\
 'data/netperfdata2.olsr.throughput'   using ($1-timemin1):2 title 'OLSR'            with linespoints linewidth 2;

#set xrange [GPVAL_X_MIN:GPVAL_X_MAX] 
#set yrange [GPVAL_Y_MIN:GPVAL_Y_MAX * 4/5] 

# 'data/netperfdata2.babel.throughput'  using ($1-timemin1):2 notitle with points linewidth 2 linecolor 1,\
# 'data/netperfdata2.batadv.throughput' using ($1-timemin1):2 notitle with points linewidth 2 linecolor 2,\
# 'data/netperfdata2.bmx6.throughput'   using ($1-timemin1):2 notitle with points linewidth 2 linecolor 3,\
# 'data/netperfdata2.olsr.throughput'   using ($1-timemin1):2 notitle with points linewidth 2 linecolor 4,\

