# Enable PowerShell as admin Then run it...

$mSInstallerCommand = (Get-Command msiexec.exe).Source

if (-not "$mSInstallerCommand") {
    Write-Error "msiexec executable is not found in `$PATH`nAWSCLI is not installed"
    exit 1
}

$url = "https://awscli.amazonaws.com/AWSCLIV2.msi"

Start-Process -FilePath "$mSInstallerCommand" -ArgumentList "/i", "$url" -Wait
