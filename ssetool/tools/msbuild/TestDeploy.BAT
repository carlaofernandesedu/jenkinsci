@ECHO OFF
@ECHO realizando os testes no arquivo DeployArtToServer 
cd c:\Andre\devrepogit\prodesp\jenkinsci\ssetool\tools\msbuild
c:
@ECHO Executando o deploy 
call :testpos2
goto :fim

:testnegativos
@ECHO TESTES NEGATIVOS
@ECHO INFORMAR SISTEMA ERRADO 
"C:\Program Files (x86)\MSBuild\12.0\Bin\MSBuild.exe" DeployArtToServer.proj /t:WebDeploy /p:Sistema=genericdao1 /p:Ambiente=homologacao  /p:ZipName=genericdao
@ECHO INFORMAR SISTEMA AMBIENTE ERRADO  
"C:\Program Files (x86)\MSBuild\12.0\Bin\MSBuild.exe" DeployArtToServer.proj /t:WebDeploy /p:Sistema=genericdao /p:Ambiente=homologacao1  /p:ZipName=genericdao
@ECHO NAO INFORMAR SISTEMA 
"C:\Program Files (x86)\MSBuild\12.0\Bin\MSBuild.exe" DeployArtToServer.proj /t:WebDeploy /p:Ambiente=homologacao1  /p:ZipName=genericdao  
@ECHO NAO INFORMAR AMBIENTE  
"C:\Program Files (x86)\MSBuild\12.0\Bin\MSBuild.exe" DeployArtToServer.proj /t:WebDeploy /p:Sistema=genericdao   /p:ZipName=genericdao
@ECHO NAO INFORMAR NOMEDOZIP 
"C:\Program Files (x86)\MSBuild\12.0\Bin\MSBuild.exe" DeployArtToServer.proj /t:WebDeploy /p:Sistema=genericdao /p:Ambiente=homologacao  
GOTO :fim

:testpos1
@ECHO TESTE PADRAO UM ARQUIVO 
"C:\Program Files (x86)\MSBuild\12.0\Bin\MSBuild.exe" DeployArtToServer.proj /t:WebDeploy /p:Sistema=genericdao /p:Ambiente=teste  
call :verificar
GOTO :fim

:testpos2
@ECHO TESTE PADRAO UM ARQUIVO 
"C:\Program Files (x86)\MSBuild\12.0\Bin\MSBuild.exe" DeployArtToServer.proj /t:WebDeploy /p:Sistema=genericdao /p:Ambiente=teste  /p:ServerBuild=vso /p:DropFolder="C:\sse\work\jks\hom\deployapps\drop\genericdao"
call :verificar
GOTO :fim




:verificar
PAUSE
CLS 

:fim
