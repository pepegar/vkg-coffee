exec = require('child_process').exec
request = require "request"
querystring = require "querystring"
config = require "../config"
Command = require "./command"


module.exports =
  class Install extends Command
    name: "install"
    help: "install <plugin> install a plugin from the repository"
    action: (opts)=>
      if opts[1] is undefined then console.log "You must provide a name for the plugin"
      else
        name = opts[1]
        url = config.vimawesomeApi + '/' + name
        _this=this

        request url, (error, response, body) ->
          if !error and response.statusCode == 200
            parsedResponse = JSON.parse body
            gitUrl = parsedResponse.github_url
            path = config.vimBundlesPath + parsedResponse.slug

            _this.clone gitUrl, path
          else
            console.log body

    clone: (url, path)->
      exec "git clone #{url} #{path}", (error, stdout, stderr)->
        if error is null
          console.log "cloned into #{path}"
