# macbook pro 2017 egpu

## 准备

1. 显卡: 3090 fe
2. 显卡坞：雷蛇
3. 雷电3线
4. intel芯片的mac

## 步骤

1. bootcamp 安装 windows 10
2. 在根目录下有个 BootCamp目录 双击Setup安装
3. 安装完后 需要重启 按住 `option` 直到出现选择启动盘 选 window
4. 在`启动转换`（第2步安装的）中选择 window （避免重启进入macOS）
5. 将显卡装进显卡坞
6. Windows 关机后 用雷电3线连接macbook
7. `https://www.nvidia.cn/geforce/drivers/` 下载驱动 (或者windows update)
8. 完成


## cuda

1. `https://developer.nvidia.com/cuda-downloads` 选择并安装

## wsl2

1. 打开terminal 执行 `wsl --install`
2. 如果遇到 无法解析服务器名称或地址 把dns改成`8.8.8.8`
3. 默认安装的是ubuntu

## conda

1. 启动Ubuntu
2. `https://www.anaconda.com/products/distribution#Downloads` 选择 `linux 64-Bit (x86) Installer (860 MB)` 复制地址
3. `curl -JLO https://repo.anaconda.com/archive/Anaconda3-2023.03-Linux-x86_64.sh` url替换你复制的地址
4. `sh ./Anaconda3-2023.03-Linux-x86_64.sh`
5. 回车后查看许可证，按 q 退出许可证，然后输入 yes 表示同意
6. `source .bashrc`
7. 结束

