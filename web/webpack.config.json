module.exports = {
	entry: './index.coffee',
	output: {
		path: __dirname + '/public',
		filename: 'main.js'
	},
	module: {
		loaders: [
			{ test: /\.cpp$/, loader: 'html!' + __dirname + '/lib/SyntaxLoader.js' },
			{ test: /\.coffee$/, loader: 'coffee-loader' }
		]
	}
}
