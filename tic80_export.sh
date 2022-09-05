if ! [ -x "$(command -v luacc)" ]; then
 echo "luacc is not installed. try:"
 echo "luarocks install luacc"
 exit
fi

if [ ! -f $1.lua ]; then
 echo "Cannot find $1.lua."
 exit
fi

echo "Including files from ./${1} and ./lib"
includes_project=$(find $1 -name '*.lua' | tr '\n' ' ')
includes_lib=$(find lib -name '*.lua' | tr '\n' ' ')

includes="${includes_project}${includes_lib}"
filtered=${includes//\.lua/""}
filtered=${filtered//\.//""}
echo "Including modules: ${filtered}"

luacc -o $1_export.lua -i ./ -p 6 $1 $filtered

if [ $? -eq 0 ]; then
 echo "OK"
fi
