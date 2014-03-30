TIME=$(date +"%Y-%m-%d_%H%M%S")
OUT=out_$TIME.jpg
if [ $3 ]; then
    OUT=$3
fi

type convert > /dev/null 2>&1 || { echo "Please, run:
sudo apt-get install imagemagick"; exit 1;}

H1=$(identify -format "%h" "$1")
H2=$(identify -format "%h" "$2")
HDIM=$(echo -e "$H1\n$H2" | sort -rn | tail -1)

montage $1 $2 -mode concatenate -rotate "90>" -resize x$HDIM $OUT
