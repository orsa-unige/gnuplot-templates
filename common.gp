#!/usr/bin/gnuplot  # This is to call externally the page, if needed

# You can call this file from the terminal by launching
#    gnuplot
# and after telling to the prompt:
#    load plot-template-residuals.gp
#
# Alternatively, you can open it in emacs and launching it with
#    C-c-b
# if you installed gnuplot-mode :)

set datafile missing "???" # this pattern is interpreted as missing data 
set border 3             # erasing top-right axes
set xtics nomirror       # erasing tics on the top axis
set ytics nomirror       # erasing tics on the right axis
unset key                # unset legend
#set key top right  # Legend position
#set pointsize 0.5 # Size of the points

set bar 0.0        # Width of the error bars
set xtics auto
set ytics auto

#set xlabel 'MJD - 2450000'
#set xlabel "Time to T_{mid} [d]"
set xlabel "Phase"

#set ylabel 'diff. magnitude'
#set yrange [] reverse  # To reverse the y axis, useful for magnitudes
set ylabel 'normalized flux'

#set obj rect from st, graph 0 to en, graph 1 fc rgb "#eeeeee" fs noborder behind

set macro # to pass @variable.pdf to inkscape

c1='steelblue'      # defining some color variable I like. Google "colorbrewer" for nice palettes 
c2='orange'
c3='#777777'
c4='#75507b'
c5='#cccccc'

#some array of stuff, useful in "for" loops
lclist=  c1." ".c2." ".c3." ".c4." ".c1." ".c2." ".c3." ".c4 # line color list
ptlist=  "5 7 9 11 4 6 8 10 13 14"                           # point type list

pss=0.2 # point size

mj0=2450000.0 # some useful variable for MJD, HJD etc...
mj1=49999.5

xs=600  # dimensions of the plot
ys=420
fontname='Bitstream Vera Sans'
fontsize=18
