#!/bin/ksh
result=0
for line in $(cat input.txt)
do
    linenum=''
    findnum=''
    i=0
    while (( i <= ${#line} ))
    do
        char=$(expr substr "$line" $i 1)
        if [[ -z $(print $char | tr -d '[:digit:]') ]]
        then
            linenum+=$char
            findnum=''
        else
            findnum+=$char
            case $findnum in 
                *one     ) linenum+=1;;
                *two     ) linenum+=2;;
                *three   ) linenum+=3;;
                *four    ) linenum+=4;;
                *five    ) linenum+=5;;
                *six     ) linenum+=6;;
                *seven   ) linenum+=7;;
                *eight   ) linenum+=8;;
                *nine    ) linenum+=9;;
                esac
        fi
        (( i += 1 ))
    done
    linetemp=${linenum:0:1} 
    linetemp+=${linenum: -1}
    (( result+=linetemp ))
done
echo $result