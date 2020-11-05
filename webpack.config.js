const path = require('path')
const Dotenv = require('dotenv-webpack');

const postCSSPlugins = [
  require('postcss-import'),
  require('postcss-mixins'),
  require('postcss-simple-vars'),
  require('postcss-nested'),
  require('postcss-hexrgba'),
  require('autoprefixer')
]
// test
module.exports = {
  entry: './app/app.coffee',
  output: {
    filename: 'bundled.js',
    path: path.resolve(__dirname, 'dist')
  },
  devServer: {
    before: function(app, server) {
      server._watch('./app/**/*.html')
    },
    contentBase: path.join(__dirname, 'app'),
    hot: true,
    port: 3000,
    host: '0.0.0.0'
  },
  mode: 'development',
  module: {
    rules: [
      {
        test: /\.css$/i,
        use: ['style-loader', 'css-loader?url=false', {loader: 'postcss-loader', options: {plugins: postCSSPlugins}}]
      },
      {
        test: /\.coffee$/,
        loader: 'coffee-loader',
        options: {
          sourceMap: true,
        },
      }
    ]
  },
  plugins: [
    new Dotenv()
  ]
}