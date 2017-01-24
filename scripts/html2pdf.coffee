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
#
# Author:
#  hahashin

url = process.env.HUBOT_HTML2PDF_URL

module.exports = (robot) ->
  robot.respond /html2pdf\s+(https?:\/\/[^\s]+)$/i, (msg) ->
    msg.send url+"/?url="+msg.match[1]

