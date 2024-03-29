colors = require "colors"
request = require "request"
querystring = require "querystring"
config = require "../config"
Command = require "./command"


handleRequest = (error, response, body) ->
  if !error and response.statusCode == 200
    parsedResponse = JSON.parse body

    for plugin in parsedResponse.plugins
      console.log "* #{plugin.slug.green} - #{plugin.short_desc}"
  else
    console.log error

module.exports =
  class Search extends Command
    name: "search"
    help: "search <plugin> search a plugin in the repository"
    action: (opts)->
      if opts[1] is undefined then console.log "You must provide a name for the plugin"
      else
        name = opts[1]

        url = config.vimawesomeApi + '?' + querystring.stringify
          query: name

        request url, handleRequest
