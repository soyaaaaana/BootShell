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
choice /n /m "�u�[�g��ʂŃR�}���h �v�����v�g���N�����܂���? Y=Yes N=No"
if %errorlevel% equ 2 echo ���̑���̓��[�U�[�ɂ���Ď�������܂����B& pause & exit/b

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
echo echo �t�@�C���̍č\�z�����s�ł��܂���ł����B�h���C�u��������������܂���B>> %dir%rebuild.bat
echo exit/b>> %dir%rebuild.bat
echo :main>> %dir%rebuild.bat
echo echo �t�@�C�����č\�z���Ă��܂�. . . >> %dir%rebuild.bat
echo echo @echo off^> %%~1%dirname%win.bat>> %dir%rebuild.bat
echo echo echo Windows�̋N�����������Ă��܂�. . . ^>^> %%~1%dirname%win.bat>> %dir%rebuild.bat
echo echo reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "" /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%win.bat>> %dir%rebuild.bat
echo echo reg add HKLM\System\Setup /v SystemSetupInProgress /t REG_DWORD /d 0 /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%win.bat>> %dir%rebuild.bat
echo echo reg add HKLM\System\Setup /v SetupType /t REG_DWORD /d 0 /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%win.bat>> %dir%rebuild.bat
echo echo reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableCursorSuppression /t REG_DWORD /d 1 /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%win.bat>> %dir%rebuild.bat
echo echo rd /s /q "%%%%~dp0" ^^^& shutdown /r /t 0 /f ^^^> nul 2^^^>^^^&1 ^^^& ping localhost /n -1 ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%win.bat>> %dir%rebuild.bat


echo echo @echo off^> %%~1%dirname%recovery.bat>> %dir%rebuild.bat
echo echo echo �񕜊��̋N�����������Ă��܂�. . . ^>^> %%~1%dirname%recovery.bat>> %dir%rebuild.bat
echo echo reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "" /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%recovery.bat>> %dir%rebuild.bat
echo echo reg add HKLM\System\Setup /v SystemSetupInProgress /t REG_DWORD /d 0 /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%recovery.bat>> %dir%rebuild.bat
echo echo reg add HKLM\System\Setup /v SetupType /t REG_DWORD /d 0 /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%recovery.bat>> %dir%rebuild.bat
echo echo reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableCursorSuppression /t REG_DWORD /d 1 /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%recovery.bat>> %dir%rebuild.bat
echo echo reagentc /boottore ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%recovery.bat>> %dir%rebuild.bat
echo echo rd /s /q "%%%%~dp0" ^^^& shutdown /r /t 0 /f ^^^> nul 2^^^>^^^&1 ^^^& ping localhost /n -1 ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%recovery.bat>> %dir%rebuild.bat


echo echo @echo off^> %%~1%dirname%repair.bat>> %dir%rebuild.bat
echo echo if not exist wpeutil.exe echo WindowsPE�܂��͉񕜊��Ŏ��s����Ă��Ȃ����߁A����������ł��܂���ł����BWindowsPE�܂��͉񕜊����g�p���A�ēx���s���Ă��������B^^^& exit/b^>^> %%~1%dirname%repair.bat>> %dir%rebuild.bat
echo echo echo Windows���C�����Ă��܂�. . . ^>^> %%~1%dirname%repair.bat>> %dir%rebuild.bat
echo echo reg load HKLM\SYSTEM_WINDOWS_REPAIR_ %%%%~dp0Windows\System32\config\SYSTEM ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%repair.bat>> %dir%rebuild.bat
echo echo reg load HKLM\SOFTWARE_WINDOWS_REPAIR_ %%%%~dp0Windows\System32\config\SOFTWARE ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%repair.bat>> %dir%rebuild.bat
echo echo reg add HKLM\SYSTEM_WINDOWS_REPAIR_\Setup /v CmdLine /t REG_SZ /d "" /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%repair.bat>> %dir%rebuild.bat
echo echo reg add HKLM\SYSTEM_WINDOWS_REPAIR_\Setup /v SystemSetupInProgress /t REG_DWORD /d 0 /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%repair.bat>> %dir%rebuild.bat
echo echo reg add HKLM\SYSTEM_WINDOWS_REPAIR_\Setup /v SetupType /t REG_DWORD /d 0 /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%repair.bat>> %dir%rebuild.bat
echo echo reg add HKLM\SOFTWARE_WINDOWS_REPAIR_\Microsoft\Windows\CurrentVersion\Policies\System /v EnableCursorSuppression /t REG_DWORD /d 1 /f ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%repair.bat>> %dir%rebuild.bat
echo echo rd /s /q "%%%%~dp0" ^^^& wpeutil reboot ^^^> nul 2^^^>^^^&^^^1^>^> %%~1%dirname%repair.bat>> %dir%rebuild.bat
echo echo �t�@�C���̍č\�z���������܂����B>> %dir%rebuild.bat


echo @echo off> %dir%cmdline.bat
echo reg add HKLM\SYSTEM\Setup /v SetupType /t REG_DWORD /d 2 /f ^> nul 2^>^&^1>> %dir%cmdline.bat
echo net start ^> nul 2^>^&^1>> %dir%cmdline.bat
echo start/b /wait cmd /c %dir%rebuild.bat C:\>> %dir%cmdline.bat
echo cls>> %dir%cmdline.bat
echo set "PATH=%dir%;%%PATH%%">> %dir%cmdline.bat
echo title BootShell>> %dir%cmdline.bat
echo echo �R�}���h "win" �����s���Ēʏ��Windows���N�����܂��B32bit��OS�̏ꍇ�A"win.bat" �����s���Ă��������B>> %dir%cmdline.bat
echo echo �R�}���h "recovery" �����s���ĉ񕜊����N�����܂��B>> %dir%cmdline.bat
echo echo ���̃c�[���Ŗ�肪���������ꍇ�A�񕜊��ł��̃V�X�e���̃h���C�u�̒����ɂ��� "BootShell" �f�B���N�g���� "repair.bat" �����s���邱�Ƃŉ�������ꍇ������܂��B>> %dir%cmdline.bat
echo echo �t�@�C�����j�������Ȃǂ̗��R�� "repair.bat" �𐳏�Ɏ��s�ł��Ȃ��ꍇ�A�񕜊��ł��̃V�X�e���̃h���C�u�̒����ɂ��� "BootShell" �f�B���N�g���� "rebuild.bat" �Ɉ����Ƃ��ĊY����Windows�̃h���C�u(C:\ �� D:\ �Ȃ�)��t�������Ď��s���邱�Ƃŉ�������ꍇ������܂��B>> %dir%cmdline.bat


reg add HKLM\SYSTEM\Setup /v CmdLine /t REG_SZ /d "cmd.exe /k %dir%cmdline.bat" /f > nul 2>&1
reg add HKLM\SYSTEM\Setup /v SetupType /t REG_DWORD /d 2 /f > nul 2>&1
reg add HKLM\SYSTEM\Setup /v SystemSetupInProgress /t REG_DWORD /d 1 /f > nul 2>&1
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableCursorSuppression /t REG_DWORD /d 0 /f > nul 2>&1
shutdown /r /t 10 /c "10�b�ȓ��ɍċN�����܂��B" /f > nul 2>&1
echo 10�b�ȓ��ɍċN�����܂��B