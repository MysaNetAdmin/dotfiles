#!/bin/sh

filename=Makefile

if [ -e $filename ] ; then
  echo "A Makefile already exists" >&2
  exit 1
fi

exe=main

if [ $# -eq 1 ]; then
    exe=$1
fi

echo "CXX= clang++" >> $filename
echo "CXXLAGS= -Wall -Wextra -Werror -pedantic -std=c++17 -fsanitize=address" >> $filename
echo "LDLIBS= asan" >> $filename
echo "" >> $filename

SRC=""

for file in *.cc ; do
  if [ -f $file ] ; then
    SRC+=" $file"
  fi
done

echo "SRC=$SRC" >> $filename
echo "OBJ= \${SRC:.cc=.o}" >> $filename
echo "EXEC= $exe" >> $filename
echo "" >> $filename

echo "all: \${EXEC}" >> $filename
echo "" >> $filename

echo "\${EXEC}: \${OBJ}" >> $filename
echo -e "\t\${CXX} \${CXXFLAGS} \$^ -o \$@" >> $filename
echo "" >> $filename

echo "clean:" >> $filename
echo -e "\t\${RM} \${OBJ} \${EXEC}" >> $filename
echo "" >> $filename

echo ".PHONY: all clean" >> $filename

echo "Makefile generation complete !"
