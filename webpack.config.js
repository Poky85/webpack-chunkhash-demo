var webpack = require("webpack");
var ChunkManifestPlugin = require('chunk-manifest-webpack-plugin');

var config = {

	entry: {
		"entry-1": ["./src/entry-1"],
		"entry-2": ["./src/entry-2"],
		"vendor": ["./src/vendor"]
	},

	output: {
		path: "./dist",
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