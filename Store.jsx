import { EventEmitter } from 'events';

export default class Store extends EventEmitter {
  constructor(dispatcher) {
    super();
    this.count = 0;
    dispatcher.on('countUp', this.onCountUp.bind(this));
    dispatcher.on('increment', this.onIncrement.bind(this));
  }

  getCount() {
    return this.count;
  }

  onIncrement() {
    this.count += 1
    this.emit('change');
  }

  onCountUp(count) {
    this.count = count;
    this.emit('change');
  }
}
