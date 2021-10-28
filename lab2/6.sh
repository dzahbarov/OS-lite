#!/bin/bash
maxSizeInPages=-3
pidOfMax=-1
for PID in `ps -ax -o pid --no-headers`
do
sizeInPages=`awk '{printf $1}' /proc/$PID/statm`
if (( $sizeInPages >= $maxSizeInPages ));
then
maxSizeInPages=$sizeInPages
pidOfMax=$PID
fi
done;
echo "My result: $pidOfMax" 
echo "Top result: `top -n1 -bo +%MEM | sed 1,7d | head -1 | awk '{print $1}'`"
