# Description:
#   Allows Hubot to respond like KOTOL!
#
# Dependencies:
#   None
#
# Configuration:
#  None
#
# Commands
#  give/giff me mana - duh.
#
# Author:
#  Vincent Paca

module.exports = (robot) ->
  mana_responses = [
    "Come. Come close to me!",
    "It's on COOLDOWN. COOLDOWN. COOLDOWN!",
    "You want mana?",
    "I give you mana",
    "I support your wayne",
    "Okay I give you mana, you give me tango",
    "You wait for mana",
    "I have no mana for give"
  ]

  robot.respond /(GIVE|GIFF) ME MANA[^a-z]*$/i, (msg) ->
    msg.send msg.random mana_responses
