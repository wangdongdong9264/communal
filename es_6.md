1. let 命令 
>只在代码块有用
>声明后使用  不存在变量提升

2. do 表达式

>使块级作用于可以变为表达式
```ES6
let x = do {
    let t = f();
    t * t + 1;
}
```

3. const 命令
>声明一个只读常量
>作用域和let一样
>不是值不变，而是变量指的地址不变

4. 变量的结构赋值

>按照一定模式，从数组和对象中提取，对变量进行赋值，这被称为解构
>如果解构不成功 变量值等于 undefined
```ES6
let [a,b,c]=[1,2,3,];

let [head, ...tail] = [1,2,3,4];
head // 1
tail // [2,3,4]
```

>默认值
>es6内部严格使用'===' ，一个数组成员不严格等于undefined,默认值是不会生效  null不严格等于undefined
```es6
let [x, y='b'] = ['a', undefined];  // x='a',y='b'

```


* 对象的解构赋值

>变量必须和属性同名
>对象的属性没后次序
```es6
let {foo, bar } = {foo:"aaa",bar:"bbb"};    
foo // "aaa"
bar // "bbb"


```






4. Symbol 数据类型
>防止属性名的冲突
>

