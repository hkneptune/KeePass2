RMDIR /S /Q KeePass
RMDIR /S /Q KeePass_Distrib
RMDIR /S /Q KeePassLib
RMDIR /S /Q KeePassLibDoc
REM RMDIR /S /Q KeePassLibSD
REM RMDIR /S /Q KeePassNtv
RMDIR /S /Q ShInstUtil

RMDIR /S /Q ..\Ext\Output

RMDIR /S /Q ..\KeePass\obj
DEL ..\KeePass\KeePass.csproj.user

RMDIR /S /Q ..\KeePassLib\obj
DEL ..\KeePassLib\KeePassLib.csproj.user

REM RMDIR /S /Q ..\KeePassLibSD\obj
REM DEL ..\KeePassLibSD\KeePassLibSD.csproj.user

REM RMDIR /S /Q ..\ShInstUtil\obj
REM DEL ..\ShInstUtil\ShInstUtil.csproj.user
DEL ..\ShInstUtil\ShInstUtil.aps
DEL ..\ShInstUtil\ShInstUtil.ncb
DEL /A:H ..\ShInstUtil\ShInstUtil.suo
DEL /Q ..\ShInstUtil\*.user

DEL /A:H ..\KeePass.suo
DEL ..\KeePass.ncb

REM DEL /Q ..\KeePassNtv\*.aps
REM DEL /Q ..\KeePassNtv\*.user

RMDIR /S /Q ..\Translation\TrlUtil\Build
RMDIR /S /Q ..\Translation\TrlUtil\obj
DEL ..\Translation\KeePass.config.xml
DEL ..\Translation\KeePass.exe
DEL ..\Translation\KeePass.exe.config
DEL ..\Translation\KeePass.pdb
DEL ..\Translation\KeePass.XmlSerializers.dll
DEL ..\Translation\TrlUtil.exe
DEL ..\Translation\TrlUtil.exe.config
DEL ..\Translation\TrlUtil.pdb
DEL ..\Translation\TrlUtil.vshost.exe
DEL ..\Translation\TrlUtil.vshost.exe.manifest

DEL /A:H ..\Ext\KeePassMsi\KeePassMsi.suo
RMDIR /S /Q ..\Ext\KeePassMsi\.vs
RMDIR /S /Q KeePassMsi

CLS