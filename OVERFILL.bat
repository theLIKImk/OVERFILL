@echo off
::SETLOCAL ENABLEDELAYEDEXPANSION
title OVERFILL
echo.覆盖磁盘残留数据
echo.
echo.
echo.
set /p act=[y/N]

if /i not "%act%"=="y" exit /b

set num=1
for %%d in (a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z) do call :loop %%d
echo.
echo.OK
echo.
echo.
pause
exit /b

:loop
	echo [%num%]%1:\%num%.overfill
	fsutil file createnew %1:\%num%.overfill 1024000000>null
	if not exist %1:\%num%.overfill goto :out
	set /a num+=1
	goto loop
:out
	del %1:\*.overfill
goto :eof
