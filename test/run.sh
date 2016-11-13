#!/bin/sh

SRC_DIRECTORY=src
DIST_DIRECTORY=dist
DATE=`date +%Y-%m-%d\_%H\-%M\-%S`

mkdir -p $DIST_DIRECTORY

for algo in webpack-default webpack-md5-hash webpack-chunk-hash
	do
		for t in {1..3}
			do
				mkdir -p "$SRC_DIRECTORY/current-testcase"
				mkdir -p "$DIST_DIRECTORY/current-dist"
				rsync -av "$SRC_DIRECTORY/testcase-$t/" "$SRC_DIRECTORY/current-testcase"

				TESTING=true webpack --progress --profile --colors --config "webpack.config.$algo.js"

				mkdir -p "$DIST_DIRECTORY/$DATE/src"
				mkdir -p "$DIST_DIRECTORY/$DATE/dist/$algo/testcase-$t"
				cp webpack.config.js "$DIST_DIRECTORY/$DATE/"
				cp webpack.config.$algo.js "$DIST_DIRECTORY/$DATE/"
				rsync -av "$SRC_DIRECTORY/testcase-$t/" "$DIST_DIRECTORY/$DATE/src/"
				rsync -av "$DIST_DIRECTORY/current-dist/" "$DIST_DIRECTORY/$DATE/dist/$algo/testcase-$t"

				rm -rf "$SRC_DIRECTORY/current-testcase"
				rm -rf "$DIST_DIRECTORY/current-dist"
			done
	done