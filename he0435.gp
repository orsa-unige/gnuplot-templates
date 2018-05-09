#!/usr/bin/gnuplot

load './common.gp'

file="he0435" # name of output file

ys=600

set term x11 1 # default terminal
set terminal svg size xs,ys enhanced fname fontname fsize fontsize  # svg terminal with options
set output './'.file.'.svg'

# set title file
set title "HE0435 light curves"

f1='./he0435.dat' # name of input file

set key top right

# This is useful to draw a background rectangle on the screen.  Look
# at the mixed use of the coordinate system: "from x1,x2 to y1,y2".
# - x1 and y1 are coordinates of the plot ("st" and "en" are MJDs);
# - y2 and y2 are coordinates of the graph("0" and "1" are bottom and
#   top of the graph) 

#set obj rect from st, graph 0 to en, graph 1 fc rgb 'gray' fs noborder behind

############## Light curves ################
############################################

set yrange [] reverse

set xlabel 'MJD - 245000.0'
set ylabel 'm_{V}'
set xtics  100

tda=0.01 # time delay of C with respect to A (in days)

pss=0.5
ptt=7 # 7=filled circle, 8=square, 9=filled square etc etc

plot f1 u ($1-mj0):3:4 with yerrorbars pt 5 ps pss lc rgb c1 title 'A', \
     f1 u ($1-mj0):5:6 w yerr pointtype ptt ps pss lc rgb 'orange' tit 'B',\
     f1 u ($1-mj0-tda):7:8 w yerr pt 9 pointsize pss lc rgb c3  tit 'C', \
     f1 u ($1-mj0):($9+0.01):10 w yerr pt 11 ps pss linecolor rgb c4 tit 'D'

############################################

set term x11 1 # Resetting the default terminal
replot # And replot. Without this, the SVG is not written (maybe a bug)

# If you have inkscape installed, you can call it as external program
# (using the ! before the command) and you can use it to convert the
# SVG in a PDF ready for your LaTeX document.

!inkscape ./@file.svg --export-pdf=../@file.pdf # creating pdf from svg using inkscape

# At the end of the story, you plot it 3 times:
# - on the default terminal for a quick inspection and zoom
# - on an SVG file for a manual inkscape editing or for the web
# - on a PDF file for LaTeX or to have something that printers love.

reset