#!/bin/bash

# For loop — iterasi list
for NAMA in Alice Bob Charlie; do
    echo "Halo, $NAMA!"
done

# For loop — range angka
for i in {1..5}; do
    echo "Iterasi ke-$i"
done

# While loop
COUNTER=1
while [ $COUNTER -le 5 ]; do
    echo "Counter: $COUNTER"
    COUNTER=$((COUNTER + 1))
done

# Loop folder/file
for FILE in ~/devops-projects/phase1/*.sh; do
    echo "Script ditemukan: $FILE"
done

