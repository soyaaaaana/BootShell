@echo off
setlocal
openfiles > nul 2>&1
if %errorlevel% neq 0 (
  goto uac
)
goto maincli

:uac
set "args= -ArgumentList %~1"
if ["%~1"] equ [""] set args=
start /B /I /wait powershell start-process '%~0' -Verb runas%args% > nul 2>&1
exit/b

:maincli
echo:
echo:BootShell
echo:==============================
echo:
if "%~1" equ "/y" goto main
if "%~1" equ "/Y" goto main
choice /n /m "ブート画面でコマンド プロンプトを起動しますか? Y=Yes N=No"
if %errorlevel% equ 2 echo この操作はユーザーによって取り消されました。& pause & exit/b

:main

set dirname=BootShell\
set dir=C:\%dirname%
mkdir %dir% > nul 2>&1

echo @echo off> %dir%rebuild.bat
echo set path=%%~1>> %dir%rebuild.bat
echo set drive=%%path:~0,1%%>> %dir%rebuild.bat
echo if not ^"%%path:~1,2%%^"==^":\^" goto failed>> %dir%rebuild.bat
echo set IsA_Z=FALSE>> %dir%rebuild.bat
echo for %%%%i in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z) do if [%%drive%%]==[%%%%i] set IsA_Z=TRUE>> %dir%rebuild.bat
echo if %%IsA_Z%%==FALSE goto failed>> %dir%rebuild.bat
echo goto main>> %dir%rebuild.bat
echo :failed>> %dir%rebuild.bat
echo echo ファイルの再構築を実行できませんでした。ドライブ名が正しくありません。>> %dir%rebuild.bat
echo exit/b>> %dir%rebuild.bat
echo :main>> %dir%rebuild.bat
echo echo ファイルを再構築しています. . . >> %dir%rebuild.bat
echo echo @echo off^> %%~1%dirname%win.bat>> %dir%rebuild.bat
echo echo echo Windowsの起動準備をしています. . . ^>^> %%~1%dirname%win.bat>> %dir%rebuild.bat
echo echo reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "" /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%win.bat>> %dir%rebuild.bat
echo echo reg add HKLM\System\Setup /v SystemSetupInProgress /t REG_DWORD /d 0 /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%win.bat>> %dir%rebuild.bat
echo echo reg add HKLM\System\Setup /v SetupType /t REG_DWORD /d 0 /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%win.bat>> %dir%rebuild.bat
echo echo reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableCursorSuppression /t REG_DWORD /d 1 /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%win.bat>> %dir%rebuild.bat
echo echo rd /s /q "%%%%~dp0" ^^^& shutdown /r /t 0 /f ^^^> nul 2^^^>^^^&1 ^^^& ping localhost /n -1 ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%win.bat>> %dir%rebuild.bat


echo echo @echo off^> %%~1%dirname%recovery.bat>> %dir%rebuild.bat
echo echo echo 回復環境の起動準備をしています. . . ^>^> %%~1%dirname%recovery.bat>> %dir%rebuild.bat
echo echo reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "" /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%recovery.bat>> %dir%rebuild.bat
echo echo reg add HKLM\System\Setup /v SystemSetupInProgress /t REG_DWORD /d 0 /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%recovery.bat>> %dir%rebuild.bat
echo echo reg add HKLM\System\Setup /v SetupType /t REG_DWORD /d 0 /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%recovery.bat>> %dir%rebuild.bat
echo echo reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableCursorSuppression /t REG_DWORD /d 1 /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%recovery.bat>> %dir%rebuild.bat
echo echo reagentc /boottore ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%recovery.bat>> %dir%rebuild.bat
echo echo rd /s /q "%%%%~dp0" ^^^& shutdown /r /t 0 /f ^^^> nul 2^^^>^^^&1 ^^^& ping localhost /n -1 ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%recovery.bat>> %dir%rebuild.bat


echo echo @echo off^> %%~1%dirname%repair.bat>> %dir%rebuild.bat
echo echo if not exist wpeutil.exe echo WindowsPEまたは回復環境で実行されていないため、操作を完了できませんでした。WindowsPEまたは回復環境を使用し、再度実行してください。^^^& exit/b^>^> %%~1%dirname%repair.bat>> %dir%rebuild.bat
echo echo echo Windowsを修復しています. . . ^>^> %%~1%dirname%repair.bat>> %dir%rebuild.bat
echo echo reg load HKLM\SYSTEM_WINDOWS_REPAIR_ %%%%~dp0Windows\System32\config\SYSTEM ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%repair.bat>> %dir%rebuild.bat
echo echo reg load HKLM\SOFTWARE_WINDOWS_REPAIR_ %%%%~dp0Windows\System32\config\SOFTWARE ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%repair.bat>> %dir%rebuild.bat
echo echo reg add HKLM\SYSTEM_WINDOWS_REPAIR_\Setup /v CmdLine /t REG_SZ /d "" /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%repair.bat>> %dir%rebuild.bat
echo echo reg add HKLM\SYSTEM_WINDOWS_REPAIR_\Setup /v SystemSetupInProgress /t REG_DWORD /d 0 /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%repair.bat>> %dir%rebuild.bat
echo echo reg add HKLM\SYSTEM_WINDOWS_REPAIR_\Setup /v SetupType /t REG_DWORD /d 0 /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%repair.bat>> %dir%rebuild.bat
echo echo reg add HKLM\SOFTWARE_WINDOWS_REPAIR_\Microsoft\Windows\CurrentVersion\Policies\System /v EnableCursorSuppression /t REG_DWORD /d 1 /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%repair.bat>> %dir%rebuild.bat
echo echo rd /s /q "%%%%~dp0" ^^^& wpeutil reboot ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%repair.bat>> %dir%rebuild.bat
echo echo ファイルの再構築が完了しました。>> %dir%rebuild.bat


echo @echo off> %dir%cmdline.bat
echo reg add HKLM\SYSTEM\Setup /v SetupType /t REG_DWORD /d 2 /f ^> nul 2^>^&^1>> %dir%cmdline.bat
echo net start ^> nul 2^>^&^1>> %dir%cmdline.bat
echo start/b /wait cmd /c %dir%rebuild.bat C:\>> %dir%cmdline.bat
echo cls>> %dir%cmdline.bat
echo set "PATH=%dir%;%%PATH%%">> %dir%cmdline.bat
echo title BootShell>> %dir%cmdline.bat
echo echo コマンド "win" を実行して通常のWindowsを起動します。32bit版OSの場合、"win.bat" を実行してください。>> %dir%cmdline.bat
echo echo コマンド "recovery" を実行して回復環境を起動します。>> %dir%cmdline.bat
echo echo このツールで問題が発生した場合、回復環境でこのシステムのドライブの直下にある "BootShell" ディレクトリの "repair.bat" を実行することで解決する場合があります。>> %dir%cmdline.bat
echo echo ファイルが破損したなどの理由で "repair.bat" を正常に実行できない場合、回復環境でこのシステムのドライブの直下にある "BootShell" ディレクトリの "rebuild.bat" に引数として該当のWindowsのドライブ(C:\ や D:\ など)を付け加えて実行することで解決する場合があります。>> %dir%cmdline.bat


reg add HKLM\SYSTEM\Setup /v CmdLine /t REG_SZ /d "cmd.exe /k %dir%cmdline.bat" /f > nul 2>&1
reg add HKLM\SYSTEM\Setup /v SetupType /t REG_DWORD /d 2 /f > nul 2>&1
reg add HKLM\SYSTEM\Setup /v SystemSetupInProgress /t REG_DWORD /d 1 /f > nul 2>&1
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableCursorSuppression /t REG_DWORD /d 0 /f > nul 2>&1
shutdown /r /t 10 /c "10秒以内に再起動します。" /f > nul 2>&1
echo 10秒以内に再起動します。