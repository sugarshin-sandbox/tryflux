import React from 'react';
import { EventEmitter } from 'events';
import Store from './Store';
import ActionCreator from './ActionCreator';

let dispatcher = new EventEmitter;
let store = new Store(dispatcher);
let action = new ActionCreator(dispatcher);

export default class Component extends React.Component {
  constructor(props) {
    super(props);
    this.state = {count: store.getCount()};
    store.on('change', this._onChange.bind(this));
  }

  _onChange() {
    this.setState({
      count: store.getCount()
    });
  }

  plusTwo() {
    action.countUp(this.state.count + 2);
  }

  tick() {
    action.increment();
  }

  render() {
    return (
      <div className={this.props.className}>
        {this.state.count}
        <button type="button" onClick={this.plusTwo.bind(this)}>up</button>
        <button type="button" onClick={this.tick.bind(this)}>i</button>
      </div>
    );
  }
}
