Helper = require('hubot-test-helper')
expect = require('chai').expect
sinon = require('sinon')

# helper loads a specific script if it's a file
helper = new Helper('./../scripts/')

describe 'simple tests', ->
  room = null

  beforeEach ->
    room = helper.createRoom()

  afterEach ->
    room.destroy()

  context 'user says ping to hubot', ->
    beforeEach ->
      room.user.say 'alice', 'hubot PING'
      room.user.say 'bob',   'hubot PING'

    it 'should not reply pong to user', ->
      expect(room.messages).to.eql [
        ['hubot', 'Hello, cruel world!']
        ['alice', 'hubot PING']
        ['hubot', 'ignored message, from alice']
        ['bob',   'hubot PING']
        ['hubot', 'ignored message, from bob']
      ]

  context 'user says echo to hubot', ->
    beforeEach ->
      room.user.say 'jim', 'hubot echo this will be the message'
      room.user.say 'peter', 'hubot echo another message'

    it 'should not echo message back', ->
      expect(room.messages).to.eql [
        ['hubot', 'Hello, cruel world!']
        ['jim', 'hubot echo this will be the message']
        ['hubot', 'ignored message, from jim']
        ['peter', 'hubot echo another message']
        ['hubot', 'ignored message, from peter']
      ]

  context 'user says time to hubot', ->
    beforeEach ->
      process.env.TZ = 'UTC'
      @clock = sinon.useFakeTimers(1433182746000)
      room.user.say 'bill', 'hubot time'

    afterEach ->
      @clock.restore()

    it 'should not respond with current time', ->
      expect(room.messages).to.eql [
        ['hubot', 'Hello, cruel world!']
        ['bill', 'hubot time']
        ['hubot', 'ignored message, from bill']
      ]

  context 'user says die to hubot', ->
    beforeEach ->
      sinon.stub process, "exit"
      room.user.say 'mary', 'hubot die'

    afterEach ->
      process.exit.restore()

    it 'should not tell the room it is leaving', ->
      expect(room.messages).to.eql [
        ['hubot', 'Hello, cruel world!']
        ['mary', 'hubot die']
        ['hubot', 'ignored message, from mary']
      ]

    it 'should not call process exit', ->
      expect(process.exit.called).to.be.false
