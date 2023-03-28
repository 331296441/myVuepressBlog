# 玩客云


## 存在的问题
1. openwrt容器关闭时会导致OneCloud重启
2. 原16g SD Card存在问题，会卡死流程

## 当前能力
1. kodexplorer 文档操作
2. micro:bit 课程翻译，期望每周1-2课
3. code-server，目前手动启动
4. Docker，由于公司环境，暂时没有使用
5. 定时检查git并提交（crontab+脚本方式）



## 用到的脚本


``` shell
#!/bin/bash

# 如果传入了目录参数，则使用该目录，否则使用当前目录
if [[ -n "${1}" ]]; then
  cd "${1}"
fi

# 检查远程是否有更新
git remote update &> /dev/null
if [[ $(git status -uno | grep 'Your branch is behind') ]]; then
  echo "远程有更新，正在拉取代码..."
  git pull
fi

# 检查本地是否有更新
if [[ $(git status -s) ]]; then
  echo "本地有更新，正在提交并推送代码..."
  git add .
  git commit -m "自动提交"
  git push
fi
```