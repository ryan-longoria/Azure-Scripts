# Connect to MgGraph
try {
	Connect-MgGraph -Scops "IdentityRiskEvent.Read.All","IdentityRiskyUser.Read.All" -NoWelcome
}
catch {
	Write-Error -Message "Unable to add roles/permissions"
}

$ Connect to AzureAD
try {
	Connect-AzureAD -AzureEnvironment ""

# Get all risky users
$riskyUsers = Get-MgRiskyUser -Filter "RiskLevel eq 'high'" | Format-Table UserDisplayName, RiskDetail, RiskLevel, RiskLastUpdatedDateTime

