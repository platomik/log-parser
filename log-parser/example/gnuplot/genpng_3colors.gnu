DIR = "../log/"
FILEEXT = ".bin.gnu"
FILENAME = "log-5minoff-zero"

unset key
set tic scale 0
set view map

# color range
theta(x) = x<0 ? 0 : 1
r(x) = (1-theta(x-0.001))
# 3 colors
g(x) = theta(x-0.001)*(1-theta(x-0.999))
b(x) = 0
set palette model RGB functions r(gray),g(gray),b(gray)

# total columns
set xrange [0:31]
# total rows
set yrange [0:31]

set xrange [-0.5:31.5]
set yrange [-0.5:31.5]

set title "Heat Map generated from a file ".FILENAME
splot DIR.FILENAME.FILEEXT matrix with image
