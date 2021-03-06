#!/bin/bash

function extract() {
    for FILE in `egrep -v '(^#|^$)' $1`; do
        OLDIFS=$IFS IFS=":" PARSING_ARRAY=($FILE) IFS=$OLDIFS
        FILE=`echo ${PARSING_ARRAY[0]} | sed -e "s/^-//g"`
        DEST=${PARSING_ARRAY[1]}
        if [ -z $DEST ]; then
            DEST=$FILE
        fi
	cd /home/louis/WORK/AOSPARADOX_FALCON/
	cd $FILE
	git fetch caf LA.BF.1.1.3_rb1.12
	git fetch aosparadox bacon-par-6.0
	git reset --hard aosparadox/bacon-par-6.0
	git checkout -b backup/09042016/bacon-par-6.0
	git push aosparadox backup/09042016/bacon-par-6.0
	git reset --hard caf/LA.BF.1.1.3_rb1.12
	git branch -D bacon-par-6.0
	git checkout -b bacon-par-6.0
	git branch -D backup/09042016/bacon-par-6.0
	cd /home/louis/WORK/AOSPARADOX_FALCON/
    done
}

extract bacon-par-6.0-path-list
