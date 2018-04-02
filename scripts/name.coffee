# Description
#   A Hubot script that greets us when this script loaded.
#
# Configuration:
#   HUBOT_STARTUP_ROOM
#   HUBOT_STARTUP_MESSAGE
#
# Commands:
#   None
#
# Author:
#   bouzuya <m@bouzuya.net>
#
module.exports = (robot) ->
  ROOM = process.env.HUBOT_STARTUP_ROOM ? 'Shell'
  MESSAGE = 'my name is: ' + robot.name

  robot.messageRoom ROOM, MESSAGE
