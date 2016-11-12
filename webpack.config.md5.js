var WebpackMd5HashPlugin = require('webpack-md5-hash');
var config = require("./webpack.config");

config.plugins.push(new WebpackMd5HashPlugin());

module.exports = config;