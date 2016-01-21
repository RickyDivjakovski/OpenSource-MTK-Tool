@echo off
setlocal enabledelayedexpansion
call tools/modules/gainadmin

:main
cls
echo ========================================
echo           Welcome to OS-MTK-T
echo ========================================
echo  1. parse scatter file for human reading
echo  . convert ROM_* file to partitions 
echo  . root/unroot device
echo  . port cwm recovery to device
echo  .
echo  .
echo  .
echo  8. donate to support this tool
echo  9. tool and version info
echo ========================================
echo.
set selection=nul
set /P selection=Make your decision:
if %selection% == 1 goto parsescatter
if %selection% == 8 goto donate
if %selection% == 9 goto versioninfo
goto main

:parsescatter
cls
echo ========================================
echo           Welcome to OS-MTK-T
echo ========================================
echo scatter.txt in the scatter-file 
echo directory will be converted and saved 
echo as scatter-file/readable-scatter.txt
echo ========================================
pause
cls
echo ========================================
echo           Welcome to OS-MTK-T
echo ========================================
echo NAME            FILENAME            START ADDRESS            SIZE            TYPE
echo NAME            FILENAME            START ADDRESS            SIZE            TYPE>scatter-file/readable-scatter.txt
for /F "usebackq tokens=*" %%A in (scatter-file/scatter.txt) do (
echo %%A > line.txt
call tools/modules/scatter-parser
)
if exist line.txt del /s /q line.txt>nul
echo ========================================
pause>nul
goto main

:donate
start tools/donate.url
goto main

:versioninfo
cls
echo ========================================
echo           Welcome to OS-MTK-T
echo ========================================
type "tools\VersionInfo.txt"
echo.
echo ========================================
pause>nul
goto main