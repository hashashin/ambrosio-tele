module.exports = (robot) ->
  # the expected value of :room is going to vary by adapter, it might be a numeric id, name, token, or some other value
  robot.router.post '/hubot/gogs/:room', (req, res) ->
    room   = req.params.room || process.env["HUBOT_GITHUB_EVENT_NOTIFIER_ROOM"]
    data   = if req.body.payload? then JSON.parse req.body.payload else req.body
    cl = (data.commits).length    

    for i in [0...(cl-1)]
      commit = data.commits[i].id
      message = data.commits[i].message
      author = data.commits[i].author.name
      url = data.commits[i].url
      
      robot.messageRoom room, "new commit: #{commit}\nmessage: #{message}\nauthor: #{author}\n #{url}"

    res.send 'OK'
    robot.messageRoom room, "debug: #{cl}"
