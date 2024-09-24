# taro core

taro: 3.6.7
node: 18.16.0
pnpm: 8.7.4

## dependency installation

```shell
pnpm i
```

## mainly packages

`@tarojs/runtime`

no matter how the front-end framework evolves, its underlying calls are all native apis in the w3c specification, such as window, document, etc. If the Dom and Bom apis compatible with the w3c specification are implemented in the mini-program environment, different front-end framework can be run in the mini-program environment. The differences between different mini-program end platforms, such as life cycle, component library, api, etc., are implemented by each end by specifying a set of en platform plug-in standards and injected into the packaging result during compilation.

### 

## other

[@tarojs/runtime core apis](https://github.com/NervJS/taro/tree/main/packages/taro-runtime)

[version-3.x/codebase-overview](https://github.com/NervJS/taro-docs/blob/master/versioned_docs/version-3.x/codebase-overview.md?plain=1)
