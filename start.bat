@echo off
chcp 65001 >nul
title Bình Dân AI

REM Lưu thư mục gốc
set ROOT_DIR=%cd%

echo =====================================
echo   🌿 Đang khởi động Bình Dân AI...
echo =====================================

REM ==============================
REM START BACKEND (ẩn log)
REM ==============================
cd /d %ROOT_DIR%\backend
start /b cmd /c "npm run start >nul 2>&1"

REM ==============================
REM START FRONTEND (ẩn log)
REM ==============================
cd /d %ROOT_DIR%\frontend
start /b cmd /c "npx http-server -p 5500 >nul 2>&1"

REM Đợi server khởi động
timeout /t 2 >nul

REM Mở trình duyệt
start http://localhost:5500

REM Quay về root
cd /d %ROOT_DIR%

echo.
echo =====================================
echo  🚀 Bình Dân AI đã chạy!
echo =====================================
echo.

pause >nul