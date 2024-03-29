#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e
rm -rf node_modules
npm cache clean --force
npm install
# 生成静态文件
npm run build

# 进入生成的文件夹
cd docs/.vuepress/dist


git init
git add -A
git commit -m 'deploy'

# 如果你想要部署到 https://331296441.github.io
git push -f git@github.com:331296441/331296441.github.io.git master


cd -
