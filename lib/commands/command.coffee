module.exports =
  class Command
    @name: ''
    @help: ''
    action: () ->
      throw new Error("not implemented")
