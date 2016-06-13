@ECHO " INICIO DE BACKUP JOBS "
@ECHO
@ECHO
xcopy C:\tools\Jenkins\jobs\conf*.xml /s /v    C:\backupsse\prodesp\jobs
@ECHO
@ECHO " FIM BACKUP JOBS "
pause