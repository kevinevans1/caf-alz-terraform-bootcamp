<#
.SYNOPSIS
    Install tools on your computer quickly
.DESCRIPTION
    Install multiple tools on your computer to get up and running as soon as possible
.NOTES
    The following command need to be ran in a PowerShell elevated prompt before executing the script (in the same prompt) 'Set-ExecutionPolicy Bypass -Scope Process -Force '
    Name: Install-Components.ps1
    Created by: Maxime Roy
    Date: 10-06-2022
    License: MIT
#>

#Install WSL 2
#wsl --install

#Install Chocolatey
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install basic tools
choco install -y powershell-core microsoft-windows-terminal git gh vscode kubernetes-cli

# Install Azure Tools
choco install -y az.powershell azure-cli azcopy10 bicep vscode-azurerm-tools azurefunctions-vscode vscode-kubernetes-tools microsoftazurestorageexplorer azure-functions-core-tools azuredatastudio-powershell

# Install Docker
#choco install -y docker-desktop
