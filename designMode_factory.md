# 设计模式-工厂模式（面向对象）

  `简单模式`: 又称为静态工厂方法模式，它属于类创建型模式。在简单工厂模式中，可以根据参数的不同返回不同类的实例

## 优点

1. 能解决多个相似的问题
2. 通过引入配置文件，可以在不修改任何代码的情况下更换和增加新的具体产品类，在一定程度上提高了系统的灵活性

## 缺点

1. 由于工厂类集中了所有产品创建逻辑，一旦不能正常工作，整个系统都要受到影响。
2. 扩展困难，一旦添加新业务就要修改工厂逻辑，在业务类型较多时，可能造成工厂逻辑过于复杂，不利于系统稳定

## 应用场景

  针对同样的接收到的数据，处理的逻辑可能会不同，并且很少扩展的情况

## 代码

```js

/**
 * @description 简单工厂模式
 * @param {Number} coffee 
 * @param {Number} water
 * @returns { Object }
 */
function makeCoffee(coffee, water) {
  var obj = new Object()
  obj.coffee = coffee
  obj.water = water
  obj.percentage = coffee / water
  return obj
}
var coffee = makeCoffee(1, 10)
console.log('造出了纯度为', coffee.percentage, '的咖啡')
var coffee2 = makeCoffee(2, 10)
console.log('造出了纯度为', coffee2.percentage, '的咖啡')

```

---

`复杂工厂模式`: 将成员对象的实例化推迟到子类中，子类可以重写父类接口的方法以便创建的时候指定自己的对象类型

## 优点

1. 在工厂方法模式中，工厂方法用来创建客户所需要的产品，同时还向客户隐藏了哪种具体产品类将被实例化这一细节，用户只需要关心所需产品对应的工厂，无须关心创建细节
2. 基于工厂角色和产品角色的多态性设计是工厂方法模式的关键。它能够使工厂可以自主确定创建何种产品对象，而如何创建这个对象的细节则完全封装在具体工厂内部（工厂方法模式之所以又被称为多态工厂模式，是因为所有的具体工厂类都具有同一抽象父类）
3. 使用工厂方法模式的另一个优点是在系统中加入新产品时，无须修改抽象工厂和抽象产品提供的接口，无须修改客户端，也无须修改其他的具体工厂和具体产品，而只要添加一个具体工厂和具体产品就可以了。这样，系统的可扩展性也就变得非常好，完全符合“开闭原则”

## 缺点

1. 在添加新产品时，需要编写新的具体产品类，而且还要提供与之对应的具体工厂类，系统中类的个数将成对增加，在一定程度上增加了系统的复杂度，有更多的类需要编译和运行，会给系统带来一些额外的开销
2. 由于考虑到系统的可扩展性，需要引入抽象层 （增加了理解难度）

## 适用类型

1. 一个类不知道它所需要的对象的类
2. 一个类通过其子类来指定创建哪个对象
3. 将创建对象的任务委托给多个工厂子类中的某一个，在使用时可以无须关心是哪一个工厂子类创建产品子类，需要时再动态指定

## 代码

```js

function FruitMaker() {}

FruitMaker.prototype.make = function (type, meta) {
  if (typeof this[type] === 'function') {
    var func = this[type]
    func.prototype = FruitMaker.prototype // 修正原型链
    return new func(meta)
  } else {
    throw '类型错误'
  }
}
FruitMaker.prototype.extends = function (Obj) {
  for (const key in Obj) {
    this[key] = Obj[key]
  }
}
FruitMaker.prototype.extends({
  'Apple': function (meta) {
    console.log('造了一杯苹果汁, 材料有:', meta)
  },
  'Pear': function (meta) {
    console.log('造了一杯梨汁, 材料有:', meta)
  }
})
var maker = new FruitMaker()
var appleObj = maker.make('Apple', '一个苹果, 一斤水')
console.log(appleObj.constructor.name)
var pearObj = maker.make('Pear', '两个梨, 一吨水')
console.log(pearObj.constructor.name)
try {
  var unknown = maker.make('xxx')
} catch (error) {
  console.log(error)
}

```
