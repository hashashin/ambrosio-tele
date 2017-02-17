# Description:
#   utils
#
# Configuration:
#    Enable runtime-dyno-metadata form heroku labs
# Dependencies:
#
# Commands:
#   hubot version
#
# Author:
#   hashashin
#

version = process.env.HEROKU_RELEASE_VERSION
desc = process.env.HEROKU_SLUG_DESCRIPTION
rdate = process.env.HEROKU_RELEASE_CREATED_AT

module.exports = (robot) ->
  robot.respond /version/i, (msg) ->
    msg.send "I'm at version: #{version}\n```\u200B#{desc} - #{rdate}```"
