

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

>from git branch dev

4. Symbol 数据类型
>防止属性名的冲突


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


---华丽丽的分割线



* 模板字符串 反引号"`"
>可以当作普通字符串使用，也可以定义多行字符串，或者在字符串中嵌入变量
>所有的空格和缩进都会保留在输出中

```es6
let name = "Bob" ,time = "today";

`Hello ${name}, how are you ${time}?`

```

* String.raw()
>将转义字符原样输出

```es6
String.raw`hi\n{2+3}!`;
// 'h1\n5!'

```

---华丽丽的分割线


## 正则

* u 修饰符
>正确的处理大于\uffff的 Unicode 字符
```es6
/^\uD83D/u.test('\uD83D\uDC2A') //false

```

* y 修饰符
>全局匹配 从后一次匹配成功的下一个位置开始
>必须从剩余的第一个位置开始

```es6
var s = 'aaa_aa_a';
var r1 = /a+/g;
var r2 = /a+/y;

r1.exec(s)  // ['aaa']
r2.exec(s)  // ['aaa']
// _aa_a
r1.exec(s)  // ['aa']   
r2.exec(s)  // null


// lastIndex 属性
// 指定每次搜索开始的位置

const REGEX = /a/y;
REGEX.lastIndex = 3;
const match = REGEX.exec('xaxa')
match.index // 3
REGEX.lastIndex //4

```

* sticky 属性
>是否设置了y修饰符

```es6
var r = /helo\d/y;
r.sticky    //true
```

* flags 属性
>返回正则表达式的修饰符

```es6
/abc/ig.flags   // 'gi'

/adc/ig.source  // 'abc'    正文
```

* s 修饰符 dotAll模式
>'.'代表任意单个字符，但行终止符除外
* U+000A    换行(\n)
* U+000D    回车符(\r)
* U+2028    行分隔符
* U+2029    段分隔符
>可以使'.'匹配任意单个字符 

```es6
/foo.bar/s.test('foo\nbar') // true

const re = /foo.bar/s;
re.test('foo\nbar')
re.dotAll   //true


```
---又是一个分割线

## 数值的扩展

* 二进制和八进制表示法

>二进制    前缀0b/0B
>八进制    前缀0o/0O

```es6
0b11111011 === 503  // true
0o767 === 503       // true


Number('0b111') // 7
```

* Number.isFinite(),Number.isNaN()

> Number.isFinite() 检查一个数值是否为有限的
> Number.isNaN()    检查一个值是否为NaN

* Number.parseInt(),Number.parseFloat()

> es6将全局方法移植到Number对象上面


* Number.isInteger()

> 判断一个值是否为整数
> 在javascript 内部 整数和浮点数是同样的存储方法

```es6
Number.isInteger(25.0)  //true
Number.isInteger(25.1)  //false
```

* Number.EPSILON
>可接受的误差范围

```es6
0.1 + 0.2   // 0.30000000000000004

function withinErrorMargin (left, right) {
    return  Math.abs(left - right) < Number.EPSILON * Math.pow(2,2);
}
0.1 + 0.2 === 0.3 //false
withinErrorMargin(0.1 + 0.2, 0.3)   // true
1.1 + 1.3 === 2.4 //false
withinErrorMargin(1.1 + 1.3, 2.4)   // true
``` 


* 安全整数和Number.isSafeInteger()
> -2^53 < 整数范围 < 2^53
>isSafeInteger() 判断一个整数是否在安全范围内
```es6


Number.MAX_SAFE_INTEGER === 9007199254740991    //true  Math.pow(2, 53)
Number.MIN_SAFE_INTEGER === -9007199254740991   //true

Number.isSafeInteger(9007199254740991)  // true 
Number.isSafeInteger(9007199254740992)  // false
```

## math 对象的扩展


1. Math.trunc()

> 用于去除一个数的小数部分，返回整数部分

```es6
Math.trunc(true)    // 1
Math.trunc(false)   // 0
Math.null(null )    // 0
```
2. Math.sign()

> 判断一个数到底是正数/负数/还是零

3. Math.cbrt()

>计算一个数的立方根

4. Math.clz32()

> 返回一个数的32位无符号整数形式由多少个前导0

5. Math.imul()

> 返回两个数以32位带符号整数形式相乘的结果

6. Math.fround()
> 返回一个数的单精度浮点型

7. Math.hypot()
> 返回所有参数的平方和平方根

8. Math.expml()

> 返回e^x -1 /Math.exp(x) -1

9. Math.loglp()

>Math.log1p(x)方法返回1 + x的自然对数，即Math.log(1 + x)

10. Math.log10()

>Math.log10(x)返回以10为底的x的对数。如果x小于0，则返回NaN

11. Math.log2()

>Math.log2(x)返回以2为底的x的对数。如果x小于0，则返回NaN

12. Math.signbit()

>用来判断一个值的正负，但是如果参数是-0，它会返回-0

13. 指数运算符 **

```es6
2 ** 3  //8

let a = 4;
b ** = 3;   // 等同于b = b * b * b;
```



---
## 函数的扩展


call apply bind

## 数组

## Symbo
>第七种数据类型

##Proxy

##Set / Map 数据结构
1. 

##reflect

##Promicse 异步

##Iterator 遍历器

##Generator 函数的异步

##async Generator的语法糖 2017

##Class 类

##
