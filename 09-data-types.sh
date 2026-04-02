NUMBER1=100
NUMBER2=200
NUMBER3=DevSecOps

SUM=$((NUMBER1+NUMBER2+NUMBER3))

echo "Total sum=$SUM" #Total sum will become 300. Beacuse that number3 will become as '0'. In shell script everything considered as a string.

PLAYERS=("ViratKohli" "KLR" "SIRAJ")

echo "All Players:${PLAYERS[@]}"

echo "The First Player:${PLAYERS[0]}"

