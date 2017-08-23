# Description:
#   mem info
#
# Commands:
#   hubot free - show free mem in MiB
#   hubot used% - show used mem %
#   hubot free% - show free mem %
#   hubot total - show total mem
#
# Author:
#   hashashin
#
# Dependencies:
#   mem-stat

memStat = require('mem-stat')

module.exports = (robot) ->
  robot.respond /free(?: me)?/i, (msg) ->
    msg.send memStat.free('MiB')

  robot.respond /used%(?: me)?/i, (msg) ->
    msg.send memStat.usedPercent()

  robot.respond /free%(?: me)?/i, (msg) ->
    msg.send memStat.freePercent()

  robot.respond /total(?: me)?/i, (msg) ->
    msg.send memStat.total('MiB')
