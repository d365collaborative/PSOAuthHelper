# Guide for available variables and working with secrets:
# https://docs.microsoft.com/en-us/vsts/build-release/concepts/definitions/build/variables?tabs=powershell

# Needs to ensure things are Done Right and only legal commits to master get built

# Run internal pester tests

Import-Module "Pester" -MaximumVersion 4.99.99 -Force
& "$PSScriptRoot\..\PSOAuthHelper\tests\pester.ps1"