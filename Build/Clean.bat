RMDIR /S /Q KeePass
RMDIR /S /Q KeePass_Distrib
RMDIR /S /Q KeePassLib
RMDIR /S /Q KeePassLibDoc
RMDIR /S /Q KeePassLibSD
REM RMDIR /S /Q KeePassNtv
RMDIR /S /Q ShInstUtil

RMDIR /S /Q ..\Ext\Output

RMDIR /S /Q ..\KeePass\obj
DEL ..\KeePass\KeePass.csproj.user

RMDIR /S /Q ..\KeePassLib\obj
DEL ..\KeePassLib\KeePassLib.csproj.user

RMDIR /S /Q ..\KeePassLibSD\obj
DEL ..\KeePassLibSD\KeePassLibSD.csproj.user

RMDIR /S /Q ..\ShInstUtil\obj
DEL ..\ShInstUtil\ShInstUtil.csproj.user

DEL /A:H ..\KeePass.suo
DEL ..\KeePass.ncb

REM DEL /Q ..\KeePassNtv\*.aps
REM DEL /Q ..\KeePassNtv\*.user

RMDIR /S /Q ArcFourCipher
RMDIR /S /Q ..\Plugins\ArcFourCipher\obj
DEL ..\Plugins\ArcFourCipher\ArcFourCipher.csproj.user
DEL /A:H ..\Plugins\ArcFourCipher\ArcFourCipher.suo

RMDIR /S /Q KPScript
RMDIR /S /Q ..\Plugins\KPScript\obj
DEL ..\Plugins\KPScript\KPScript.csproj.user
DEL /A:H ..\Plugins\KPScript\KPScript.suo

RMDIR /S /Q SamplePlugin
RMDIR /S /Q ..\Plugins\SamplePlugin\obj
DEL ..\Plugins\SamplePlugin\SamplePlugin.csproj.user
DEL /A:H ..\Plugins\SamplePlugin\SamplePlugin.suo

RMDIR /S /Q ..\Plugins\SamplePluginCpp\Build
DEL /Q ..\Plugins\SamplePluginCpp\*.aps
DEL /Q ..\Plugins\SamplePluginCpp\*.user
DEL /Q ..\Plugins\SamplePluginCpp\*.ncb
DEL /A:H ..\Plugins\SamplePluginCpp\SamplePluginCpp.suo

RMDIR /S /Q ..\Translation\TrlUtil\obj
RMDIR /S /Q ..\Translation\TrlUtil\Build
DEL ..\Translation\TrlUtil.exe
DEL ..\Translation\TrlUtil.pdb
DEL ..\Translation\TrlUtil.vshost.exe
DEL ..\Translation\TrlUtil.vshost.exe.manifest
DEL ..\Translation\KeePass.exe
DEL ..\Translation\KeePass.XmlSerializers.dll
DEL ..\Translation\KeePass.pdb
DEL ..\Translation\KeePass.config.xml

DEL /A:H ..\Ext\KeePassMsi\KeePassMsi.suo
RMDIR /S /Q KeePassMsi

RMDIR /S /Q KPScript

CLS