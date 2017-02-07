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
      robot.logger.info "approved message, from #{user}"
    else
      robot.logger.info "ignored message, from #{user}"
      robot.send process.env.SHELL_ROOM, "ignored message, from #{user}"
