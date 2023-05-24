@echo off

git add .
git commit -m "update"
git push --force origin main

bash deploy.sh

cls
echo Git Push Completed. Please input "hexo g" and "hexo d"

cmd


