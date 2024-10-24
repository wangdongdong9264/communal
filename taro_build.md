# taro build

## principle

![code compilation](https://img.wangdongdong9264.xyz/taro_code_compilation.png)

## bable Transformation

`@babel/core`

this is the main package that provides the Babel compiler.
it includes the parser, traverser, and generator.
you can think of it as the "brain" of Babel.

---

`@babel/types`

this package provides a set of utility functions for working with AST (Abstract Syntax Tree) nodes.
it allows you to create, manipulate, and validate AST nodes.
think of it as a "toolbox" for working with ASTs.

---

`@babel/traverse`

this package provides a way to traverse the AST and perform operations on each node.
you can use it to visit specific nodes, transform them, or collect information about the code.
it is like a "navigator" that helps you explore the AST.

---

`@babel/generator`

this package takes an AST and generates the corresponding JavaScript code.
it is responsible for turning the abstract syntax tree into concrete code.
think of it as a "printer" that produces the final output code.

---

## transformation

```ts

export default class Index extend Component {
    state = {title: 'demo'}

    render () {
        return (
            <View className='index'>
                <Text>{ this.state.title }</Text>
            </View>
        )
    }
}

```

```js

Page({
    data: {
        title: 'demo'
    },
    onLond() {},
    onShow() {}
})

```

```html

<view>
    <text>{{title}}</text>
</view>

```

jsx code > get AST > resolve render > transform code > generate code

## template process

| if...else... | wx:if wx:else |
| -------- | :-------: |
| data.map(item => ...) | wx:for="data" wx:for-item="item" |
| && | wx:if |
| attribute calculation | complex expressions |
| ... | ... |

## other

[es tree spec](https://astexplorer.net/)