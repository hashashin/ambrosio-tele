# Description:
#   Allows user to use a sed-like syntax to perform a string replacement on
#   their last message.
#
# Dependencies:
#   None
#
# Commands:
#   s/search/replace/ - replace all instances of the string 'search' in the user's last message with the string 'replace'. Case insenstive by default.
#
# Author:
# Dave Reid <dave@davereid.net>

class RegexUserMessageHistory
  constructor: ->
    # Don't need to persistantly store this data, so only use a local cache.
    # Instead of robot.brain.data
    @cache = {}

  addMessage: (message) ->
    key = @getCacheKey(message)
    @cache[key] = [{user: message.user.name, text: message.text}]
    return

  getCacheKey: (message) ->
    return message.room + ':' + message.user.id

  getMessages: (message) ->
    key = @getCacheKey(message)
    return @cache[key] ? []

  clear: ->
    @cache = {}
    return

  findLastMessage: (message, search, modifiers) ->
    re = new RegExp(search, modifiers)
    messages = @getMessages(message)
    for message in messages
      if re.test(message.text)
        return message

  processMessage: (message) ->
    # Ignore any non-room messages (like private messages).
    if (!message.room)
      return false

    # If the user has typed a regex string, then attempt to perform replacement
    # on their last known message.
    if match = message.text.match(/^s\/(.+?)\/(.*?)\/([ig]*)?$/)
      if lastMessage = @findLastMessage(message, match[1], match[3])
        re = new RegExp(match[1], match[3])
        replaced = lastMessage.text.replace(re, match[2])
        return "What #{lastMessage.user} meant to say was: #{replaced}"
      return false

    # Check a simpler regex format of s/find/replace (no trailing slash)
    if match = message.text.match(/^s\/(.+?)\/([^\/]+?)$/)
      if lastMessage = @findLastMessage(message, match[1], 'ig')
        re = new RegExp(match[1], 'ig')
        replaced = lastMessage.text.replace(re, match[2])
        return "What #{lastMessage.user} meant to say was: #{replaced}"
      return false

    # Normal message, log it to history
    @addMessage(message)

class RegexGlobalMessageHistory extends RegexUserMessageHistory
  constructor: (@limit) ->
    super

  addMessage: (message) ->
    key = @getCacheKey(message)
    if !@cache[key]?
      @cache[key] = []
    @cache[key].unshift({user: message.user.name, text: message.text})
    @cache[key].splice(@limit)
    return

  getCacheKey: (message) ->
    return message.room

module.exports = (robot) ->

  if process.env.HUBOT_REGEX_GLOBAL?
    limit = process.env.HUBOT_REGEX_GLOBAL_LIMIT ? 10
    if !isFinite(limit) or limit < 1
      throw new Error('Invalid value for HUBOT_REGEX_GLOBAL_LIMIT.')
    history = new RegexGlobalMessageHistory(limit)
  else
    history = new RegexUserMessageHistory

  robot.respond /.+/, (msg) ->
    if response = history.processMessage(msg.message)
      msg.send response
