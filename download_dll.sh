#!/bin/sh
echo "This script is downloading binaries of tnt_odbc.dll"
echo "whithout version control. Please, check that."
wget -nv https://github.com/tarantool/tarantool-c/releases/download/tnt_odbc-win-x64/tnt_odbc.dll \
 -O DriverSource/64.tnt_odbc.dll && \
 wget -nv https://github.com/tarantool/tarantool-c/releases/download/tnt_odbc-win-x86/tnt_odbc.dll \
 -O DriverSource/32.tnt_odbc.dll
