awk -F, 'BEGIN { \
printf "\t\tData Ma\n\n" \
} ($4 ~ /Female/ && $6 > 30)  { kount++; tot+= $8  
 printf "%4d %-10s %-6s %-15s %2d %5d\n", kount,$2,$4,$5,$6,$8 } \
END { print "\tThe average salary would be:", tot/kount }' intfile.csv

