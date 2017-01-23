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
        chat_id: msg.user.name
        sticker: msg.match[1]
      }, (error, response) ->
        console.log error
        console.log response
  else
    console.log "You're not using telegram adapter, bye."
