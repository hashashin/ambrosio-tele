# Description:
#   Returns the URL of the first google hit for a query
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot find me <query> - Googles <query> & returns 1st result's URL
#
# Author:
#   searls

module.exports = (robot) ->
  robot.respond /(find)( me)? (.*)/i, (msg) ->
    googleMe msg, msg.match[3], (url) ->
      msg.send url

googleMe = (msg, query, cb) ->
  msg.http('http://www.google.com/search')
    .query(q: query)
    .get() (err, res, body) ->
      cb body.match(/class="r"><a href="\/url\?q=([^"]*)(&amp;sa.*)">/)?[1] || "Sorry, Google had zero results for '#{query}'"

