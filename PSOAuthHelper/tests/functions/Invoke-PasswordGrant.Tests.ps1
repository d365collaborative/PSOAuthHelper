Describe "Invoke-PasswordGrant Unit Tests" -Tag "Unit" {
	BeforeAll {
		# Place here all things needed to prepare for the tests
	}
	AfterAll {
		# Here is where all the cleanup tasks go
	}
	
	Describe "Ensuring unchanged command signature" {
		It "should have the expected parameter sets" {
			(Get-Command Invoke-PasswordGrant).ParameterSets.Name | Should -Be 'Default', 'v2', 'v1'
		}
		
		It 'Should have the expected parameter AuthProviderUri' {
			$parameter = (Get-Command Invoke-PasswordGrant).Parameters['AuthProviderUri']
			$parameter.Name | Should -Be 'AuthProviderUri'
			$parameter.ParameterType.ToString() | Should -Be System.String
			$parameter.IsDynamic | Should -Be $False
			$parameter.ParameterSets.Keys | Should -Be 'Default'
			$parameter.ParameterSets.Keys | Should -Contain 'Default'
			$parameter.ParameterSets['Default'].IsMandatory | Should -Be $True
			$parameter.ParameterSets['Default'].Position | Should -Be -2147483648
			$parameter.ParameterSets['Default'].ValueFromPipeline | Should -Be $False
			$parameter.ParameterSets['Default'].ValueFromPipelineByPropertyName | Should -Be $False
			$parameter.ParameterSets['Default'].ValueFromRemainingArguments | Should -Be $False
		}
		It 'Should have the expected parameter Resource' {
			$parameter = (Get-Command Invoke-PasswordGrant).Parameters['Resource']
			$parameter.Name | Should -Be 'Resource'
			$parameter.ParameterType.ToString() | Should -Be System.String
			$parameter.IsDynamic | Should -Be $False
			$parameter.ParameterSets.Keys | Should -Be 'v2', 'v1', 'Default'
			$parameter.ParameterSets.Keys | Should -Contain 'v2'
			$parameter.ParameterSets['v2'].IsMandatory | Should -Be $False
			$parameter.ParameterSets['v2'].Position | Should -Be -2147483648
			$parameter.ParameterSets['v2'].ValueFromPipeline | Should -Be $False
			$parameter.ParameterSets['v2'].ValueFromPipelineByPropertyName | Should -Be $False
			$parameter.ParameterSets['v2'].ValueFromRemainingArguments | Should -Be $False
			$parameter.ParameterSets.Keys | Should -Contain 'v1'
			$parameter.ParameterSets['v1'].IsMandatory | Should -Be $True
			$parameter.ParameterSets['v1'].Position | Should -Be -2147483648
			$parameter.ParameterSets['v1'].ValueFromPipeline | Should -Be $False
			$parameter.ParameterSets['v1'].ValueFromPipelineByPropertyName | Should -Be $False
			$parameter.ParameterSets['v1'].ValueFromRemainingArguments | Should -Be $False
			$parameter.ParameterSets.Keys | Should -Contain 'Default'
			$parameter.ParameterSets['Default'].IsMandatory | Should -Be $True
			$parameter.ParameterSets['Default'].Position | Should -Be -2147483648
			$parameter.ParameterSets['Default'].ValueFromPipeline | Should -Be $False
			$parameter.ParameterSets['Default'].ValueFromPipelineByPropertyName | Should -Be $False
			$parameter.ParameterSets['Default'].ValueFromRemainingArguments | Should -Be $False
		}
		It 'Should have the expected parameter ClientId' {
			$parameter = (Get-Command Invoke-PasswordGrant).Parameters['ClientId']
			$parameter.Name | Should -Be 'ClientId'
			$parameter.ParameterType.ToString() | Should -Be System.String
			$parameter.IsDynamic | Should -Be $False
			$parameter.ParameterSets.Keys | Should -Be '__AllParameterSets'
			$parameter.ParameterSets.Keys | Should -Contain '__AllParameterSets'
			$parameter.ParameterSets['__AllParameterSets'].IsMandatory | Should -Be $True
			$parameter.ParameterSets['__AllParameterSets'].Position | Should -Be -2147483648
			$parameter.ParameterSets['__AllParameterSets'].ValueFromPipeline | Should -Be $False
			$parameter.ParameterSets['__AllParameterSets'].ValueFromPipelineByPropertyName | Should -Be $False
			$parameter.ParameterSets['__AllParameterSets'].ValueFromRemainingArguments | Should -Be $False
		}
		It 'Should have the expected parameter Username' {
			$parameter = (Get-Command Invoke-PasswordGrant).Parameters['Username']
			$parameter.Name | Should -Be 'Username'
			$parameter.ParameterType.ToString() | Should -Be System.String
			$parameter.IsDynamic | Should -Be $False
			$parameter.ParameterSets.Keys | Should -Be '__AllParameterSets'
			$parameter.ParameterSets.Keys | Should -Contain '__AllParameterSets'
			$parameter.ParameterSets['__AllParameterSets'].IsMandatory | Should -Be $True
			$parameter.ParameterSets['__AllParameterSets'].Position | Should -Be -2147483648
			$parameter.ParameterSets['__AllParameterSets'].ValueFromPipeline | Should -Be $False
			$parameter.ParameterSets['__AllParameterSets'].ValueFromPipelineByPropertyName | Should -Be $False
			$parameter.ParameterSets['__AllParameterSets'].ValueFromRemainingArguments | Should -Be $False
		}
		It 'Should have the expected parameter Password' {
			$parameter = (Get-Command Invoke-PasswordGrant).Parameters['Password']
			$parameter.Name | Should -Be 'Password'
			$parameter.ParameterType.ToString() | Should -Be System.String
			$parameter.IsDynamic | Should -Be $False
			$parameter.ParameterSets.Keys | Should -Be '__AllParameterSets'
			$parameter.ParameterSets.Keys | Should -Contain '__AllParameterSets'
			$parameter.ParameterSets['__AllParameterSets'].IsMandatory | Should -Be $True
			$parameter.ParameterSets['__AllParameterSets'].Position | Should -Be -2147483648
			$parameter.ParameterSets['__AllParameterSets'].ValueFromPipeline | Should -Be $False
			$parameter.ParameterSets['__AllParameterSets'].ValueFromPipelineByPropertyName | Should -Be $False
			$parameter.ParameterSets['__AllParameterSets'].ValueFromRemainingArguments | Should -Be $False
		}
		It 'Should have the expected parameter TenantId' {
			$parameter = (Get-Command Invoke-PasswordGrant).Parameters['TenantId']
			$parameter.Name | Should -Be 'TenantId'
			$parameter.ParameterType.ToString() | Should -Be System.String
			$parameter.IsDynamic | Should -Be $False
			$parameter.ParameterSets.Keys | Should -Be 'v2', 'v1'
			$parameter.ParameterSets.Keys | Should -Contain 'v2'
			$parameter.ParameterSets['v2'].IsMandatory | Should -Be $True
			$parameter.ParameterSets['v2'].Position | Should -Be -2147483648
			$parameter.ParameterSets['v2'].ValueFromPipeline | Should -Be $False
			$parameter.ParameterSets['v2'].ValueFromPipelineByPropertyName | Should -Be $False
			$parameter.ParameterSets['v2'].ValueFromRemainingArguments | Should -Be $False
			$parameter.ParameterSets.Keys | Should -Contain 'v1'
			$parameter.ParameterSets['v1'].IsMandatory | Should -Be $True
			$parameter.ParameterSets['v1'].Position | Should -Be -2147483648
			$parameter.ParameterSets['v1'].ValueFromPipeline | Should -Be $False
			$parameter.ParameterSets['v1'].ValueFromPipelineByPropertyName | Should -Be $False
			$parameter.ParameterSets['v1'].ValueFromRemainingArguments | Should -Be $False
		}
		It 'Should have the expected parameter Scope' {
			$parameter = (Get-Command Invoke-PasswordGrant).Parameters['Scope']
			$parameter.Name | Should -Be 'Scope'
			$parameter.ParameterType.ToString() | Should -Be System.String
			$parameter.IsDynamic | Should -Be $False
			$parameter.ParameterSets.Keys | Should -Be 'v2', 'v1', 'Default'
			$parameter.ParameterSets.Keys | Should -Contain 'v2'
			$parameter.ParameterSets['v2'].IsMandatory | Should -Be $True
			$parameter.ParameterSets['v2'].Position | Should -Be -2147483648
			$parameter.ParameterSets['v2'].ValueFromPipeline | Should -Be $False
			$parameter.ParameterSets['v2'].ValueFromPipelineByPropertyName | Should -Be $False
			$parameter.ParameterSets['v2'].ValueFromRemainingArguments | Should -Be $False
			$parameter.ParameterSets.Keys | Should -Contain 'v1'
			$parameter.ParameterSets['v1'].IsMandatory | Should -Be $False
			$parameter.ParameterSets['v1'].Position | Should -Be -2147483648
			$parameter.ParameterSets['v1'].ValueFromPipeline | Should -Be $False
			$parameter.ParameterSets['v1'].ValueFromPipelineByPropertyName | Should -Be $False
			$parameter.ParameterSets['v1'].ValueFromRemainingArguments | Should -Be $False
			$parameter.ParameterSets.Keys | Should -Contain 'Default'
			$parameter.ParameterSets['Default'].IsMandatory | Should -Be $False
			$parameter.ParameterSets['Default'].Position | Should -Be -2147483648
			$parameter.ParameterSets['Default'].ValueFromPipeline | Should -Be $False
			$parameter.ParameterSets['Default'].ValueFromPipelineByPropertyName | Should -Be $False
			$parameter.ParameterSets['Default'].ValueFromRemainingArguments | Should -Be $False
		}
		It 'Should have the expected parameter AuthEndpointV1' {
			$parameter = (Get-Command Invoke-PasswordGrant).Parameters['AuthEndpointV1']
			$parameter.Name | Should -Be 'AuthEndpointV1'
			$parameter.ParameterType.ToString() | Should -Be System.Management.Automation.SwitchParameter
			$parameter.IsDynamic | Should -Be $False
			$parameter.ParameterSets.Keys | Should -Be 'v1'
			$parameter.ParameterSets.Keys | Should -Contain 'v1'
			$parameter.ParameterSets['v1'].IsMandatory | Should -Be $True
			$parameter.ParameterSets['v1'].Position | Should -Be -2147483648
			$parameter.ParameterSets['v1'].ValueFromPipeline | Should -Be $False
			$parameter.ParameterSets['v1'].ValueFromPipelineByPropertyName | Should -Be $False
			$parameter.ParameterSets['v1'].ValueFromRemainingArguments | Should -Be $False
		}
		It 'Should have the expected parameter AuthEndpointV2' {
			$parameter = (Get-Command Invoke-PasswordGrant).Parameters['AuthEndpointV2']
			$parameter.Name | Should -Be 'AuthEndpointV2'
			$parameter.ParameterType.ToString() | Should -Be System.Management.Automation.SwitchParameter
			$parameter.IsDynamic | Should -Be $False
			$parameter.ParameterSets.Keys | Should -Be 'v2'
			$parameter.ParameterSets.Keys | Should -Contain 'v2'
			$parameter.ParameterSets['v2'].IsMandatory | Should -Be $True
			$parameter.ParameterSets['v2'].Position | Should -Be -2147483648
			$parameter.ParameterSets['v2'].ValueFromPipeline | Should -Be $False
			$parameter.ParameterSets['v2'].ValueFromPipelineByPropertyName | Should -Be $False
			$parameter.ParameterSets['v2'].ValueFromRemainingArguments | Should -Be $False
		}
		It 'Should have the expected parameter EnableException' {
			$parameter = (Get-Command Invoke-PasswordGrant).Parameters['EnableException']
			$parameter.Name | Should -Be 'EnableException'
			$parameter.ParameterType.ToString() | Should -Be System.Management.Automation.SwitchParameter
			$parameter.IsDynamic | Should -Be $False
			$parameter.ParameterSets.Keys | Should -Be '__AllParameterSets'
			$parameter.ParameterSets.Keys | Should -Contain '__AllParameterSets'
			$parameter.ParameterSets['__AllParameterSets'].IsMandatory | Should -Be $False
			$parameter.ParameterSets['__AllParameterSets'].Position | Should -Be -2147483648
			$parameter.ParameterSets['__AllParameterSets'].ValueFromPipeline | Should -Be $False
			$parameter.ParameterSets['__AllParameterSets'].ValueFromPipelineByPropertyName | Should -Be $False
			$parameter.ParameterSets['__AllParameterSets'].ValueFromRemainingArguments | Should -Be $False
		}
	}
	
	Describe "Testing parameterset Default" {
		<#
		Default -AuthProviderUri -Resource -ClientId -Username -Password
		Default -AuthProviderUri -Resource -ClientId -Username -Password -Scope -EnableException
		#>
	}
 	Describe "Testing parameterset v2" {
		<#
		v2 -ClientId -Username -Password -TenantId -Scope -AuthEndpointV2
		v2 -Resource -ClientId -Username -Password -TenantId -Scope -AuthEndpointV2 -EnableException
		#>
	}
 	Describe "Testing parameterset v1" {
		<#
		v1 -Resource -ClientId -Username -Password -TenantId -AuthEndpointV1
		v1 -Resource -ClientId -Username -Password -TenantId -Scope -AuthEndpointV1 -EnableException
		#>
	}

}