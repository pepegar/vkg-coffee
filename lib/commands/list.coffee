config = require "../config"
fs = require "fs"
colors = require "colors"


list = (err, items)->
  if err is null
    for item in items
      console.log "* #{item.green}"

module.exports =
  name: "list"
  help: "lists all the plugins in the bundle directory"
  action: (opts)->
    fs.readdir(config.vimBundlesPath, list)
