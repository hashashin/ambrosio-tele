module.exports = (robot) ->
  # the expected value of :room is going to vary by adapter, it might be a numeric id, name, token, or some other value
  robot.router.post '/hubot/gogs/:room', (req, res) ->
    room   = req.params.room || process.env["HUBOT_GITHUB_EVENT_NOTIFIER_ROOM"]
    data   = if req.body.payload? then JSON.parse req.body.payload else req.body
    cl = (data.commits).length
    i = cl-1    

    while i<cl
      commit = data.commits[i].id
      message = data.commits[i].message
      author = data.commits[i].author.name
      url = data.commits[i].url
      repo = data.repository.name
          
      robot.messageRoom room, "new commit: #{commit}\nmessage: #{message}\nauthor: #{author}\nrepo: #{repo}\n#{url}"
      i++

    res.send 'OK'
