#!/bin/bash
if [ $# -ne 1 ]; then
	echo "Copy the karabiner config to a certain directory."
	echo "The old karabiner config is backed up."
	echo "Usage: `basename $0` /Users/kevin"
	exit 1
fi

DEST=$1
CWD=$(pwd)
TMPDIR=$(mktemp -d)

mkdir -p ${DEST}

if [ -f "${DEST}/.config/karabiner/karabiner.json" ]; then
	mv ${DEST}/.config/karabiner/karabiner.json ${TMPDIR}/karabiner-jon
fi

if [ -d "${DEST}/.config/karabiner/assets" ]; then
	mv ${DEST}/.config/karabiner/assets ${TMPDIR}/karabiner-assets
fi

ln -s ${CWD}/assets ${DEST}/.config/karabiner/assets
ln -s ${CWD}/karabiner.json ${DEST}/.config/karabiner/karabiner.json

echo "Copied files to ${DEST}/."
echo "Backup is in ${TMPDIR}"
echo "NOTE: Karabiner ignores the main karabiner.json symlink (while writing config)"
exit 0
