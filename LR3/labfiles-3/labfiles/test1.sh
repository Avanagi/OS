#!/bin/bash

SUBJECTS=("Уфология" "Пивоварение")
DIRS=("Уфология/tests" "Пивоварение/tests")

for i in "${!SUBJECTS[@]}"; do
  SUBJECT="${SUBJECTS[$i]}"
  TESTS_DIR="${DIRS[$i]}"
  REPORT_FILE="${SUBJECT}_отчет_2024.txt"

  grep "^2024" $TESTS_DIR/TEST-* | \
  grep -E ",[3-5]$" | \
  sed 's/^\([^,]*,\)\([^,]*,\)\([^,]*\)-..,\([^,]*,\)\([^,]*\)$/\3,\2\5/' | \
  sort -t',' -k1,1 -k2,2 > $REPORT_FILE

  total_threes=$(grep -E "^202(2|3|4)" $TESTS_DIR/TEST-* | grep ",3$" | wc -l)

  echo -e "\nОбщее количество троек за 2022-2024 гг.: $total_threes" >> $REPORT_FILE

done
