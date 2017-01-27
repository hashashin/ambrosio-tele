# Description:
#   Random animal stealing gif when hubot hears !steal
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot steal animal - post a random animal stealing gif
#
# Author:
#   brbcoding
#

animalsStealingGifs = [
    "http://i.imgur.com/56EMC0E.gif"
    "http://i.imgur.com/PU6GAu1.gif"
    "http://i.imgur.com/j5T3zmI.gif"
    "http://i.imgur.com/jvRUZjy.gif"
    "http://i.imgur.com/kb0Qm28.gif"
    "http://i.imgur.com/rqMz0ja.gif"
    "http://i.imgur.com/qkMwXDx.gif"
    "http://i.imgur.com/tZdqjWc.gif"
    "http://i.imgur.com/6pkGjBs.gif"
    "http://i.imgur.com/m7JNFyk.gif"
    "http://i.imgur.com/OmquyWZ.gif"
    "http://i.imgur.com/HmNXJDP.jpg"
    "http://i.imgur.com/37POq2C.gif"
    "http://i.imgur.com/GuO2BEY.gif"
    "http://i.imgur.com/3Ryr1zP.gif"
    "http://i.imgur.com/t5bU6AI.gif"
    "http://i.imgur.com/EdAMgPQ.gif"
    "http://i.imgur.com/OBCGrQB.gif"
    "http://i.imgur.com/MmCcb2P.gif"
    "http://i.imgur.com/0OG0Yr4.gif"
    "http://i.imgur.com/1yZ8n8d.gif"
    "http://i.imgur.com/vtUqT9n.gif"
    "http://i.imgur.com/lwkIksm.gif"
    "https://i.imgur.com/eAPNPu7.jpg"
    "https://i.imgur.com/n86YhvQ.jpg"
    "http://i.imgur.com/EVtOYQF.gif"
    "http://i.imgur.com/06jL87e.gif"
  ]

module.exports = (robot) ->

  robot.respond /steal animal|animal steal/i, (msg) ->
    if robot.adapterName is "telegram"
      robot.emit 'telegram:invoke', 'sendPhoto', {
        chat_id: msg.envelope.room
        photo: msg.random animalsStealingGifs
      }, (error, response) ->
        if error != null
          robot.logger.error error
        robot.logger.debug response
    else
      msg.reply msg.random animalsStealingGifs
