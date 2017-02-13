# Description:
#   Saves the brain.
#

module.exports = (robot) ->
  robot.respond /brain save/i, (msg) ->
    robot.brain.setAutoSave true
    robot.brain.save()
    msg.send "Done, brain saved."

