"use strict"

module.exports =
class ActionCreator
  constructor: (@dispatcher) ->

  countUp: (data) -> @dispatcher.emit 'countUp', data
  increment: -> @dispatcher.emit 'increment'
