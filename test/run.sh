#!/bin/sh

OUTPUT_DIRECTORY=~/webpack-chunkhash-demo
mkdir -p dist

# Run various builds using default Webpack hash algorithm
# -------------------------------------------------------
git checkout master
npm run webpack-default
mkdir -p "$OUTPUT_DIRECTORY/webpack-default/master"
rsync -av . "$OUTPUT_DIRECTORY/webpack-default/master" --exclude node_modules

git checkout testcase-1
npm run webpack-default
mkdir -p "$OUTPUT_DIRECTORY/webpack-default/testcase-1"
rsync -av . "$OUTPUT_DIRECTORY/webpack-default/testcase-1" --exclude node_modules

git checkout testcase-2
npm run webpack-default
mkdir -p "$OUTPUT_DIRECTORY/webpack-default/testcase-2"
rsync -av . "$OUTPUT_DIRECTORY/webpack-default/testcase-2" --exclude node_modules

# Run various builds using webpack-md5-hash plugin
# ------------------------------------------------
git checkout master
npm run webpack-md5-hash
mkdir -p "$OUTPUT_DIRECTORY/webpack-md5-hash/master"
rsync -av . "$OUTPUT_DIRECTORY/webpack-md5-hash/master" --exclude node_modules

git checkout testcase-1
npm run webpack-md5-hash
mkdir -p "$OUTPUT_DIRECTORY/webpack-md5-hash/testcase-1"
rsync -av . "$OUTPUT_DIRECTORY/webpack-md5-hash/testcase-1" --exclude node_modules

git checkout testcase-2
npm run webpack-md5-hash
mkdir -p "$OUTPUT_DIRECTORY/webpack-md5-hash/testcase-2"
rsync -av . "$OUTPUT_DIRECTORY/webpack-md5-hash/testcase-2" --exclude node_modules

# Run various builds using webpack-chunk-hash plugin
# --------------------------------------------------
git checkout master
npm run webpack-chunk-hash
mkdir -p "$OUTPUT_DIRECTORY/webpack-chunk-hash/master"
rsync -av . "$OUTPUT_DIRECTORY/webpack-chunk-hash/master" --exclude node_modules

git checkout testcase-1
npm run webpack-chunk-hash
mkdir -p "$OUTPUT_DIRECTORY/webpack-chunk-hash/testcase-1"
rsync -av . "$OUTPUT_DIRECTORY/webpack-chunk-hash/testcase-1" --exclude node_modules

git checkout testcase-2
npm run webpack-chunk-hash
mkdir -p "$OUTPUT_DIRECTORY/webpack-chunk-hash/testcase-2"
rsync -av . "$OUTPUT_DIRECTORY/webpack-chunk-hash/testcase-2" --exclude node_modules
