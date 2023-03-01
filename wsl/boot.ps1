#Requires -Version 6.0

[System.Console]::OutputEncoding = [Text.Encoding]::Unicode

$err = wsl -d ArchLinux --mount --vhd "$Env:LOCALAPPDATA\ArchLinux\home.vhdx" --bare

if ($?) {
    Write-Output 'Your VHD was mounted successfully!'
} elseif ($err[1] -ne 'Error code: Wsl/Service/AttachDisk/MountVhd/WSL_E_USER_VHD_ALREADY_ATTACHED') {
    Write-Output $err
    exit 1
}

$Env:WSLENV += ':USERPROFILE/p:APPDATA/p:LOCALAPPDATA/p'

wsl -d ArchLinux --cd ~
