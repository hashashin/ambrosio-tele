# Description:
#   mem info
#
# Commands:
#   hubot mem free - show free mem in MiB
#   hubot mem used% - show used mem %
#   hubot mem free% - show free mem %
#   hubot mem total - show total mem
#
# Author:
#   hashashin
#
# Dependencies:
#   mem-stat

memStat = require('mem-stat')

module.exports = (robot) ->
  robot.respond /mem free/i, (msg) ->
    msg.send memStat.free('MiB')

  robot.respond /mem used/i, (msg) ->
    msg.send memStat.usedPercent()

  robot.respond /mem free%/i, (msg) ->
    msg.send memStat.freePercent()

  robot.respond /mem total/i, (msg) ->
    msg.send memStat.total('MiB')
