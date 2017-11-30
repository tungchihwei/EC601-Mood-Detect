### SET FOLDER TO WATCH + FILES TO WATCH + SUBFOLDERS YES/NO
    $watcher = New-Object System.IO.FileSystemWatcher
    $watcher.Path = "c:\sample"
    $watcher.Filter = "*.wav*"
    $watcher.IncludeSubdirectories = $false
    $watcher.EnableRaisingEvents = $true  

### DEFINE ACTIONS AFTER AN EVENT IS DETECTED
    $action = { Invoke-Item "C:\Users\ÖÐê»\Desktop\VSP.bat"}    
### DECIDE WHICH EVENTS SHOULD BE WATCHED 
    $created = Register-ObjectEvent $watcher "Created" -Action $action
    ### Register-ObjectEvent $watcher "Changed" -Action $action
    ### Register-ObjectEvent $watcher "Deleted" -Action $action
    ### Register-ObjectEvent $watcher "Renamed" -Action $action
    ### while ($true) {sleep 5}
    ### exit