> 因 Eletron 对环境要求十分苛刻，包括但不限于 node 版本、npm 版本、wine wine64 的依赖，导致升级与迁移十分困难。

运行环境要求：Docker
 
## 构建镜像
> 构建镜像这一步请一定前往网络环境较好的机器上执行，辟如海外 vps 等，国内打包容易发生错误（主要是 wine 与 electron 的依赖）
> 如不想自己构建，请看 `执行打包` 部分，可以用我构建好的 `czqclm/fast-package-electron:22-wine`

项目地址: https://github.com/czqclm/fast-package-electron
拉取项目文件
```bash
git clone https://github.com/czqclm/fast-package-electron
```
执行本地构建镜像
```bash
docker build -t fast-package-electron:22-wine . 
```

## 执行打包
前往需要打包的目录下（index.html 同级目录），执行命令。或者将 `$(pwd)` 替换为你需要打包的目录，辟如：`/root/project`
```bash
docker run --rm --name my_container \
-v $(pwd):/project \
fast-package-electron:22-wine \
/bin/sh -c "cp -r /package_lib/node_modules /project && cd /project && npm run package_win64"
```
如果打包没有问题即可在 `app-win32-x64` 目录下找到你想要的文件了

当然你可以用我打包好的镜像
docker hub: https://hub.docker.com/r/czqclm/fast-package-electron
```bash
docker run --rm --name my_container \
-v $(pwd):/project \
fast-package-electron:22-wine \
/bin/sh -c "cp -r /package_lib/node_modules /project && cd /project && npm run package_win"
```
