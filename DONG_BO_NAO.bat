@echo off
setlocal enabledelayedexpansion
title DONG BO KHO TRI THUC SECOND BRAIN VOI GITHUB
cd /d "%~dp0"

echo ========================================================
echo        DONG BO KHO TRI THUC SECOND BRAIN VOI GITHUB
echo ========================================================
echo.

where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [LOI] Khong tim thay Git trong he thong!
    echo Vui long cai dat Git de dong bo.
    pause
    exit /b 1
)

echo [1/4] Dang kiem tra nhanh Git hien tai...
for /f "tokens=*" %%i in ('git branch --show-current 2^>nul') do set CURRENT_BRANCH=%%i
if "%CURRENT_BRANCH%"=="" set CURRENT_BRANCH=master
echo Nhanh hien tai: %CURRENT_BRANCH%

echo.
echo [1b/4] Dang kiem tra danh tinh Git (user.name / user.email)...
for /f "tokens=*" %%n in ('git config user.name 2^>nul') do set GIT_NAME=%%n
if "%GIT_NAME%"=="" (
    echo Chua co user.name, dang tu dong cau hinh...
    git config user.name "hoten08031984-lab"
    echo Da cau hinh user.name = hoten08031984-lab
) else (
    echo user.name hien tai: %GIT_NAME%
)
for /f "tokens=*" %%e in ('git config user.email 2^>nul') do set GIT_EMAIL=%%e
if "%GIT_EMAIL%"=="" (
    echo Chua co user.email, dang tu dong cau hinh...
    git config user.email "hoten08031984@gmail.com"
    echo Da cau hinh user.email = hoten08031984@gmail.com
) else (
    echo user.email hien tai: %GIT_EMAIL%
)

echo.
echo [2/4] Dang keo du lieu moi nhat tu GitHub ve (Pull)...
git fetch origin %CURRENT_BRANCH%
git pull --rebase origin %CURRENT_BRANCH%
if %errorlevel% neq 0 (
    echo [CANH BAO] Co the co xung dot hoac loi ket noi mang.
    echo Dang thu lay lai trang thai cu...
    git rebase --abort >nul 2>nul
) else (
    echo Keo du lieu moi ve thanh cong!
)

echo.
echo [3/4] Dang kiem tra ghi chu va du lieu moi tai may nay...
set HAS_CHANGES=0
for /f "tokens=*" %%i in ('git status --porcelain 2^>nul') do (
    set HAS_CHANGES=1
)

if "%HAS_CHANGES%"=="1" (
    echo Phat hien co thay doi moi. Dang them va tao Commit...
    git add .
    set COMMIT_TIME=%date% %time%
    git commit -m "sync(local): cap nhat ghi chu %COMMIT_TIME%"
    
    echo.
    echo [4/4] Dang day du lieu moi len GitHub (Push)...
    git push origin %CURRENT_BRANCH%
    if %errorlevel% equ 0 (
        echo [THANH CONG] Da day toan bo du lieu moi len GitHub!
    ) else (
        echo [LOI] Khong the push len GitHub. Vui long kiem tra mang hoac quyen.
    )
) else (
    echo.
    echo [4/4] Khong co ghi chu nao moi tai may nay can day len.
    echo Kho tri thuc da dong bo 100%% voi GitHub!
)

echo.
echo ========================================================
echo             HOAN TAT DONG BO SECOND BRAIN!
echo ========================================================
echo.
timeout /t 5
