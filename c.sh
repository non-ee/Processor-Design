FILE="$HOME/riscv-ex/"

[ "$1" = "bitcnts" -o "$1" = "dijkstra" -o "$1" = "stringsearch" ] && { FILE+="MiBench/"; } || { FILE+="c/"; } 
[ "$2" = "x" ] && { FILE+="$1"; } || { FILE+="$1/$2"; }

make -C $FILE clean
make -C $FILE OPTIMIZE=$3

[ -d $FILE ] && { cp "$FILE/Dmem.dat" .; cp "$FILE/Imem.dat" .; } || { echo "$FILE Not exist"; cd "$FILE"; } 
