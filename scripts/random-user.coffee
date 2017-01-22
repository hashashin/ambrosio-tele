# Description:
#   Generate random user data from randomuser.me
#
# Dependencies:
#   None
#
# Commands:
#   hubot random user - Get random user data from randomuser.me
#
# Author:
#   tombell

String::capitalize = ->
  "#{@charAt(0).toUpperCase()}#{@slice(1)}"

module.exports = (robot) ->

  robot.respond /(random|generate) user/i, (msg) ->
    msg.http('https://api.randomuser.me/')
      .get() (err, res, body) ->
        if err?
          msg.reply "Error occured generating a random user: #{err}"
        else
          try
            data = JSON.parse(body).results[0]
            resp = "#{data.name.first.capitalize()} #{data.name.last.capitalize()}\n"
            resp += "Gender: #{data.gender}\n"
            resp += "Email: #{data.email}\n"
            resp += "username: #{data.login.username} password: #{data.login.password}\n"
            resp += "Picture: #{data.picture.medium}"
            msg.send resp
          catch err
            msg.reply "Error occured parsing response body: #{err}"
