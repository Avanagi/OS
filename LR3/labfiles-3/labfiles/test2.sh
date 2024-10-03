#!/bin/bash

SUBJECTS=("Уфология" "Пивоварение")
DIRS=("Уфология/tests" "Пивоварение/tests")
STUDENT="GorelovRA"

for i in "${!SUBJECTS[@]}"; do
  TESTS_DIR="${DIRS[$i]}"
  
  for test_file in "$TESTS_DIR"/TEST-*; do
    echo "Обработка файла $test_file"
    
    last_attempt=$(grep "$STUDENT" "$test_file" | tail -n 1)
    modified_attempt=$(echo "$last_attempt" | sed 's/[0-9]*$/5/')
    
    sed -i "s|$last_attempt|$modified_attempt|" "$test_file"
    
    echo "Исправлена строка: $last_attempt -> $modified_attempt"
  done
done

echo "Оценки для $STUDENT были исправлены во всех тестах."
