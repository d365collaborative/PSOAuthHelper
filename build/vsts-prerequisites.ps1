$modules = @("PSFramework", "PSScriptAnalyzer")

foreach ($module in $modules) {
    Write-Host "Installing $module" -ForegroundColor Cyan
    Install-Module $module -Force -SkipPublisherCheck
    Import-Module $module -Force -PassThru
}

Import-Module "Pester" -MaximumVersion 4.99.99 -Force