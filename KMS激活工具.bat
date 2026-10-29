@echo off
chcp 936 >nul
title 内网 KMS 激活工具
setlocal
set "HOST=kms.org.cn"

rem ===== 不是管理员就拉起一个提权后的自己 =====
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo   正在以管理员身份启动……
    echo   请在弹出的「用户账户控制」窗口点「是」。
    echo.
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    if errorlevel 1 (
        echo.
        echo   自动提权没有成功。请关掉本窗口，
        echo   改为右键这个文件，选「以管理员身份运行」。
        echo.
        pause
    )
    exit /b
)

:MENU
cls
echo ============================================================
echo                       内网 KMS 激活
echo    服务器：%HOST%
echo ============================================================
echo.
echo      [1] Windows
echo      [2] Office
echo.
echo      [0] 退出
echo.
echo ============================================================
set "C="
set /p "C=   输入编号后回车： "
if "%C%"=="1" goto WIN
if "%C%"=="2" goto OFFICE
if "%C%"=="0" exit /b
goto MENU

:WIN
cls
echo ============================================================
echo    Windows 激活
echo    服务器：%HOST%
echo ============================================================
echo.
echo   -- Windows 11 / 10 --
echo    [ 1] 专业版                           [ 2] 专业版 N
echo    [ 3] 专业工作站版                     [ 4] 专业工作站版 N
echo    [ 5] 专业教育版                       [ 6] 专业教育版 N
echo    [ 7] 教育版                           [ 8] 教育版 N
echo    [ 9] 企业版                           [10] 企业版 N
echo.
echo   -- Windows 10 LTSC / LTSB --
echo    [11] Enterprise LTSC 2019             [12] Enterprise LTSB 2016
echo    [13] Enterprise LTSB 2015          
echo.
echo   -- Windows Server --
echo    [14] Server 2025 标准版               [15] Server 2025 数据中心版
echo    [16] Server 2025 Datacenter Azure     [17] Server 2022 标准版
echo    [18] Server 2022 数据中心版           [19] Server 2019 标准版
echo    [20] Server 2019 数据中心版        
echo.
echo   -- 激活状态与排查 --
echo    [21] 查看详细激活信息                 [22] 清除 KMS 设置后重激活
echo.
echo      [0] 返回主菜单
echo ============================================================
set "C="
set /p "C=   输入编号后回车： "
if "%C%"=="1" goto W1
if "%C%"=="2" goto W2
if "%C%"=="3" goto W3
if "%C%"=="4" goto W4
if "%C%"=="5" goto W5
if "%C%"=="6" goto W6
if "%C%"=="7" goto W7
if "%C%"=="8" goto W8
if "%C%"=="9" goto W9
if "%C%"=="10" goto W10
if "%C%"=="11" goto W11
if "%C%"=="12" goto W12
if "%C%"=="13" goto W13
if "%C%"=="14" goto W14
if "%C%"=="15" goto W15
if "%C%"=="16" goto W16
if "%C%"=="17" goto W17
if "%C%"=="18" goto W18
if "%C%"=="19" goto W19
if "%C%"=="20" goto W20
if "%C%"=="21" goto W21
if "%C%"=="22" goto W22
if "%C%"=="0" goto MENU
goto WIN

:OFFICE
cls
echo ============================================================
echo    Office 激活
echo    服务器：%HOST%
echo ============================================================
echo.
echo   -- Office LTSC 2024 --
echo    [ 1] Office LTSC 专业增强版           [ 2] Project 专业版
echo    [ 3] Visio 专业版                     [ 4] Access
echo.
echo   -- Office LTSC 2021 --
echo    [ 5] Office LTSC 专业增强版           [ 6] Project 专业版
echo    [ 7] Visio 专业版                  
echo.
echo   -- Office 2019 --
echo    [ 8] Office 专业增强版                [ 9] Project 专业版
echo    [10] Visio 专业版                  
echo.
echo   -- Office 2016 --
echo    [11] Office 专业增强版                [12] Project 专业版
echo    [13] Visio 专业版                     [14] Excel 2016
echo    [15] Outlook 2016                  
echo.
echo   -- Office 状态与排查 --
echo    [16] 查看激活状态                     [17] 清除 Office 的 KMS 设置
echo.
echo      [0] 返回主菜单
echo ============================================================
set "C="
set /p "C=   输入编号后回车： "
if "%C%"=="1" goto O1
if "%C%"=="2" goto O2
if "%C%"=="3" goto O3
if "%C%"=="4" goto O4
if "%C%"=="5" goto O5
if "%C%"=="6" goto O6
if "%C%"=="7" goto O7
if "%C%"=="8" goto O8
if "%C%"=="9" goto O9
if "%C%"=="10" goto O10
if "%C%"=="11" goto O11
if "%C%"=="12" goto O12
if "%C%"=="13" goto O13
if "%C%"=="14" goto O14
if "%C%"=="15" goto O15
if "%C%"=="16" goto O16
if "%C%"=="17" goto O17
if "%C%"=="0" goto MENU
goto OFFICE

:W1
cls
echo    正在处理：Windows 11 / 10 专业版
echo.
cscript //nologo C:\Windows\System32\slmgr.vbs /skms %HOST%
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
cscript //nologo C:\Windows\System32\slmgr.vbs /ato
cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto WIN

:W2
cls
echo    正在处理：Windows 11 / 10 专业版 N
echo.
cscript //nologo C:\Windows\System32\slmgr.vbs /skms %HOST%
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk MH37W-N47XK-V7XM9-C7227-GCQG9
cscript //nologo C:\Windows\System32\slmgr.vbs /ato
cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto WIN

:W3
cls
echo    正在处理：Windows 11 / 10 专业工作站版
echo.
cscript //nologo C:\Windows\System32\slmgr.vbs /skms %HOST%
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J
cscript //nologo C:\Windows\System32\slmgr.vbs /ato
cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto WIN

:W4
cls
echo    正在处理：Windows 11 / 10 专业工作站版 N
echo.
cscript //nologo C:\Windows\System32\slmgr.vbs /skms %HOST%
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk 9FNHH-K3HBT-3W4TD-6383H-6XYWF
cscript //nologo C:\Windows\System32\slmgr.vbs /ato
cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto WIN

:W5
cls
echo    正在处理：Windows 11 / 10 专业教育版
echo.
cscript //nologo C:\Windows\System32\slmgr.vbs /skms %HOST%
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk 6TP4R-GNPTD-KYYHQ-7B7DP-J447Y
cscript //nologo C:\Windows\System32\slmgr.vbs /ato
cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto WIN

:W6
cls
echo    正在处理：Windows 11 / 10 专业教育版 N
echo.
cscript //nologo C:\Windows\System32\slmgr.vbs /skms %HOST%
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk YVWGF-BXNMC-HTQYQ-CPQ99-66QFC
cscript //nologo C:\Windows\System32\slmgr.vbs /ato
cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto WIN

:W7
cls
echo    正在处理：Windows 11 / 10 教育版
echo.
cscript //nologo C:\Windows\System32\slmgr.vbs /skms %HOST%
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
cscript //nologo C:\Windows\System32\slmgr.vbs /ato
cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto WIN

:W8
cls
echo    正在处理：Windows 11 / 10 教育版 N
echo.
cscript //nologo C:\Windows\System32\slmgr.vbs /skms %HOST%
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk 2WH4N-8QGBV-H22JP-CT43Q-MDWWJ
cscript //nologo C:\Windows\System32\slmgr.vbs /ato
cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto WIN

:W9
cls
echo    正在处理：Windows 11 / 10 企业版
echo.
cscript //nologo C:\Windows\System32\slmgr.vbs /skms %HOST%
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
cscript //nologo C:\Windows\System32\slmgr.vbs /ato
cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto WIN

:W10
cls
echo    正在处理：Windows 11 / 10 企业版 N
echo.
cscript //nologo C:\Windows\System32\slmgr.vbs /skms %HOST%
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4
cscript //nologo C:\Windows\System32\slmgr.vbs /ato
cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto WIN

:W11
cls
echo    正在处理：Windows 10 LTSC / LTSB Enterprise LTSC 2019
echo.
cscript //nologo C:\Windows\System32\slmgr.vbs /skms %HOST%
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk M7XTQ-FN8P6-TTKYV-9D4CC-J462D
cscript //nologo C:\Windows\System32\slmgr.vbs /ato
cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto WIN

:W12
cls
echo    正在处理：Windows 10 LTSC / LTSB Enterprise LTSB 2016
echo.
cscript //nologo C:\Windows\System32\slmgr.vbs /skms %HOST%
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ
cscript //nologo C:\Windows\System32\slmgr.vbs /ato
cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto WIN

:W13
cls
echo    正在处理：Windows 10 LTSC / LTSB Enterprise LTSB 2015
echo.
cscript //nologo C:\Windows\System32\slmgr.vbs /skms %HOST%
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk WNMTR-4C88C-JK8YV-HQ7T2-76DF9
cscript //nologo C:\Windows\System32\slmgr.vbs /ato
cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto WIN

:W14
cls
echo    正在处理：Windows Server Server 2025 标准版
echo.
cscript //nologo C:\Windows\System32\slmgr.vbs /skms %HOST%
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk TVRH6-WHNXV-R9WG3-9XRFY-MY832
cscript //nologo C:\Windows\System32\slmgr.vbs /ato
cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto WIN

:W15
cls
echo    正在处理：Windows Server Server 2025 数据中心版
echo.
cscript //nologo C:\Windows\System32\slmgr.vbs /skms %HOST%
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk D764K-2NDRG-47T6Q-P8T8W-YP6DF
cscript //nologo C:\Windows\System32\slmgr.vbs /ato
cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto WIN

:W16
cls
echo    正在处理：Windows Server Server 2025 Datacenter Azure
echo.
cscript //nologo C:\Windows\System32\slmgr.vbs /skms %HOST%
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk XGN3F-F394H-FD2MY-PP6FD-8MCRC
cscript //nologo C:\Windows\System32\slmgr.vbs /ato
cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto WIN

:W17
cls
echo    正在处理：Windows Server Server 2022 标准版
echo.
cscript //nologo C:\Windows\System32\slmgr.vbs /skms %HOST%
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk VDYBN-27WPP-V4HQT-9VMD4-VMK7H
cscript //nologo C:\Windows\System32\slmgr.vbs /ato
cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto WIN

:W18
cls
echo    正在处理：Windows Server Server 2022 数据中心版
echo.
cscript //nologo C:\Windows\System32\slmgr.vbs /skms %HOST%
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk WX4NM-KYWYW-QJJR4-XV3QB-6VM33
cscript //nologo C:\Windows\System32\slmgr.vbs /ato
cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto WIN

:W19
cls
echo    正在处理：Windows Server Server 2019 标准版
echo.
cscript //nologo C:\Windows\System32\slmgr.vbs /skms %HOST%
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk N69G4-B89J2-4G8F4-WWYCC-J464C
cscript //nologo C:\Windows\System32\slmgr.vbs /ato
cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto WIN

:W20
cls
echo    正在处理：Windows Server Server 2019 数据中心版
echo.
cscript //nologo C:\Windows\System32\slmgr.vbs /skms %HOST%
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk WMDGN-G9PQG-XVVXX-R3X43-63DFG
cscript //nologo C:\Windows\System32\slmgr.vbs /ato
cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto WIN

:W21
cls
echo    正在处理：激活状态与排查 查看详细激活信息
echo.
cscript //nologo C:\Windows\System32\slmgr.vbs /skms %HOST%
cscript //nologo C:\Windows\System32\slmgr.vbs /ato
cscript //nologo C:\Windows\System32\slmgr.vbs /dlv
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto WIN

:W22
cls
echo    正在处理：激活状态与排查 清除 KMS 设置后重激活
echo.
cscript //nologo C:\Windows\System32\slmgr.vbs /ckms
cscript //nologo C:\Windows\System32\slmgr.vbs /skms %HOST%
cscript //nologo C:\Windows\System32\slmgr.vbs /ato
cscript //nologo C:\Windows\System32\slmgr.vbs /xpr
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto WIN

:O1
cls
echo    正在处理：Office LTSC 2024 Office LTSC 专业增强版
echo.
if exist "C:\Program Files\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\root\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\root\Office16"
if exist "C:\Program Files\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\Office16"
cscript //nologo ospp.vbs /inpkey:XJ2XN-FW8RK-P4HMP-DKDBV-GCVGB
cscript //nologo ospp.vbs /sethst:%HOST%
cscript //nologo ospp.vbs /act
cscript //nologo ospp.vbs /dstatus
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto OFFICE

:O2
cls
echo    正在处理：Office LTSC 2024 Project 专业版
echo.
if exist "C:\Program Files\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\root\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\root\Office16"
if exist "C:\Program Files\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\Office16"
cscript //nologo ospp.vbs /inpkey:FQQ23-N4YCY-73HQ3-FM9WC-76HF4
cscript //nologo ospp.vbs /sethst:%HOST%
cscript //nologo ospp.vbs /act
cscript //nologo ospp.vbs /dstatus
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto OFFICE

:O3
cls
echo    正在处理：Office LTSC 2024 Visio 专业版
echo.
if exist "C:\Program Files\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\root\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\root\Office16"
if exist "C:\Program Files\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\Office16"
cscript //nologo ospp.vbs /inpkey:B7TN8-FJ8V3-7QYCP-HQPMV-YY89G
cscript //nologo ospp.vbs /sethst:%HOST%
cscript //nologo ospp.vbs /act
cscript //nologo ospp.vbs /dstatus
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto OFFICE

:O4
cls
echo    正在处理：Office LTSC 2024 Access
echo.
if exist "C:\Program Files\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\root\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\root\Office16"
if exist "C:\Program Files\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\Office16"
cscript //nologo ospp.vbs /inpkey:82FTR-NCHR7-W3944-MGRHM-JMCWD
cscript //nologo ospp.vbs /sethst:%HOST%
cscript //nologo ospp.vbs /act
cscript //nologo ospp.vbs /dstatus
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto OFFICE

:O5
cls
echo    正在处理：Office LTSC 2021 Office LTSC 专业增强版
echo.
if exist "C:\Program Files\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\root\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\root\Office16"
if exist "C:\Program Files\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\Office16"
cscript //nologo ospp.vbs /inpkey:FXYTK-NJJ8C-GB6DW-3DYQT-6F7TH
cscript //nologo ospp.vbs /sethst:%HOST%
cscript //nologo ospp.vbs /act
cscript //nologo ospp.vbs /dstatus
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto OFFICE

:O6
cls
echo    正在处理：Office LTSC 2021 Project 专业版
echo.
if exist "C:\Program Files\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\root\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\root\Office16"
if exist "C:\Program Files\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\Office16"
cscript //nologo ospp.vbs /inpkey:FTNWT-C6WBT-8HMGF-K9PRX-QV9H8
cscript //nologo ospp.vbs /sethst:%HOST%
cscript //nologo ospp.vbs /act
cscript //nologo ospp.vbs /dstatus
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto OFFICE

:O7
cls
echo    正在处理：Office LTSC 2021 Visio 专业版
echo.
if exist "C:\Program Files\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\root\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\root\Office16"
if exist "C:\Program Files\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\Office16"
cscript //nologo ospp.vbs /inpkey:KNH8D-FGHT4-T8RK3-CTDYJ-K2HT4
cscript //nologo ospp.vbs /sethst:%HOST%
cscript //nologo ospp.vbs /act
cscript //nologo ospp.vbs /dstatus
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto OFFICE

:O8
cls
echo    正在处理：Office 2019 Office 专业增强版
echo.
if exist "C:\Program Files\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\root\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\root\Office16"
if exist "C:\Program Files\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\Office16"
cscript //nologo ospp.vbs /inpkey:NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP
cscript //nologo ospp.vbs /sethst:%HOST%
cscript //nologo ospp.vbs /act
cscript //nologo ospp.vbs /dstatus
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto OFFICE

:O9
cls
echo    正在处理：Office 2019 Project 专业版
echo.
if exist "C:\Program Files\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\root\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\root\Office16"
if exist "C:\Program Files\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\Office16"
cscript //nologo ospp.vbs /inpkey:B4NPR-3FKK7-T2MBV-FRQ4W-PKD2B
cscript //nologo ospp.vbs /sethst:%HOST%
cscript //nologo ospp.vbs /act
cscript //nologo ospp.vbs /dstatus
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto OFFICE

:O10
cls
echo    正在处理：Office 2019 Visio 专业版
echo.
if exist "C:\Program Files\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\root\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\root\Office16"
if exist "C:\Program Files\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\Office16"
cscript //nologo ospp.vbs /inpkey:9BGNQ-K37YR-RQHF2-38RQ3-7VCBB
cscript //nologo ospp.vbs /sethst:%HOST%
cscript //nologo ospp.vbs /act
cscript //nologo ospp.vbs /dstatus
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto OFFICE

:O11
cls
echo    正在处理：Office 2016 Office 专业增强版
echo.
if exist "C:\Program Files\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\root\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\root\Office16"
if exist "C:\Program Files\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\Office16"
cscript //nologo ospp.vbs /inpkey:XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99
cscript //nologo ospp.vbs /sethst:%HOST%
cscript //nologo ospp.vbs /act
cscript //nologo ospp.vbs /dstatus
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto OFFICE

:O12
cls
echo    正在处理：Office 2016 Project 专业版
echo.
if exist "C:\Program Files\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\root\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\root\Office16"
if exist "C:\Program Files\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\Office16"
cscript //nologo ospp.vbs /inpkey:YG9NW-3K39V-2T3HJ-93F3Q-G83KT
cscript //nologo ospp.vbs /sethst:%HOST%
cscript //nologo ospp.vbs /act
cscript //nologo ospp.vbs /dstatus
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto OFFICE

:O13
cls
echo    正在处理：Office 2016 Visio 专业版
echo.
if exist "C:\Program Files\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\root\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\root\Office16"
if exist "C:\Program Files\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\Office16"
cscript //nologo ospp.vbs /inpkey:PD3PC-RHNGV-FXJ29-8JK7D-RJRJK
cscript //nologo ospp.vbs /sethst:%HOST%
cscript //nologo ospp.vbs /act
cscript //nologo ospp.vbs /dstatus
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto OFFICE

:O14
cls
echo    正在处理：Office 2016 Excel 2016
echo.
if exist "C:\Program Files\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\root\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\root\Office16"
if exist "C:\Program Files\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\Office16"
cscript //nologo ospp.vbs /inpkey:9C2PK-NWTVB-JMPW8-BFT28-7FTBF
cscript //nologo ospp.vbs /sethst:%HOST%
cscript //nologo ospp.vbs /act
cscript //nologo ospp.vbs /dstatus
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto OFFICE

:O15
cls
echo    正在处理：Office 2016 Outlook 2016
echo.
if exist "C:\Program Files\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\root\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\root\Office16"
if exist "C:\Program Files\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\Office16"
cscript //nologo ospp.vbs /inpkey:R69KK-NTPKF-7M3Q4-QYBHW-6MT9B
cscript //nologo ospp.vbs /sethst:%HOST%
cscript //nologo ospp.vbs /act
cscript //nologo ospp.vbs /dstatus
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto OFFICE

:O16
cls
echo    正在处理：Office 状态与排查 查看激活状态
echo.
if exist "C:\Program Files\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\root\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\root\Office16"
if exist "C:\Program Files\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\Office16"
cscript //nologo ospp.vbs /dstatus
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto OFFICE

:O17
cls
echo    正在处理：Office 状态与排查 清除 Office 的 KMS 设置
echo.
if exist "C:\Program Files\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\root\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\root\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\root\Office16"
if exist "C:\Program Files\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files\Microsoft Office\Office16"
if exist "C:\Program Files (x86)\Microsoft Office\Office16\ospp.vbs" pushd "C:\Program Files (x86)\Microsoft Office\Office16"
cscript //nologo ospp.vbs /remhst
cscript //nologo ospp.vbs /sethst:%HOST%
cscript //nologo ospp.vbs /act
echo.
echo ------------------------------------------------------------
echo    执行完毕。如果失败，请把上面的内容截图给管理员。
echo ------------------------------------------------------------
echo.
pause
goto OFFICE

exit /b
