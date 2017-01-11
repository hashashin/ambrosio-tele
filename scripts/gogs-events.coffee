module.exports = (robot) ->
  # the expected value of :room is going to vary by adapter, it might be a numeric id, name, token, or some other value
  robot.router.post '/hubot/gogs/:room', (req, res) ->
    room   = req.params.room || process.env["HUBOT_GITHUB_EVENT_NOTIFIER_ROOM"]
    data   = if req.body.payload? then JSON.parse req.body.payload else req.body
    text = data.text

    robot.messageRoom room, "#{text}"

    res.send 'OK'
