# gnuplot-templates
Templates to plot with gnuplot

This is to provide useful template to plot astronomical data with gnuplot.

It is based on a `common.gp` gnuplot file containing all the information that normally are repeated, and on some example of light curves.


You can call this file from the terminal by launching

    gnuplot

and after telling to the prompt:

    load plot-template-residuals.gp

Alternatively, you can open it in emacs and launching it with `C-c-b` if you installed `gnuplot-mode`.

A good practice is to plot in an X11 window and to create at the same time an `svg` file that can be edited, if needed, with a program such as Inkscape.


If you have inkscape installed, you can call it as external program (using the ! before the command) and you can use it to convert the SVG in a PDF ready for your LaTeX document.

    !inkscape ./@file.svg --export-pdf=../@file.pdf # creating pdf from svg using inkscape

Long story short, you plot it 3 times:
 - on the default terminal for a quick inspection and zoom
 - on an SVG file for a manual inkscape editing or for the web
 - on a PDF file for LaTeX or to have something that printers love.

Good references:

The official website:
 - http://gnuplot.sourceforge.net/demo/
Very common search:
 - https://stackoverflow.com/questions/14946530/loop-structure-inside-gnuplot
The best tutorial: 
 - http://folk.uio.no/inf3330/scripting/doc/gnuplot/Kawano/intro/basic-e.html
 
 
