@echo off

chcp 65001

echo 【提示】设置变量...

set "src_folder=D:\USER-ZHANG\Documents\Notes\博客网站\doc"
set "dest_folder=D:\Code Repository\doc\source"
set "git_folder=D:\Code Repository\doc"
set "del_file_a=D:\Code Repository\doc\source\auto work.bat"

echo 【提示】设置变量完成

if not exist "%dest_folder%" (
    echo 【提示】source 文件夹不存在
)
else (
    if defined PSModulePath (
        echo 【提示】删除文件夹...

        Powershell -Command "Remove-Item '%dest_folder%' -Recurse -Force"
    )
    else (
        echo 【提示】删除文件夹...

        rmdir /s /q "%dest_folder%"
    )
        echo 【提示】删除文件夹完成
)

echo 【提示】复制文件夹...

xcopy "%src_folder%" "%dest_folder%" /E/H/C/I/Y

echo 【提示】复制文件夹完成

echo 【提示】删除 bat 文件...

if defined PSModulePath (
    Powershell -Command "Remove-Item '%del_file_a%' -Recurse -Force"
) else (
    del /s /q "%del_file_a%"
)

echo 【提示】删除 bat 文件完成

D:

cd "%git_folder%"

echo 【提示】Git...

git add .
git commit -m "update"
git push --force origin main

echo 【提示】Git 到 doc 完成。

echo 【提示】请输入 "hexo cl" "hexo g" 和 "hexo d" 清除 hexo 缓存完成部署上传！

cmd
