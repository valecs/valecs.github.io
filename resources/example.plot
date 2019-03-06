#!/usr/bin/env gnuplot
#
# Example Gnuplot script, vale@brown.edu
#
# depends: example.dat
# writes: example.eps
#
# You can always find help for Gnuplot by issuing the help command.
# This is a script for gnuplot! You can envoke it in a varety of ways:
#
# % ./example.plot
# % gnuplot example.plot
# % gnuplot
# gnuplot> load "example.plot"
#
# In the last example, we run the gnuplot program and then interpret
# the contents of this file. You can even type the commands line-by-line.

# sets the output to a 3.50" x 2.62" eps file 'enhanced' allows us to use
# symbols in titles. e.g: a_0 will be typeset with a subscripted 0.
set terminal postscript eps size 3.5,2.62 enhanced color
set output 'example.eps'

# uncomment this line to use an interactive terminal instead. you'll
# need to comment out the above terminal/output commands too
#set terminal qt

# variables for use later
labelFont = "Times New Roman, 14" 
ticFont = "Times New Roman, 12" 

# font specifications for all labels and ticmarks.
# cb refers to the color bar
set xlabel font labelFont; set xtics font ticFont
set ylabel font labelFont; set ytics font ticFont
set zlabel font labelFont; set ztics font ticFont
set cblabel font labelFont; set cbtics font ticFont

set border linewidth 2 # borders of field
set ticslevel 0 # unifies the origin of x,y,z if plotting in 3D
set nokey # turns off legend

# working in the (H)ue (S)aturation (V)alue colorspace; RGB and others are
# possible
set palette model HSV
# these entries have the format C1 H1 S1 V1, C2 H2 S2 V2, ... where Ci is
# the value on the color scale. The color bar will interpolate between values
# smoothly.
set palette defined (\
     -0.010 .040 1.00 .70\
    , -0.0010 .040 .600 .94\
    , -0.00001 .040 .400 .99\
    , 0.000 .000 .000 .80\
    , 0.00001 .600 .400 .94\
    , 0.0010 .600 .600 .81\
    , 0.010 .600 1.00 .68\
)

set xrange[-15:15]
set yrange[-15:15]
set cbrange[-0.01:0.01]

# for many commands, an offset can be specified by appending 
# offset x,y,z like so set zlabel "z / a_0" offset 1,1,0
set xlabel "y / a_0" 
set ylabel "x / a_0"
set zlabel "z / a_0" offset 1,-1,0
set cblabel "| F_{H^{r}} | / (E_H/a_0)" offset -1,0,0

datafile = "example.dat"

set title "Roaming Region Points (Force and Distance Classified)" font labelFont
# the 'using' keyword allows us to select which columns to plot, separted by :
# (it's not a range operator)
plot datafile using 2:1:4 with points palette pointtype 7 pointsize .3

#switch to qt output for a 3D plot
unset output
set terminal qt
splot datafile; pause 5 # very basic plotting; selects colums 1-3 by default
splot datafile with points palette pointtype 7 pointsize .4 # getting fancy
pause -1 "press return to exit"

# You can plot multiple objects with successive calls to replot; see help replot.