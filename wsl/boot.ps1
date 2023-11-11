#Requires -Version 6.0

[System.Console]::OutputEncoding = [Text.Encoding]::Unicode

$distro = 'ArchLinux'
$vhds = 'var.vhdx', 'home.vhdx'

$errCode = 'Wsl/Service/AttachDisk/MountVhd/WSL_E_USER_VHD_ALREADY_ATTACHED'

foreach ($vhd in $vhds) {
    $err = wsl -d $distro --mount --vhd "$env:LOCALAPPDATA\$distro\$vhd" --bare

    if ($?) {
        Write-Output "$vhd was mounted successfully!"
    } elseif ($err[1] -ne "Error code: $errCode") {
        Write-Output $err
        exit 1
    }
}

wsl -d $distro --cd ~
