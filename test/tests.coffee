chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'version', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()

    require('../scripts/utils')(@robot)

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/version/i)

describe 'travis', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()

    require('../scripts/travis')(@robot)

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/travis me (.*)/i)

describe 'bang-bang', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()

    require('../scripts/bang-bang')(@robot)

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(.+)/i)
  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/rr$/i)

describe 'brain-save', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()

    require('../scripts/brain-save')(@robot)

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/brain save/i)

describe 'classnamer', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()

    require('../scripts/classnamer')(@robot)

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/class(?: me)?/i)
