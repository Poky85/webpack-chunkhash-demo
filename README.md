# webpack-chunkhash-demo
Simple demo to test various Webpack algorithms for chunks hashing

## Purpose
It's not easy to create Webpack configuration that combines long-term caching and code splitting working side-by-side.

## Requirements
1. Cache output chunks as long as possible using Webpack's hashing feature (https://webpack.github.io/docs/long-term-caching.html).
2. Given chunk's hash should stay the same if output chunk does not change.
3. If any change in output chunk occurs then chunk's hash must change. Otherwise long-term caching would break things.

This demo reflects some hashing issues found. Especially:
- https://github.com/erm0l0v/webpack-md5-hash/issues/7
- https://github.com/webpack/webpack/issues/1856

# Run test
```shell
git clone https://github.com/Poky85/webpack-chunkhash-demo.git webpack-chunkhash-demo
cd webpack-chunkhash-demo
npm install
npm run test
```

# Test results
Script will produce builds for following Webpack hashing algorithms:
* Webpack default hashing algorithm (https://webpack.github.io/docs/long-term-caching.html)
* Hashing using webpack-md5-hash plugin (https://www.npmjs.com/package/webpack-md5-hash)
* Hashing using webpack-chunk-hash plugin (https://www.npmjs.com/package/webpack-chunk-hash)

For each algorithm several different builds are created – so you can track what happens when something changes. Particular testscases are found in GIT branches:

* origin/master
* origin/testcase-1
* origin/testcase-2

Builds will be created in `~/webpack-chunkhash-demo` with following structure:
```
|-- webpack-default
    |-- master
        |-- src
        |-- dist
    |-- testcase-1
        |-- src
        |-- dist
    |-- testcase-2
        |-- src
        |-- dist

|-- webpack-md5-hash
    |-- master
        |-- src
        |-- dist
    |-- testcase-1
        |-- src
        |-- dist
    |-- testcase-2
        |-- src
        |-- dist

|-- webpack-chunk-hash
    |-- master
        |-- src
        |-- dist
    |-- testcase-1
        |-- src
        |-- dist
    |-- testcase-2
        |-- src
        |-- dist
```

