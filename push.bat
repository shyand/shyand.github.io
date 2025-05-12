@echo off
:: Batch script to auto-add, commit, and push to Git
:: Usage: Double-click or run in cmd

setlocal enabledelayedexpansion

echo ����ִ�� Git �Զ��ύ������...
echo.

:: ��鵱ǰĿ¼�Ƿ��� Git �ֿ�
git rev-parse --is-inside-work-tree >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo ���󣺵�ǰĿ¼���� Git �ֿ⣡
    pause
    exit /b 1
)

:: ��ʾ����ļ�
echo [����ļ��б�]
git status -s
echo.

:: ȷ�ϲ���
set /p confirm="�Ƿ�����ύ�����ͣ�(y/n) "
if /i "!confirm!" neq "y" (
    echo ������ȡ��
    pause
    exit /b 0
)

:: ִ�� Git ����
echo ����ִ�� git add...
git add .
if %ERRORLEVEL% neq 0 (
    echo ����git add ʧ�ܣ�
    pause
    exit /b 1
)

echo ����ִ�� git commit...
git commit -m "def"
if %ERRORLEVEL% neq 0 (
    echo ����git commit ʧ�ܣ�
    pause
    exit /b 1
)

echo ����ִ�� git push...
git push ori main
if %ERRORLEVEL% neq 0 (
    echo ����git push ʧ�ܣ�
    pause
    exit /b 1
)

echo.
echo �����ɹ���ɣ�
pause