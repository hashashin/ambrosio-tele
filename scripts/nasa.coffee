# Description:
#   Nasa data api interaction
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot nasadata
#   hubot nasasearch
#
# Author:
#   hashashin
api_url = "http://data.nasa.gov/api/"

module.exports = (robot) ->
  robot.respond /nasadata/i, (msg) ->
    msg.http(api_url + "get_recent_datasets/?count=200")
      .get() (err, res, body) ->
        try
          json = JSON.parse(body)
          for post in json.posts
            msg.send """-- #{post.title_plain} url: #{post.url} #{post.date}"""
        catch err
          msg.send err

  robot.respond /nasasearch\s*(.*)?$/i, (msg) ->
    term = msg.match[1]
    msg.http(api_url + "get_search_results/?search=" + term)
      .get() (err, res, body) ->
        try
          json = JSON.parse(body)
          for post in json.posts
            msg.send """-- #{post.title_plain}
	    * #{post.excerpt}
            url: #{post.url} #{post.date}"""
        catch err
          msg.send err

