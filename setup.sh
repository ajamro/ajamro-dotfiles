#!/bin/bash
SRC=$(dirname $(readlink -f "$0"))
DST=$HOME
REL=$(perl -MFile::Spec -e 'print File::Spec->abs2rel("'$SRC'","'$DST'")')

echo "installing dot files..."
echo "source directory: $SRC"
echo "target directory: $DST"
echo

pushd "$DST"
for filename in $REL/.[a-z0-9A-Z]*
do
	[[ $filename =~ $REL/.git.* ]] && continue
	# [ -e "$REL/$filename" ] && rm -R "$REL/$filename"
	echo ln -sf "$filename" "."
	ln -sf "$filename" "."
done
popd
