# 设计模式-模版模式

定义：一个操作中的算法的骨架，而将一些步骤延迟到子类中。模板方法使得子类可以不改变一个算法的结构即可重定义该算法的某些特定步骤。

## 优点

1. 具体细节步骤实现定义在子类中，子类定义详细处理算法是不会改变算法整体结构
2. 代码复用的基本技术
3. 存在一种反向的控制结构，通过一个父类调用其子类的操作，通过子类对父类进行扩展增加新的行为，符合“开闭原则”

## 缺点

1. 每个不同的实现都需要定义一个子类，会导致类的个数增加，系统更加庞大

## 使用场景

1. 多个子类有共同的方法，且逻辑基本相同
2. 可以把核心的算法和重要的功能设计为模板方法，子类去实现相关细节功能
3. 系统在进行重构或者是功能优化的时候可以将子类重复的代码抽离到父类中

## 代码

```js

function Fruit() {}
Fruit.prototype.make = function () {
  this.water()
  this.material()
  this.mix()
  this.wait()
}
Fruit.prototype.water = function () {
  console.log('烧好开水, 到开水')
}
Fruit.prototype.material = function () {
  throw new Error('必须由子类重写这个方法')
}
Fruit.prototype.mix = function () {
  console.log('搅拌搅拌')
}
Fruit.prototype.wait = function () {
  console.log('凉一下, 就可以喝了')
}

function Pear() {
  Fruit.call(this)
}
Pear.prototype = new Fruit()
Pear.prototype.material = function () {
  console.log('放梨子')
}
var pear = new Pear()
pear.make()

```
