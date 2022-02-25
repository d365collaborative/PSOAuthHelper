@{
	# Script module or binary module file associated with this manifest
	RootModule         = 'PSOAuthHelper.psm1'

	# Version number of this module.
	ModuleVersion      = '0.3.1'
	
	# ID used to uniquely identify this module
	GUID               = 'c2de095c-331d-4568-833f-e70bedc8fa5e'
	
	# Author of this module
	Author             = 'Mötz Jensen'
	
	# Company or vendor of this module
	CompanyName        = ''
	
	# Copyright statement for this module
	Copyright          = '(c) 2019 Mötz Jensen. All rights reserved.'
	
	# Description of the functionality provided by this module
	Description        = 'A simple module that helps you with all the dirty details while trying to authenticate against different OAuth 2.0 endpoints.'
	
	# Minimum version of the Windows PowerShell engine required by this module
	PowerShellVersion  = '5.0'
	
	# Modules that must be imported into the global environment prior to importing
	# this module
	RequiredModules    = @(
		@{ ModuleName = 'PSFramework'; ModuleVersion = '1.0.0' }
	)
	
	# Assemblies that must be loaded prior to importing this module
	RequiredAssemblies = @(
		'System.Web'
		, 'System.Net.Http')
	
	# Type files (.ps1xml) to be loaded when importing this module
	# TypesToProcess = @('xml\PSOAuthHelper.Types.ps1xml')
	
	# Format files (.ps1xml) to be loaded when importing this module
	# FormatsToProcess = @('xml\PSOAuthHelper.Format.ps1xml')
	
	# Functions to export from this module
	FunctionsToExport  = @(
		'Get-BearerToken',
		'Get-RemainingMinutes',

		'Invoke-AzureResourceManagementGrant',
		'Invoke-ClientCredentialsGrant',
		'Invoke-PasswordGrant',
		'Invoke-RefreshToken',

		'New-AuthorizationHeaderBearerToken'
	)
	
	# Cmdlets to export from this module
	CmdletsToExport    = ''
	
	# Variables to export from this module
	VariablesToExport  = ''
	
	# Aliases to export from this module
	AliasesToExport    = ''
	
	# List of all modules packaged with this module
	ModuleList         = @()
	
	# List of all files packaged with this module
	FileList           = @()
	
	# Private data to pass to the module specified in ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
	PrivateData        = @{
		
		#Support for PowerShellGet galleries.
		PSData = @{
			
			# Tags applied to this module. These help with module discovery in online galleries.
			Tags         = @('OAuth', 'OAuth2.0', 'GrantType', 'Token', 'Bearer')
			
			# A URL to the license for this module.
			LicenseUri   = "https://opensource.org/licenses/MIT"
			
			# A URL to the main website for this project.
			ProjectUri   = 'https://github.com/d365collaborative/PSOAuthHelper'
			
			# A URL to an icon representing this module.
			# IconUri = ''
			
			# ReleaseNotes of this module
			# ReleaseNotes = ''

			# Indicates this is a pre-release/testing version of the module.
			IsPrerelease = 'True'
			
		} # End of PSData hashtable
		
	} # End of PrivateData hashtable
}