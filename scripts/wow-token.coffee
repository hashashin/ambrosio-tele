# Description:
#   Return EU wow token price
#
# Dependencies:
#   None
#
# Configuration:
#  None
# 
# Commands:
#   hubot wowtoken - Return EU wow token price
#
# Author:
#   hashashin
     
module.exports = (robot) ->
  robot.respond /wowtoken/i, (msg) ->
    msg.http("https://wowtoken.info/wowtoken.json")
      .get() (err, res, body) ->
        json = JSON.parse(body)
        switch res.statusCode                                
          when 200
            msg.send "wow token prize: #{json.EU.formatted.buy}"
          else
            msg.send "There was an error (status: #{res.statusCode})."
