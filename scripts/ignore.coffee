# Description:
#   ignore not permitted messages.

permitted_users = process.env.HUBOT_PERMITTED_USERS?.split(',') || []

permitted_user = (user) ->
  user in permitted_users

module.exports = (robot) ->

  receive_org = robot.receive
  robot.receive = (msg)->
    user = msg.user?.name?.trim().toLowerCase()

    if permitted_user user # allow permitted room or user (direct message)
      receive_org.bind(robot)(msg)
    else
      console.log "ignored messge, from #{user} at #{room}"
