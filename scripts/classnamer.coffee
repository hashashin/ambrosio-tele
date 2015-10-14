# Description
#   Class name generator.
#
# Commands:
#   hubot class me - generates a class name
#
# Author:
#   TAKAHASHI Kazunari[takahashi@1syo.net]

module.exports = (robot) ->
  robot.respond /class(?: me)?/i, (msg) ->
    msg.http("http://www.classnamer.com/index.txt?generator=generic")
      .get() (err, res, body) ->
        unless err
          msg.send body.replace(/\n/g, "")
