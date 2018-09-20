#!/bin/sh

filename=Makefile

if [ -e $filename ] ; then
  echo "A Makefile already exists" >&2
  exit 1
fi

echo "CC= gcc" >> $filename
echo "CFLAGS= -Wall -Wextra -Werror -std=c99 -pedantic" >> $filename
echo "" >> $filename

SRC=""

for file in *.c ; do
  if [ -f $file ] ; then
    SRC+= " "
    SRC+="$file"
  fi
done

echo "SRC=$SRC" >> $filename
echo "OBJ= \${SRC:.c=.o}" >> $filename
echo "" >> $filename

echo "all: \${OBJ}" >> $filename
echo "" >> $filename

echo "clean:" >> $filename
echo -e "\t\${RM} \${OBJ}" >> $filename
echo "" >> $filename

echo ".PHONY: all clean" >> $filename
