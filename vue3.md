# about vue 3.x

[github 地址](https://github.com/vuejs/core.git)

采用 monorepo 管理项目 `pnpm-workspace`

## 生命周期的变化

| vue 2.x ｜ vue 3.x ｜
| :--- | :---: |
| beforeCreate ｜ setup() ｜
| create ｜ setup() ｜
| beforeMount ｜ onBeforeMount ｜
| mounted ｜ onMounted ｜
| beforeUpdate ｜ onBeforeUpdate ｜
| updated ｜ onUpdated ｜
| beforeDestroy ｜ onBeforeUnmount ｜
| destroyed ｜ onUnmounted ｜
| errorCaptured ｜ onErrorCaptured ｜

## 使用proxy代替defineProperty

## Diff算法的策略改变

## typeScript的支持
