# 单例模式

定义：单体模式是一个用来划分命名空间并将一批属性和方法组织在一起的对象，如果它可以被实例化，那么它只能被实例化一次。

## 优点

1. 可以用来划分命名空间，减少全局变量的数量。
2. 使用单体模式可以使代码组织的更为一致，使代码容易阅读和维护。
3. 由于在系统内存中只存在一个对象，因此可以节约系统资源，对于一些需要频繁创建和销毁的对象，单例模式无疑可以提高系统的性能

## 缺点

1. 单例模式中没有抽象层，因此单例类的扩展有很大的困难
2. 单例类的职责过重，在一定程度上违背了“单一职责原则”。因为单例类既充当了工厂角色，提供了工厂方法，同时又充当了产品角色，包含一些业务方法，将产品的创建和产品的本身的功能融合到一起

## 应用场景

1. 系统只需要一个实例对象，如系统要求提供一个唯一的序列号生成器，或者需要考虑资源消耗太大而只允许创建一个对象。
2. 调用类的单个实例只允许使用一个公共访问点，除了该公共访问点，不能通过其他途径访问该实例。
3. 在一个系统中要求一个类只有一个实例时才应当使用单例模式

## 代码

```js
// 及时函数 单例

(function () {
  var instance = null
  function Tool() {
    if (instance) {
      return instance
    }
    instance = this
    this.name = 'dong'
    this.intro = '使用及时函数的单例模式'
  }
  window.Tool = Tool
})(window)
var t1 = new Tool()
var t2 = new Tool()
var t3 = new Tool()
console.log(t1 === t2) // true
console.log(t1 === t3) // true
t1.name = 'itlike'
console.log(t1.name) // itlike
console.log(t2.name) // itlike
console.log(t3.name) // itlike

```

```js

// 惰性函数 单例

function Tool() {
  var instance = null
  var oldPrototype = Tool.prototype
  Tool = function () {
    return instance
  }
  Tool.prototype = oldPrototype
  instance = new Tool()
  // 修正constructor
  instance.constructor = Tool
  instance.name = 'dong'
  instance.age = 23
  return instance
}


Tool.prototype.run = function () {
  console.log('跑')
}
var t1 = new Tool();
Tool.prototype.desc = 'xxx';

var t2 = new Tool();
var t3 = new Tool();
var t4 = new Tool();

console.log(t1 === t2) // true
console.log(t3 === t4) // true
console.log(t3 === t1) // true

console.log(t1.desc) // xxx
console.log(t2.desc) // xxx
console.log(t3.desc) // xxx

console.log(t1.constructor)

```
