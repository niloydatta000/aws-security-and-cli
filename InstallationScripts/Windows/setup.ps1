# Enable PowerShell as admin Then run it...


Start-Process -FilePath "msiexec.exe" -ArgumentList "/i", "https://awscli.amazonaws.com/AWSCLIV2.msi" -Wait