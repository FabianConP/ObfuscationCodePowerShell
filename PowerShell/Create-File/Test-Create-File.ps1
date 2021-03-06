function Test-Create-File
{
<#
.SYNOPSIS
Custom Payload to create a file in a selected directory.

.DESCRIPTION
This payload creates a file to the given location.

.PARAMETER FULL_PATH
The FULL_PATH parameter where the file will be created

.PARAMETER HIDDEN
The HIDDEN parameter whether the new file is hidden or not

.EXAMPLE
PS > Test-Create-File "C:\Users\user\Downloads\toto.txt" $True

.LINK
https://github.com/FabianConP/ObfuscationCode
#>

    [CmdletBinding()] Param(
        [Parameter(Position = 0, Mandatory = $True)]
        [String]
        $FULL_PATH,

        [Parameter(Position = 1, Mandatory = $False)]
        [Boolean]
        $HIDDEN
    )
    # Creates a new file
    echo "This is the path im trying' to use $FULL_PATH"
    New-Item $FULL_PATH

    # Hides the file if necessary
    if($HIDDEN) {
        (Get-Item $FULL_PATH -force).Attributes='Hidden'
    }
}


