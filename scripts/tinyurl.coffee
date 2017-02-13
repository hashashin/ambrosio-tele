# Description:
#   tinyurl
#
# Dependencies:
#  TinyURL
# Configuration:
#
# Commands:
#   hubot tinyurl <url>
# Author:
#   hashashin
TinyURL = require('tinyurl')

module.exports = (robot) ->
  robot.respond /tinyurl\s+(https?:\/\/[^\s]+)$/i, (msg) ->
    TinyURL.shorten msg.match[1], (res) ->
      msg.send res

