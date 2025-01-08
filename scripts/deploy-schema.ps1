# deploy-schema.ps1
param (
    [string]$ServerName,
    [string]$DatabaseName,
    [string]$SchemaFilePath
)

Write-Host "Deploying schema to database $DatabaseName on server $ServerName"

try {
    $schemaScript = Get-Content -Path $SchemaFilePath
    sqlcmd -S $ServerName -d $DatabaseName -Q $schemaScript
    Write-Host "Schema deployment completed successfully."
} catch {
    Write-Error "Error during schema deployment: $_"
    exit 1
}
