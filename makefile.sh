#!/bin/sh

filename=Makefile

if [ -e $filename ] ; then
  echo "A Makefile already exists" >&2
  exit 1
fi

echo "CXX= g++" >> $filename
echo "CXXLAGS= -Wall -Wextra -Werror -pedantic -std=c++17" >> $filename
echo "" >> $filename

SRC=""

for file in *.cc ; do
  if [ -f $file ] ; then
    SRC+=" $file"
  fi
done

echo "SRC=$SRC" >> $filename
echo "OBJ= \${SRC:.cc=.o}" >> $filename
echo "EXEC= main" >> $filename
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
