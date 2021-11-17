# 设计模式-命令模式

定义：命令指的是一个执行某些特定事情的指令

## 优点

1. 降低系统的耦合度
2. 新的命令可以很容易的加入到系统中
3. 比较容易的设计一个命令队列和宏命令（组合命令）

## 缺点

使用命令模式可能会导致某些系统有过多的具体命令。因为针对每一个命令都需要设计一个具体的命令类，因此某些系统可能需要大量具体命令类，这将影响命令模式的使用。

## 应用场景

有时候需要向某些对象发送请求，但是并不知道请求的接收者是谁，也不知道请求的操作是什么，此时希望用一种松耦合的方式来设计程序代码使得请求发送者和请求接受者消除彼此代码中的耦合关系

## 代码

```js

var cook = {
  name: '王二小',
  make: function (foodType) {
    switch (foodType) {
      case 'tudou':
        console.log(this.name, '做土豆')
        break
      case 'jidan':
        console.log(this.name, '做鸡蛋')
        break
      case 'fanqie':
        console.log(this.name, '做番茄')
        break
      default:
        console.log('不会做')
    }
  }
}
var cook2 = {
  name: '王大小',
  make: function (foodType) {
    switch (foodType) {
      case 'tudou':
        console.log(this.name, '做土豆加辣椒')
        break
      case 'jidan':
        console.log(this.name, '做鸡蛋加白糖')
        break
      case 'fanqie':
        console.log(this.name, '做番茄加酱油')
        break
      default:
        console.log('不会做')
    }
  }
}
var foodList = ['tudou', 'jidan', 'fanqie']
function MakeFoodCommand(cook, foodType){
  this.cook = cook
  this.foodType = foodType
}
MakeFoodCommand.prototype.execute = function() {
  this.cook.make(this.foodType)
}
// 生成命令
var commonds = []
for (let index = 0; index < foodList.length; index++) {
  var commond = null
  if (index % 2 === 0) {
    commond = new MakeFoodCommand(cook, foodList[index])
  } else {
    commond = new MakeFoodCommand(cook2, foodList[index])
  }
  commonds.push(commond)
}
// 执行命令
commonds.forEach(function (cmd) {
  cmd.execute()
})

```
