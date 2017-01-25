# Description:
#   Reboot command
#
# Configuration:
#   HUBOT_REBOOT_COMMAND - set this to replace the default reboot commands
#   HUBOT_REBOOT_MESSAGE - change the default message hubot posts as a reply to being rebooted
#
# Dependencies:
#
# Commands:
#   hubot reboot - tells hubot to die. 
#
# Author:
#   hashashin
#
# Notes:
#   copied/inspired from https://github.com/ClaudeBot/ClaudeBot/blob/master/scripts/claudebot.coffee

command = process.env.HUBOT_REBOOT_COMMAND ? 'reboot'
reboot_message = process.env.HUBOT_REBOOT_MESSAGE ? 'Bye, cruel world!'

module.exports = (robot) ->
  robot.respond /(.*)/i, (msg) ->
    return unless msg.match[1] is command
    msg.send reboot_message
    robot.logger.info 'Rebooting as requested by ' + msg.envelope.user.id
    setTimeout ->
      process.exit 0
    , 3000
