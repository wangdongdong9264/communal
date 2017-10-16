

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

##other

1. es2015

[组装 苹果教程](http://news.zol.com.cn/577/5777191.html)

[raspberry pi on visual studio code](https://www.hanselman.com/blog/BuildingVisualStudioCodeOnARaspberryPi3.aspx)

---



1. 字符串的扩展
* 字符的 unicode 表示
```es6
let hello = 123;
hell\u{6f}  //123

```

* codePointAt()
> 处理unicode码 > '0xffff'的字符

```es6
let s = '𠮷a';
s.codePointAt(0);   //134071
```

* String.fromCodePoint()
> 识别大于 Unicode > 0xffff的码点
```es6
String.fromCodePoint(0x78,0x1f680,0x79) === 'x\uD83D\uDE80y'    // true
```

* 字符串的遍历器接口

```es6
for (let codePoint of 'foo') {
    console.log(codePoint)
}
// 'f'
// 'o'
// 'o'
```

* at()
>返回字符串指定位置的字符 charAt()的扩展
```es6
'𠮷'.at(0) // "𠮷"
```

* normailze()
> 将字符串的不同表达方式，统一为同样的形式

 ```es6
'\u01D1'==='\u004F\u030C' //false

'\u01D1'.normalize() === '\u004F\u030C'.normalize() //true 
 ```

 * includes(), startsWith(), endsWith()

>includes()     返回布尔值，表示是否找到了参数字符串
>startsWith()   返回布尔值，表示参数字符串是否在原字符串的头部
>endsWith()     返回布尔值，表示参数字符串是否在原字符串的尾部

```es6
let s = 'hello world!';
s.startsWith('hello') // true
s.endsWith('!') // true
s.includes('o') // true

```

* repeat()
>返回一个新字符串， 表示将源字符重复n次
>参数不能为负数或Infinity
>-1 < 参数 < 0  或 NaN     转换数字/取整

```es6

'na'.repeat('3') // 'nanana'
```

* padStart(), padEnd()
>es2017 字符串补全
>
