#!/usr/bin/gnuplot

load './common.gp'

file="um673" # name of output file

set term x11 1 # default terminal
set terminal svg size xs,ys enhanced fname fontname fsize fontsize  # svg terminal with options
set output './'.file.'.svg' #

# set title file
set title 'UM673 light curve'

f1='./um673.dat'

gi = 18.72 # USNO-NOMAD magnitude of the galaxy in the different bands
gr = 19.35
gv = 20.81

set xrange [4650:5900]
set yrange[15.8:21.5] reverse
set xlabel 'MJD - 50000'
set ylabel 'mag'

set label  "A component" at first 5250, first 16.2
set label  "B component" at first 5250, first 18.8
set label  "(B+G)+2.0 component" at first 5200, first 20.1
set label  "2008" at first 4700, first 17.8
set label  "2009" at first 5050, first 17.8
set label  "2010" at first 5320, first 17.8
set label  "2011" at first 5670, first 17.8

set label  "i" at first 5000, first 16.3
set label  "R" at first 5000, first 16.6
set label  "V" at first 5000, first 16.9

#set label "difference imaging" at graph 0.40, graph 0.9

############## Light curves ################
############################################

pss=0.5

plot f1 using ($1-mj1):2 index 0:3 with points pt 5 ps pss lw 1 lt 1 lc rgb c1 title "i filter", \
     f1 using ($4-mj1):5 index 0:3 w p pointtype 7 ps pss lw 1 lt 1 lc rgb c2  tit "R filter", \
     f1 using ($7-mj1):8 index 0:3 w p pt 9 ps pss linewidth 1 lt 1 lc rgb c3 tit "V filter", \
     f1 using ($1-mj1):3 index 0:3 w p pt 4 ps pss lw 1 linetype 1 lc rgb c1  notit "B", \
     f1 using ($4-mj1):6 index 0:3 w p pt 6 ps pss lw 1 lt 1 linecolor rgb c2 notit "B", \
     f1 using ($7-mj1):9 index 0:3 w p pt 8 pointsize pss lw 1 lt 1 lc rgb c3 notit "B", \
     f1 using ($1-mj1):($3+2) index 4:7 w p pt 4 ps pss lw 1 lt 1 lc rgb c1 notit "B+G", \
     f1 using ($4-mj1):($6+2) index 4:7 w p pt 6 ps pss lw 1 lt 1 lc rgb c2 notit "B+G", \
     f1 using ($7-mj1):($9+2) index 4:7 w p pt 8 ps pss lw 1 lt 1 lc rgb c3 notit "B+G"#, \

############################################

set term x11 1
replot

#!inkscape ./@f1.svg --export-pdf=../@file.pdf # creating pdf from svg using inkscape

reset
