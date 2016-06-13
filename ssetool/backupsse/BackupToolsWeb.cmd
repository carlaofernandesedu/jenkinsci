@ECHO " INICIO DE BACKUP TOOLS E WEB"
@ECHO
@ECHO
xcopy C:\sse\tools\*.* /s /v    C:\backupsse\prodesp\ssetool\tools
xcopy C:\sse\web\*.* /s  /v    C:\backupsse\prodesp\ssetool\web
@ECHO
@ECHO " FIM BACKUP TOOLS E WEB"
pause