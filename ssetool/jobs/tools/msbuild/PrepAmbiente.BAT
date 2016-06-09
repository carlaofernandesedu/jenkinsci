cd c:\sse\work\jks\%1\%2\source\%3
C:\sse\tools\nuget\Nuget.exe restore -source "https://www.nuget.org/api/v2;https://www.myget.org/F/nuget;http://10.17.150.28/nugetsse/nuget"
IF EXIST c:\sse\work\jks\%1\%2\publish del c:\sse\work\jks\%1\%2\publish\*.* /s /q


