#!/usr/bin/gnuplot

set terminal png notransparent truecolor large enhanced font DejaVuSansMono 10 size 1024,768;

set output 'out.png';

set title 'Random Ping Test 1'
set ylabel 'Average RTT (ms)';
set xlabel 'Routing Protocols';
#set xtics 5
#set grid xtics ytics mytics;
set grid ytics mytics;

#set tmargin 1
#set bmargin 2
#set lmargin 5
#set rmargin 5
set offset graph 0.1, 0.1

set yrange [0:60] 


set style data boxplot
set style boxplot nooutliers pointtype 7
set boxwidth 0.5
set xtics ("Babel" 1, "BATMAN Advanced" 2, "BMX6" 3, "OLSR" 4) scale 0.0
set pointsize 3.0
set style fill transparent solid 0.05

#timemin1=`head -n 1 data/badv.txt | awk '{print $2}'`
#timemin1=0

plot \
 'data/allpings_babel.txt'    using (1):2 notitle ls 2 lc 1 lw 2,\
 'data/allpings_batadv.txt'   using (2):2 notitle ls 2 lc 2 lw 2,\
 'data/allpings_olsr.txt'     using (3):2 notitle ls 2 lc 3 lw 2,\
 'data/allpings_bmx6.txt'     using (4):2 notitle ls 2 lc 4 lw 2;

#plot \
# 'data/babel.txt'  using (1):5 notitle ls 2 lc 1,\
# 'data/badv.txt'   using (2):5 notitle ls 2 lc 2,\
# 'data/olsr.txt'   using (3):5 notitle ls 2 lc 3,\
# 'data/bmx6.txt'   using (4):5 notitle ls 2 lc 4;

#plot \
# 'data/babel.txt'  using (1):5 notitle ls 2 lc 1,\
# 'data/badv.txt'   using (2):5 notitle ls 2 lc 2,\
# 'data/olsr.txt'   using (3):5 notitle ls 2 lc 3,\
# 'data/bmx6.txt'   using (4):5 notitle ls 2 lc 4; 

#plot \
# 'data/babel.txt'  using (1):5:4:6 notitle with errorbars,\
# 'data/badv.txt'   using (2):5:4:6 notitle with errorbars,\
# 'data/olsr.txt'   using (3):5:4:6 notitle with errorbars,\
# 'data/bmx6.txt'   using (4):5:4:6 notitle with errorbars; 
 
#plot \
# 'data/babel.txt'  using ($2-timemin1):5   title 'Babel Average'           with linespoints linewidth 2 linecolor 1,\
# 'data/badv.txt'   using ($2-timemin1):5   title 'BATMAN Advanced Average' with linespoints linewidth 2 linecolor 2,\
# 'data/bmx6.txt'   using ($2-timemin1):5   title 'BMX6 Average'            with linespoints linewidth 2 linecolor 3,\
# 'data/olsr.txt'   using ($2-timemin1):5   title 'OLSR Average'            with linespoints linewidth 2 linecolor 4,\
# 'data/babel.txt'  using ($2-timemin1):6:4 title 'Babel Max'               with filledcurve linewidth 2 linecolor 1,\
# 'data/badv.txt'   using ($2-timemin1):6:4 title 'BATMAN Advanced Max'     with filledcurve linewidth 2 linecolor 2,\
# 'data/bmx6.txt'   using ($2-timemin1):6:4 title 'BMX6 Max'                with filledcurve linewidth 2 linecolor 3,\
# 'data/olsr.txt'   using ($2-timemin1):6:4 title 'OLSR Max'                with filledcurve linewidth 2 linecolor 4;

# 'data/babel.txt'  using ($2-timemin1):5   title 'Babel Average'           ,\
# 'data/badv.txt'   using 5   title 'BATMAN Advanced Average' ,\
# 'data/bmx6.txt'   using 5   title 'BMX6 Average'            ,\
# 'data/olsr.txt'   using 5   title 'OLSR Average'            ;

# 'data/babel.txt'  using ($2-timemin1):5   title 'Babel Average'           with linespoints linewidth 2 linecolor 1,\
# 'data/badv.txt'   using ($2-timemin1):5   title 'BATMAN Advanced Average' with linespoints linewidth 2 linecolor 2,\
# 'data/bmx6.txt'   using ($2-timemin1):5   title 'BMX6 Average'            with linespoints linewidth 2 linecolor 3,\
# 'data/olsr.txt'   using ($2-timemin1):5   title 'OLSR Average'            with linespoints linewidth 2 linecolor 4,\
# 'data/babel.txt'  using ($2-timemin1):6:4 title 'Babel Max'               with filledcurve linewidth 2 linecolor 1,\
# 'data/badv.txt'   using ($2-timemin1):6:4 title 'BATMAN Advanced Max'     with filledcurve linewidth 2 linecolor 2,\
# 'data/bmx6.txt'   using ($2-timemin1):6:4 title 'BMX6 Max'                with filledcurve linewidth 2 linecolor 3,\
# 'data/olsr.txt'   using ($2-timemin1):6:4 title 'OLSR Max'                with filledcurve linewidth 2 linecolor 4;

# 'data/babel.txt'  using ($2-timemin1):4 title 'Babel Min'           with filledcurve linewidth 2,\
# 'data/badv.txt'   using ($2-timemin1):4 title 'BATMAN Advanced Min' with filledcurve linewidth 2,\
# 'data/bmx6.txt'   using ($2-timemin1):4 title 'BMX6 Min'            with filledcurve linewidth 2,\
# 'data/olsr.txt'   using ($2-timemin1):4 title 'OLSR Min'            with filledcurve linewidth 2,\
# 'data/babel.txt'  using ($2-timemin1):6 title 'Babel Max'           with filledcurve linewidth 2,\
# 'data/badv.txt'   using ($2-timemin1):6 title 'BATMAN Advanced Max' with filledcurve linewidth 2,\
# 'data/bmx6.txt'   using ($2-timemin1):6 title 'BMX6 Max'            with filledcurve linewidth 2,\
# 'data/olsr.txt'   using ($2-timemin1):6 title 'OLSR Max'            with filledcurve linewidth 2;

#plot \
# 'data/babel.txt'  using ($2-timemin1):4:6 title 'Babel Max'           with linespoints linewidth 2,\
# 'data/badv.txt'   using ($2-timemin1):4:6 title 'BATMAN Advanced Max' with linespoints linewidth 2,\
# 'data/bmx6.txt'   using ($2-timemin1):4:6 title 'BMX6 Max'            with linespoints linewidth 2,\
# 'data/olsr.txt'   using ($2-timemin1):4:6 title 'OLSR Max'            with linespoints linewidth 2;

#set xrange [GPVAL_X_MIN:GPVAL_X_MAX] 
#set yrange [GPVAL_Y_MIN:GPVAL_Y_MAX * 4/5] 

