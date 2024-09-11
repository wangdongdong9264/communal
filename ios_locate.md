# ios14.x 定位更改

## 准备

  1. iphone
  2. macbook pro
  3. 数据线

## 原理

  苹果开发者调试在ios系统中具有优先的系统权限

  我们在`xcode`编写修改定位的代码并在ios设备中运行 设备会优先选取测试代码中的位置信息

## 添加证书

  位置: `Xcode >>Preference >>Accounts`

## 创建一个app项目

  点击主界面Create a new Xcode project新建项目，选择iOS下的Application下边的App，点Next

  填写一些信息( 开发语言根据个人选 我这边就以swift)

## 新建gpx文件

![swift目录结构](http://img.wangdongdong9264.xyz/截屏2021-01-17 15.21.37.png "目录")

```xml

<?xml version="1.0"?>
<gpx version="1.1" creator="Xcode">

    <!--
     Provide one or more waypoints containing a latitude/longitude pair. If you provide one
     waypoint, Xcode will simulate that specific location. If you provide multiple waypoints,
     Xcode will simulate a route visiting each waypoint.
     -->
    <wpt lat="31.17443426335553" lon="121.38744002867597">
        <name>Cupertino</name>

        <!--
         Optionally provide a time element for each waypoint. Xcode will interpolate movement
         at a rate of speed based on the time elapsed between each waypoint. If you do not provide
         a time element, then Xcode will use a fixed rate of speed.

         Waypoints must be sorted by time in ascending order.
         -->
        <time>2014-09-24T14:55:37Z</time>
    </wpt>

</gpx>

```

位置信息(常用的三种坐标系统)

  1. 原始坐标: GPS坐标--WGS-84
  2. 火星坐标: 中国特有--GCJ-02
  3. 百度加密坐标: 在火星坐标的基础上再次飘逸后的加密坐标--BD-09

iPhone所需要的坐标是`WGS-84`

将计算的WGS-84坐标填写到 wpt 标签中

## 配置Scheme

  位置: `product >>Scheme >> edit scheme >>options >>default location`

  default location 修改为 `Location`

## run

  先将iphone连上mac

  再调整测试环境 更改为自己的手机

  最后使用 `product >>run` (记得要解锁手机)

  等待xcode打包并安装完成(会自动打开app 因为我们没有写任何ui所以是空白)

  打开其它带有定位的app测试一下  

## 其它

[地图坐标转换](https://tool.lu/coordinate/)

第一次运行可能会出现 `未受信任的开发者` (大概是这个意思) 需要在iphone设置: `设置 >>统用 >>设备管理 >>开发者应用 >>信任此开发者`

按照上面的步骤完成模拟定位后 不要stop[^1] 直接拔掉数据线就可以保持虚拟定位[^2]

[^1]: 不然定位就恢复了
[^2]: 猜测xcode开发者模式开了个进程来模拟定位,如果xcode没有stop,那这个进程就不会kill掉（待验证）
