# taro platfrom Plugin

Taro internally supports 6 mini program platforms by default

## example

`@tarojs/plugin-platform-weapp` Wechat mini program plugin
`@tarojs/plugin-platform-alipay` Alipay mini program plugin
`@tarojs/plugin-platform-swan` Baidu smart program plugin
`@tarojs/plugin-platform-tt` ByteDance mini program plugin
`@tarojs/plugin-platform-qq` QQ mini program plugin
`@tarojs/plugin-platform-jd` Jingdong mini program plugin

### directory structure

@tarojs/plugin-platform-weapp 

path: taro/packages/taro-weapp

```shell

src/
├── apis-list.ts // api related processing
├── apis.ts  // api list
├── components-react.ts  // component type used for react
├── components.ts  // components list
├── index.ts  // plugin entry
├── program.ts  // build time entry
├── runtime-utils.ts // runtime dependency tools
├── runtime.ts // runtime entry
└── template.ts // runtime dependency tools


```

## other
