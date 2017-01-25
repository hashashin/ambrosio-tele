# Description:
#   gogs simple webhook
#
# Dependencies:
#
# Configuration:
#
# Commands:
#
# Author:
#   hashashin
TinyURL = require('tinyurl')

module.exports = (robot) ->
  # the expected value of :room is going to vary by adapter, it might be a numeric id, name, token, or some other value
  robot.router.post '/hubot/gogs/:room', (req, res) ->
    room   = req.params.room || process.env["HUBOT_GITHUB_EVENT_NOTIFIER_ROOM"]
    data   = if req.body.payload? then JSON.parse req.body.payload else req.body
    cl = (data.commits).length
    i = 0

    while i<=(cl-1)
      commit = data.commits[i].id
      commit = commit.toString().slice(0,9)
      message = data.commits[i].message
      author = data.commits[i].author.name
      TinyURL.shorten data.commits[i].url, (res) ->
        url = res
        repo = data.repository.name.replace(/_/g, ' ')

        msg = "*new commit*\n"
        msg += "repo: #{repo}\n"
        msg += "author: #{author}\n"
        msg += "message: #{message}\n"
        msg += "[#{commit}](#{url})"

        robot.messageRoom room, msg
        i++

    res.send 'OK'
