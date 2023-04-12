#!/bin/bash

# Скрипт для создания списка зависимостей
# Script for creating a list of dependencies

ListName="ListDependencies.txt"
AllFiles="AllFiles.txt"

for file in `find ./ -type f -name "*"`
do
    objdump -p $file | grep NEEDED | sed 's|.* ||' >> $ListName
done

find ./ -type f -name "*" | sed 's|.*/||' > $AllFiles
grep -v -f $AllFiles $ListName > $ListName.tmp; mv -f $ListName.tmp $ListName
sort -u $ListName > $ListName.tmp; mv -f $ListName.tmp $ListName

rm -f $AllFiles

exit 0

