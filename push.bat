@echo off
:: Batch script to auto-add, commit, and push to Git
:: Usage: Double-click or run in cmd

setlocal enabledelayedexpansion

echo 正在执行 Git 自动提交并推送...
echo.

:: 检查当前目录是否是 Git 仓库
git rev-parse --is-inside-work-tree >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo 错误：当前目录不是 Git 仓库！
    pause
    exit /b 1
)

:: 显示变更文件
echo [变更文件列表]
git status -s
echo.

:: 确认操作
set /p confirm="是否继续提交并推送？(y/n) "
if /i "!confirm!" neq "y" (
    echo 操作已取消
    pause
    exit /b 0
)

:: 执行 Git 操作
echo 正在执行 git add...
git add .
if %ERRORLEVEL% neq 0 (
    echo 错误：git add 失败！
    pause
    exit /b 1
)

echo 正在执行 git commit...
git commit -m "def"
if %ERRORLEVEL% neq 0 (
    echo 错误：git commit 失败！
    pause
    exit /b 1
)

echo 正在执行 git push...
git push ori main
if %ERRORLEVEL% neq 0 (
    echo 错误：git push 失败！
    pause
    exit /b 1
)

echo.
echo 操作成功完成！
pause