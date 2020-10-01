$modules = @("PSFramework", "PSScriptAnalyzer")

foreach ($module in $modules) {
    Write-Host "Installing $module" -ForegroundColor Cyan
    Install-Module $module -Force -SkipPublisherCheck
    Import-Module $module -Force -PassThru
}

Install-Module "Pester" -MaximumVersion 4.99.99 -Force -SkipPublisherCheck
Import-Module "Pester" -MaximumVersion 4.99.99 -Force -PassThru