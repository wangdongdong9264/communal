# 策略模式

定义：定义一系列的算法，把它们一个个封装起来，并且使它们可以相互替换。

## 优点

1. 可以在不修改原有系统的基础上选择算法或行为，也可以灵活地增加新的算法或行为
2. 可以避免使用多重条件转移语句

## 缺点

1. 必须知道所有的策略类，并自行决定使用哪一个策略类
2. 策略模式将造成产生很多策略（冗余）

## 使用场景

1. 一个系统里面有许多类，它们之间的区别仅在于它们的行为，那么使用策略模式可以动态地让一个对象在许多行为中选择一种行为
2. 一个系统需要动态地在几种算法中选择一种
3. 使用多重的条件选择语句
4. 不希望用户知道复杂的、与算法相关的数据结构，在具体策略类中封装算法和相关的数据结构，提高算法的保密性与安全性

## 代码

```js

var Celue = {
  slow: function (distance) {
    console.log('慢速运动策略耗时:', distance * 2, '小时')
  },
  normal: function (distance) {
    console.log('普通运动策略耗时:', distance, '小时')
  },
  fast: function (distance) {
    console.log('快速运动策略耗时:', distance / 2, '小时')
  }
}
/**
 * @description 距离
 * @param {Number} from 
 * @param {Number} to 
 */
function PersonRun(from, to) {
  this.from = from
  this.to = to
}
PersonRun.prototype.run = function (celue) {
  celue(this.to - this.from)
}
var p = new PersonRun(0, 20)
p.run(Celue.slow)
p.run(Celue.normal)
p.run(Celue.fast)

```
