ECHO OFF
C:\sse\tools\nuget\NuGet.exe restore %1  -NonInteractive -source "https://www.nuget.org/api/v2;https://seducsp.pkgs.visualstudio.com/DefaultCollection/_packaging/PORTALNET_INTEGRACAO/nuget/v2" -configfile "C:\sse\tools\nuget\NewNuget.Config"
