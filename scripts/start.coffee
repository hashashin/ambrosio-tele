# Description:
#   None
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot start - Placeholder for telegram bot api /start command
#
# Author:
#   hashashin

module.exports = (robot) ->
  robot.respond /start/i, (msg) ->
    msg.send "Hi master"

