#! /usr/bin/env coffee
parser = require "nomnom"
commands = require "./lib/commands"

parser.script "vkg"

for name, command of commands
  parser.command command.name
     .callback command.action
     .help command.help

parser.nocommand "nocommand"
  .callback ()->
    console.log parser.getUsage()

parser.parse()
