"use strict"

React = require 'react'
Counter = require './counter'

React.render <Counter testProp={1} className={'counter-01'} />, document.body
