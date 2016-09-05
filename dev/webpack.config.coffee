webpack = require "webpack"
module.exports =
  module:
    loaders: [
      { test: /\.vue$/, loader: "vue-loader"}
      { test: /\.html$/, loader: "html"}
      { test: /\.coffee$/, loader: "coffee-loader"}
    ]
    postLoaders: [
      { test: /icon/, loader: "callback-loader"}
    ]
  resolve:
    extensions: ["",".webpack.js",".web.js",".js",".coffee",".vue"]
  callbackLoader:
    require("../icon-loader.js")([
      "fa-glass"
      "fa-cab"
      "fa-bullhorn"
      "fa-camera"
      "fa-ban"
      "mdi-account-alert"
      "material-build"
      "octicon-logo-github"
      "octicon-heart"
      "iconic-wrench"
      "glyphicon-heart"
      "fa-thumbs-up"
      "fa-beer"
      "im-IcoMoon"
      "ra-download"
      "ra-and-download"
      ])
