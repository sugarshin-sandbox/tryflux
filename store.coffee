"use strict"

{ EventEmitter } = require 'events'

module.exports =
class Store extends EventEmitter
  constructor: (dispatcher) ->
    super
    @count = 0
    dispatcher.on 'countUp', @onCountUp
    dispatcher.on 'increment', @onIncrement

  getCount: -> @count

  onIncrement: =>
    @count += 1
    @emit 'change'

  onCountUp: (count) =>
    @count = count
    @emit 'change'
