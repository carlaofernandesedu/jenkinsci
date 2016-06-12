@ECHO OFF 
xcopy c:\sourcegmud\homologacao\portalnet /S /I /E   c:\sourcegmud\producao\portalnet
ZiparPasta c:\sourcegmud\producao\portalnet c:\sourcegmud 
copy 
pause