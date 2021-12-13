# 设计模式-观察者模式（发布/订阅模式）

定义：对象间的一种一对多的关系，让多个观察者对象同时监听某一个主题对象，当一个对象发生改变时，所有依赖于它的对象都将得到通知

## 优点

1. 观察者模式可以实现表示层和数据逻辑层的分离，并定义了稳定的消息更新传递机制，抽象了更新接口，使得可以有各种各样不同的表示层作为具体观察者角色
2. 观察者模式在观察目标和观察者之间建立一个抽象的耦合。
3. 观察者模式支持广播通信。
4. 发布者与订阅者耦合性降低，发布者只管发布一条消息出去，它不关心这条消息如何被订阅者使用，同时，订阅者只监听发布者的事件名，只要发布者的事件名不变，它不管发布者如何改变

## 缺点

1. 使用命令模式可能会导致某些系统有过多的具体命令类。因为针对每一个命令都需要设计一个具体命令类，因此某些系统可能需要大量具体命令类，这将影响命令模式的使用
2. 如果在观察者和观察目标之间有循环依赖的话，观察目标会触发它们之间进行循环调用，可能导致系统崩溃
3. 观察者模式没有相应的机制让观察者知道所观察的目标对象是怎么发生变化的，而仅仅只是知道观察目标发生了变化

## 应用场景

1. 一个抽象模型有两个方面，其中一个方面依赖于另一个方面。将这些方面封装在独立的对象中使它们可以各自独立地改变和复用
2. 一个对象的改变将导致其他一个或多个对象也发生改变，而不知道具体有多少对象将发生改变，可以降低对象之间的耦合度
3. 一个对象必须通知其他对象，而并不知道这些对象是谁
4. 需要在系统中创建一个触发链，A对象的行为将影响B对象，B对象的行为将影响C对象……，可以使用观察者模式创建一种链式触发机制

## 代码

```js
// 普通版
var lk = {
  typeTargetAction: {},
  addUser: function (type, target, action) {
    if (typeof this.typeTargetAction[type] === 'undefined') {
      this.typeTargetAction[type] = []
    }
    var obj = { target, action }
    this.typeTargetAction[type].push(obj)
  },
  publishMsg: function (type, msgContent) {
    var targetActions = this.typeTargetAction[type] || []
    for (let index = 0; index < targetActions.length; index++) {
      var obj = targetActions[index]
      var target = obj.target
      var action = obj.action
      action.call(target, msgContent)
    }
  }
}

var stu1 = {name: 'wang'};
var stu2 = {name: 'dong'};
lk.addUser('h5', stu1, function (msgContent) {
  console.log(msgContent, '已推送', this.name)
})
lk.addUser('h5', stu2, function (msgContent) {
  console.log(msgContent, '已推送', this.name)
})

lk.addUser('jest', stu1, function (msgContent) {
  console.log(msgContent, '已推送', this.name)
})

lk.addUser('docker', stu2, function (msgContent) {
  console.log(msgContent, '已推送', this.name)
})
//  广播消息
lk.publishMsg('h5', 'web需要深入了解')
lk.publishMsg('docker', '虚拟化技术了解就行')

```

```js
// class版

class EventEmitter {
  constructor() {
    // 事件对象，存放订阅的名称和事件
    this.events = {}
  }

  // 订阅事件的方法
  on(eventName,callback) {
    // 注意，一个名字可以订阅多个事件函数
    if(!this.events[eventName]) {
      this.events[eventName] = [ callback ]
    } else {
      this.events[eventName].push(callback)
    }
  }
  
  // 触发事件的方法
  emit(eventName) {
    // 遍历执行所有订阅的事件
    this.events[eventName] && this.events[eventName].forEach(cb => {
      cb()
    });
  }

  // 移除订阅模式
  removeListener(eventName,callback) {
    if (this.events[eventName]) {
      this.events[eventName] = this.events[eventName].filter(cb =>  cb != callback)
    }
  }

  // 只执行一次的订阅事件，然后移除
  once(eventName,callback) {
    // 绑定fn， 执行的时候触发fn
    let fn = () => {
      callback()
      this.removeListener(eventName, fn)
    }
    this.on(eventName, fn)
  }
}

// 使用
const em = new EventEmitter()
let workday = 0
em.on('work', function() {
  workday++
  console.log('work everyday');
})
em.once('love', function() {
  console.log('just love you')
})
function needMoney() {
  console.log('need more money');
}
em.on('money', needMoney)

em.emit('work')
em.removeListener('money', needMoney)
em.emit('money')
em.emit('love')

```
