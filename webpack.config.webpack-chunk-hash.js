var WebpackChunkHash = require("webpack-chunk-hash");
var config = require("./webpack.config");

config.plugins.push(new WebpackChunkHash({algorithm: "md5"}));

module.exports = config;