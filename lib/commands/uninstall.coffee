config = require "../config"
fs = require "fs"
colors = require "colors"


deleteFolderRecursive = (path)->
  files = []
  if fs.existsSync path
    files = fs.readdirSync(path);
    files.forEach (file,index) ->
      curPath = path + "/" + file
      if fs.lstatSync(curPath).isDirectory() #recurse
          deleteFolderRecursive curPath
      else # delete file
          fs.unlinkSync curPath
    fs.rmdirSync(path)

module.exports =
  name: "uninstall"
  help: "deletes a plugin from the plugins folder"
  action: (opts)->
    if opts[1] is undefined then console.log "You must provide the name of the plugin"
    else
      name = opts[1]
      deleteFolderRecursive config.vimBundlesPath + name
      console.log "succesfully deleted #{name}".green
