var webpack = require("webpack");
var ChunkManifestPlugin = require('chunk-manifest-webpack-plugin');
var TESTING = JSON.parse(process.env.TESTING || "false");

var srcDirectory = TESTING ? "./src/current-testcase" : "./src/testcase-1";
var distDirectory = TESTING ? "./dist/current-dist" : "./dist";

var config = {

	entry: {
		"entry-1": [srcDirectory + "/entry-1"],
		"entry-2": [srcDirectory + "/entry-2"],
		"vendor": [srcDirectory + "/vendor"]
	},

	output: {
		path: distDirectory,
		publicPath: "/",
		filename: "[name].[chunkhash].js",
		chunkFilename: "[name].[chunkhash].js"
	},

	resolve: {
		extensions: ["", ".js"]
	},

	plugins: [
		new ChunkManifestPlugin({
			filename: "webpack-manifest.json",
			manifestVariable: "webpackManifest"
		}),
		new webpack.optimize.CommonsChunkPlugin({
			name: "vendor"
		}),
		new webpack.optimize.OccurenceOrderPlugin()
	],

	bail: true
};

module.exports = config;