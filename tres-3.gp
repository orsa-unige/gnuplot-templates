#!/usr/bin/gnuplot

load './common.gp'

file="tres-3" # name of output file

ys=800

set term x11 1 # default terminal
set terminal svg size xs,ys enhanced fname fontname fsize fontsize  # svg terminal with options
set output './'.file.'.svg' #

# set title file
set title "TrES-3b combined light curves and fit"

f1='./tres-3.dat' # name of input file

idx=7 # indices in ascii file

off=0.01 # offset

# pss=1 # overwrite point size: bigger is better if using X11 terminal

set multiplot # To start drawing multiple plots: one for the curves, the other for the residuals

############## Light curves ################
############################################
set origin 0, 0.3
set size 1, 0.7

set tmargin 2   # Margins
set bmargin 0   # This is crucial to stick the curve plot to the residual plot :)
set rmargin 2
set lmargin 10

set xlabel ""
unset xtics  # erase here but specify xrange!
set xrange [-0.09:0.099] 
set yrange [0.922:1.005]
set ytics auto #0.01

t1="V"
t2="R"
t3="Rc"
t4="I"
t5="Ic"
t6="z'"

tilist=  t1." ".t2." ".t3." ".t4." ".t5." ".t6 # title list

#Labels
do for [i=0:idx-1]{
  set label word(tilist,i+1) at graph 0.07,first 1.002-off*i 
}

plot for [i=0:idx-1] f1 u 1:($2-off*i):9 index i with yerrorbars pt 0+word(ptlist,i+1) ps pss lc rgb word(lclist,i+1) notit,\
     for [i=0:idx-1] f1 u 1:($5-off*i)   index i with lines lc rgb c3 notit#,\


################ Residuals #################
############################################
set origin 0, 0 # Let's go for the second plot: orgin (0,0= bottom left)
set size 1, 0.3 # and size (all in x, one third in y )

unset label # Cleaning the old labels
unset title # and title

set tmargin 0 # Now is the TOP margin=0 to stick with the upper plot!
set bmargin 3

set xtics 0.05 # Now I want BJD tics every 0.05 days 
#set xlabel "Time to T_{mid} [d]"
set xlabel "Phase"

set ytics 0.02
set yrange [-0.059:0.015] noreverse
set ylabel "residuals"

plot for [i=0:idx-1] f1 u 1:($6-off*i):9 index i w yerr pt 0+word(ptlist,i+1) ps pss lc rgb word(lclist,i+1),\
     for [i=0:idx-1] f1 u 1:( 0-off*i)   index i w l lc rgb c3 notit#,\

############################################

unset multiplot # End of the multiplot environment

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
