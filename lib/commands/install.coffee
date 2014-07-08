exec = require('child_process').exec
request = require "request"
querystring = require "querystring"
config = require "../config"


clone = (url, path)->
  exec "git clone #{url} #{path}", (error, stdout, stderr)->
    if error is null
      console.log "cloned into #{path}"

module.exports =
  name: "install"
  help: "install <plugin> install a plugin from the repository"
  action: (opts)->
    if opts[1] is undefined then console.log "You must provide a name for the plugin"
    else
      name = opts[1]
      url = config.vimawesomeApi + '/' + name

      request url, (error, response, body) ->
        if !error and response.statusCode == 200
          parsedResponse = JSON.parse body
          gitUrl = parsedResponse.github_url
          path = config.vimBundlesPath + parsedResponse.normalized_name

          clone gitUrl, path
        else
          console.log body
