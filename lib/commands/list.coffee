config = require "../config"
fs = require "fs"
colors = require "colors"
Command = require "./command"


module.exports =
  class List extends Command
    name: "list"
    help: "lists all the plugins in the bundle directory"
    action: (opts)=>
      fs.readdir(config.vimBundlesPath, @list)

    list: (err, items)->
      if err is null
        for item in items
          console.log "* #{item.green}"
