#1. Descargar herramientas de nirsoft

$Sysinternals = "https://download.sysinternals.com/files/SysinternalsSuite.zip";
$NetworkTrafficView = "https://www.nirsoft.net/utils/networktrafficview-x64.zip";
$BrowserHistoryView = "https://www.nirsoft.net/utils/browsinghistoryview-x64.zip"
$LastActivityView = "https://www.nirsoft.net/utils/lastactivityview.zip"

$URLs = @('https://download.sysinternals.com/files/SysinternalsSuite.zip','https://www.nirsoft.net/utils/networktrafficview-x64.zip','https://www.nirsoft.net/utils/browsinghistoryview-x64.zip', 'https://www.nirsoft.net/utils/lastactivityview.zip')

$DownloadZipFile;

foreach ($url in $URLs)
{
  $DownloadZipFile = "C:\Users\smazariego\OneDrive - Devel Security, S.A\Desktop\Tools\" + $(Split-Path -Path $url -Leaf);
  $ExtractPath = $DownloadZipFile
  Invoke-WebRequest -Uri $url -OutFile $DownloadZipFile
  $ExtractShell = New-Object -ComObject Shell.Application 
  $ExtractFiles = $ExtractShell.Namespace($DownloadZipFile).Items()
  $ExtractShell.NameSpace($ExtractPath).CopyHere($ExtractFiles) 
  Start-Process $ExtractPath
}


