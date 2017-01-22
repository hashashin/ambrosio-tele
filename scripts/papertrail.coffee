# Description:
#   papertrail simple webhook
#
# Dependencies:
#
# Configuration:
#
# Commands:
#
# Author:
#   hashashin

module.exports = (robot) ->
  # the expected value of :room is going to vary by adapter, it might be a numeric id, name, token, or some other value
  robot.router.post '/'+process.env.PAPERTRAIL_SALT+'/:room', (req, res) ->
    room   = req.params.room || process.env["HUBOT_GITHUB_EVENT_NOTIFIER_ROOM"]
    data   = if req.body.payload? then JSON.parse req.body.payload else req.body
    cl = (data.events).length
    i = 0

    while i<=(cl-1)
      hostname = data.events[i].hostname
      source = data.events[i].source_name
      message = data.events[i].message
      msg = "Papertrail alert from #{source} at #{hostname}\n"
      msg += "msg: #{message}\n"
      robot.messageRoom room, msg
      i++

    res.send 'OK'
