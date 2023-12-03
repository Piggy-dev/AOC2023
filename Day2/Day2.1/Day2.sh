#!/bin/ksh
linetemp=''
id=''
total=0
EOG=0
for line in $(cat input.txt)
do
    if [[ $linetemp = "Game" ]]
    then
        id=$(print $line | tr -d -c 0-9)
        numred=0
        numblue=0
        numgreen=0
        EOG=0
    fi
    if [[ ($line = "red"*) && ($linetemp -gt $numred) ]]
    then
        numred=$linetemp
    fi
    if [[ ($line = "green"*) && ($linetemp -gt $numgreen)]]
    then
        numgreen=$linetemp
    fi
    if [[ ($line = "blue"*) && ($linetemp -gt $numblue)]]
    then
        numblue=$linetemp
    fi
    if [[ ($line = "green") || ($line = "blue") || ($line = "red") ]]
    then
        EOG=1
    fi
    if [[ ($numred -le 12) && ($numgreen -le 13) && ($numblue -le 14) && ($EOG = 1) ]]
    then
        (( total+=id ))
        EOG=0
    fi
    linetemp=$line
done
print $total