# Description:
#   Dota api interaction
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot heroes
#   hubot dotanews
#   hubot dotaplayers
#
# Author:
#   hashashin
api_url = "http://api.steampowered.com"
api_key = process.env.STEAM_API_KEY

module.exports = (robot) ->
  robot.respond /heroes/i, (msg) ->
    msg.http(api_url + "/IEconDOTA2_570/GetHeroes/v001/?key=#{api_key}&language=es")
      .get() (err, res, body) ->
        try
          json = JSON.parse(body)
          heroes = ""
          for names in json.result.heroes
            heroes += " #{names.localized_name} "
          msg.send "```\n\u200BTotal: #{json.result.count}/n#{heroes}/n```"
        catch err
          msg.send err

  robot.respond /dotanews/i, (msg) ->
    msg.http(api_url + "/ISteamNews/GetNewsForApp/v0002/?appid=570&count=10")
      .get() (err, res, body) ->
        try
          json = JSON.parse(body)
          for news in json.appnews.newsitems
            msg.send """-- #{news.title}
            url: #{news.url} """

        catch err
          msg.send err

  robot.respond /dotaplayers/i, (msg) ->
    msg.http(api_url + "/ISteamUserStats/GetNumberOfCurrentPlayers/v1/?appid=570")
    .get() (err, res, body) ->
      try
        json = JSON.parse(body)
        msg.send "Current Online Dota 2 players: " + json.response.player_count + " Ruskys: 99%"
      catch err
        msg.send err
