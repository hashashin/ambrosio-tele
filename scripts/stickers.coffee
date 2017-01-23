# Description:
#   send stickers
#
# Dependencies:
#
# Configuration:
#
# Commands:
#   hubot send sticker <sticker_id>
# Author:
#   hashashin

module.exports = (robot) ->
  if robot.adapterName is "telegram"
    robot.respond /send sticker (.*)/i, (msg) ->
      robot.emit 'telegram:invoke', 'sendSticker', {
        chat_id: msg.envelope.room
        sticker: msg.match[1]
      }, (error, response) ->
        if error != null
          robot.logger.error error
        robot.logger.debug response
  else
    robot.logger.info "You're not using telegram adapter, bye."
