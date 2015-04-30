"use strict"

React = require 'react'
{ EventEmitter } = require 'events'
Store = require './store'
ActionCreator = require './action-creator'

dispatcher = new EventEmitter
store = new Store dispatcher
action = new ActionCreator dispatcher

module.exports =
class Component extends React.Component
  constructor: (props) ->
    super props
    @state = count: store.getCount()
    store.on 'change', @_onChange

  _onChange: => @setState count: store.getCount()

  plusTwo: => action.countUp @state.count + 2
  tick: => action.increment()

  render: ->
    <div className={@props.className}>
      {@state.count}
      <button type="button" onClick={@plusTwo}>up</button>
      <button type="button" onClick={@tick}>i</button>
    </div>
