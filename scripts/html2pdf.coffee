# Description:
#   html2pdf
#
# Dependencies:
#   None
#
# Configuration:
#  HUBOT_HTML2PDF_URL
#
# Commands
#  hubot html2pdf <url>
#  hubot pdf me <url>
# Author:
#  hahashin

url = process.env.HUBOT_HTML2PDF_URL

module.exports = (robot) ->
  robot.respond /html2pdf\s+(https?:\/\/[^\s]+)$/i, (msg) ->
    msg.send url+"/?url="+msg.match[1]+"&format=A4&orientation=portrait&margin=1cm"
module.exports = (robot) ->
  robot.respond /pdf me\s+(https?:\/\/[^\s]+)$/i, (msg) ->
    robot.emit 'telegram:invoke', 'sendDocument', {
      chat_id: msg.envelope.room
      document: url+"/?url="+msg.match[1]
    }, (error, response) ->
      if error != null
        robot.logger.error error
      robot.logger.debug response
