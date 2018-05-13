# 总结一下

## json

  1. 字符串转json

  ```js
  JSON.parse(str);
  ```

  2. json转字符串

  ```js
  JSON.stringify(json)
  ```

---

## string

    1. 字符串截取

    ```js

    // charAt() 方法从一个字符串中返回指定的字符。
    // 一个介于0 和字符串长度减1之间的整数。 (0~length-1)
    str.charAt(index)

    // slice() 方法提取一个字符串的一部分，并返回一新的字符串。
    // 该索引（以 0 为基数）处开始
    str.slice(beginSlice[, endSlice])

    // substring() 方法返回一个字符串在开始索引到结束索引之间的一个子集, 或从开始索引直到字符串的末尾的一个子集。
    // 一个 0 到字符串长度之间的整数。
    str.substring(indexStart[, indexEnd])

    // substr() 方法返回一个字符串中从指定位置开始到指定字符数的字符
    // 开始提取字符的位置。如果为负值，则被看作 strLength + start，其中 strLength 为字符串的长度
    // length 可选。提取的字符数。
    str.substr(start[, length])

    ```

    2. 字符串转数组

    ```js
    // split() 方法使用指定的分隔符字符串将一个String对象分割成字符串数组，以将字符串分隔为子字符串，以确定每个拆分的位置。
    // separator 可以是一个字符串或正则表达式
    // limit 一个整数，限定返回的分割片段数量
    str.split([separator[, limit]])

    ```
    3. 字符串替换

    ```js
    // replace() 方法返回一个由替换值替换一些或所有匹配的模式后的新字符串。模式可以是一个字符串或者一个正则表达式, 替换值可以是一个字符串或者一个每次匹配都要调用的函数。
    // regexp 一个RegExp 对象或者其字面量。该正则所匹配的内容会被第二个参数的返回值替换掉。
    // substr 一个要被 newSubStr 替换的字符串
    // newSubStr (replacement)用于替换掉第一个参数在原字符串中的匹配部分的字符串
    // function一个用来创建新子字符串的函数，该函数的返回值将替换掉第一个参数匹配到的结果
    str.replace(regexp|substr, newSubStr|function)

    ```

    4. 字符串搜索

    ```js
    // includes() 方法用于判断一个字符串是否包含在另一个字符串中，根据情况返回true或false。
    // searchString要在此字符串中搜索的字符串
    // position前字符串的哪个索引位置开始搜寻子字符串；默认值为0。
    // includes() 方法是区分大小写的
    str.includes(searchString[, position])

    // indexOf() 方法返回调用  String 对象中第一次出现的指定值的索引，开始在 fromIndex进行搜索。如果未找到该值，则返回-1
    // searchValue 一个字符串表示被查找的值
    // fromIndex 表示调用该方法的字符串中开始查找的位置。可以是任意整数。默认值为 0
    str.indexOf(searchValue[, fromIndex])

    ```

---

## array

    1. 数组转字符串

    ```js
    // join() 方法将一个数组（或一个类数组对象）的所有元素连接成一个字符串并返回这个字符串
    // separator 如果需要(separator)，将分隔符转换为字符串。如果省略()，数组元素用逗号分隔。默认为 ","。
    arr.join(separator)

    ```

    2. 数组添加

    ```js
    // push() 方法将一个或多个元素添加到数组的末尾，并返回新数组的长度。
    arr.push(element1, ..., elementN)

    // unshift() 方法将一个或多个元素添加到数组的开头，并返回新数组的长度。
    arr.unshift(element1, ..., elementN)


    ```

    3. 数组删除

    ```js
    // pop()方法从数组中删除最后一个元素，并返回该元素的值。此方法更改数组的长度。
    arr.pop()

    // shift() 方法从数组中删除第一个元素，并返回该元素的值。此方法更改数组的长度。
    arr.shift()

    ```

    4. 数组遍历

    ```js
    // map() 方法创建一个新数组，其结果是该数组中的每个元素都调用一个提供的函数后返回的结果。
    //currentValue callback 的第一个参数，数组中正在处理的当前元素。
    //index callback 的第二个参数，数组中正在处理的当前元素的索引。
    //array callback 的第三个参数，map 方法被调用的数组。
    //thisArg 可选的。执行 callback 函数时 使用的this 值。
    let new_array = arr.map(function callback(currentValue, index, array) {
      // Return element for new_array
    }[, thisArg])

    // forEach() 方法对数组的每个元素执行一次提供的函数
    // currentValue(当前值)
    // index(索引)
    // array forEach()方法正在操作的数组。
    // thisArg 可选参数。当执行回调 函数时用作this的值(参考对象)

    array.forEach(callback(currentValue, index, array){
      //do something
    }, this)

    // for...in语句以任意顺序遍历一个对象的可枚举属性。对于每个不同的属性，语句都会被执行。
    // variable 在每次迭代时，将不同的属性名分配给变量
    // object 被迭代枚举其属性的对象
    // 不建议使用for in 当你手动给添加属性后，并且object是array
    for (variable in object) {...}

    // for...of语句在可迭代对象（包括 Array，Map，Set，String，TypedArray，arguments 对象等等）上创建一个迭代循环，调用自定义迭代钩子，并为每个不同属性的值执行语句。
    // variable 在每次迭代中，将不同属性的值分配给变量。
    // iterable 被迭代枚举其属性的对象。
    // es6
    for (variable of iterable) {
      //statements
    }

    ```
