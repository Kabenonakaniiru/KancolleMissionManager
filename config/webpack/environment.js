const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
// FIXME: 一時的に無効に戻した。packnameを指定しての読み込み方を調べること。(タグも変える必要がある)
// see https://github.com/rails/webpacker/blob/master/docs/webpack.md#add-splitchunks-webpack-v4
// Enable the default config
// environment.splitChunks()
// or using custom config
// environment.splitChunks((config) => Object.assign({}, config, { optimization: { splitChunks: false } }))

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: ['popper.js', 'default']
  })
)
module.exports = environment
