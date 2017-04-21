###原型式继承

```
function object(o){
    function f(){};
    f.prototype = o;
    return new f();
}
```
	
###寄生继承

```
function createAnther(original){
    var clone = object(original);   //通过调用函数创建一个新的对象
    clone.sayhi=function(){         //以某种方式增强这个函数
        console.log("hi");
    }
    return clone;                   //返回这个对象

```