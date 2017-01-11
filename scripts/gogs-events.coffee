module.exports = (robot) ->
  # the expected value of :room is going to vary by adapter, it might be a numeric id, name, token, or some other value
  robot.router.post '/hubot/gogs/:room', (req, res) ->
    room   = req.params.room || process.env["HUBOT_GITHUB_EVENT_NOTIFIER_ROOM"]
    data   = if req.body.payload? then JSON.parse req.body.payload else req.body
    commit = data.commits[0].id
    message = data.commits[0].message
    author = data.commits[0].author.name
    url = data.commits[0].url

    robot.messageRoom room, "new commit: #{commit}\n
                             message #{message}\n
                             autor: #{autor}\n
                             #{url}"

    res.send 'OK'
