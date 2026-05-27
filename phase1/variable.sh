#!/bin/bash

# Deklarasi variabel (tidak ada spasi di sekitar =)
NAMA="Glearn"
UMUR=25
HARI=$(date +%A)        # ambil output dari command

# Pakai variabel
echo "Nama: $NAMA"
echo "Umur: $UMUR tahun"
echo "Hari ini: $HARI"

# Variabel spesial
echo "Nama script: $0"
echo "Argumen 1: $1"        # ./script.sh argumen1
echo "Semua argumen: $@"
echo "Jumlah argumen: $#"
