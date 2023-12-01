#!/bin/ksh
result=0
filename='input.txt'
while read line;
do
linetemp=$(echo "$line" | tr -d -c 0-9)
if [ $(echo $linetemp | wc -c) -gt 3 ]
    then
    linetemp2=${linetemp:0:1} 
    linetemp2+=${linetemp: -1}
    linetemp=$linetemp2
elif [ $(echo $linetemp | wc -c) -eq 2 ]
    then
    linetemp2=${linetemp:0:1} 
    linetemp2+=${linetemp: -1}
    linetemp=$linetemp2
fi
(( result+=linetemp ))
done < $filename
echo "$result"