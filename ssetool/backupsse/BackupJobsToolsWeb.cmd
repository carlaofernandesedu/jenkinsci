@ECHO " INICIO DE BACKUP TOOLS E WEB"
@ECHO
@ECHO "EXCLUSAO ARQUIVOS ZIP"
DEL c:\backupsse\*.zip
@ECHO
@ECHO "COPIA DOS JOBS PARA C:\BACKUPSSE"
xcopy C:\tools\Jenkins\jobs\conf*.xml /s /v /y   C:\backupsse\prodesp\jobs
@ECHO "COPIA DE SCRIPTS USADOS PELO JENKINS PARA C:\BACKUPSSE"
xcopy C:\sse\tools\*.* /s /v /y    C:\backupsse\prodesp\ssetool\tools
xcopy C:\sse\web\*.* /s  /v /y   C:\backupsse\prodesp\ssetool\web
@ECHO "FIM COPIA DOS JOBS  E SCRIPTS"
@ECHO
@ECHO "ZIPAR ESTRUTURA DO C:\BACKUPSSE"
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NonInteractive -ExecutionPolicy ByPass -command c:\sse\tools\pshell\ZiparPasta.ps1 "c:\backupsse\prodesp" "c:\backupsse" 
@ECHO "FIM ZIPAR ESTRUTURA DO C:\BACKUPSSE"
@ECHO
@ECHO "COPIAR PARA A ESTACAO DO MARCOS"
COPY c:\backupsse\*.ZIP  z:
@ECHO " FIM BACKUP JOBS E TOOLS"