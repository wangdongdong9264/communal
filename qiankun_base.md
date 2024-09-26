# 微前端 基本

## 基本步骤

1. 创建主应用
2. 配置微应用
3. start

### 主应用

承载微应用的容器，规定了微应用的显示区域

初始化普通spa

```ts
import Home from "@/pages/home/index.vue";
const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
];

export default routes;

```

```ts

import Vue from "vue";
import VueRouter from "vue-router";
import routes from "./routes";

const router = new VueRouter({
  mode: "history",
  routes,
});
new Vue({
  router,
  render: (h) => h(App),
}).$mount("#main-app");

```

页面布局左右结构，与普通spa不同的是区分了主应用和子应用的渲染节点

```jsx
<section id="main-app">
  <section class="menu-wrapper">
    <main-menu :menus="menus" />
  </section>
  <section class="frame-wrapper">
    {/* 主应用 */}
    <router-view v-show="$route.name" />
    {/* 子应用 */}
    <section v-show="!$route.name" id="frame"></section>
  </section>
</section>

```

### 创建

## 其它

[qiankun getting start](https://qiankun.umijs.org/guide/getting-started)
