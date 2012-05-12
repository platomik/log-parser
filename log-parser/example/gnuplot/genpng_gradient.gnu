set title "Heat Map generated from a file log-5minoff-zero.bin.gnu"

unset key
set tic scale 0
set view map

# color range
#set cbrange [0:1]
set palette rgbformula -7,2,-7

# total columns
set xrange [0:31]
# total rows
set yrange [0:31]

set xrange [-0.5:31.5]
set yrange [-0.5:31.5]

splot "../log/log-5minoff-zero.bin.gnu" matrix with image
