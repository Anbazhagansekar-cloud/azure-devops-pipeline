# restore-database.ps1
param (
    [string]$ServerName,
    [string]$DatabaseName,
    [string]$BackupPath
)

Write-Host "Restoring database $DatabaseName on server $ServerName from $BackupPath"

try {
    $restoreCommand = "RESTORE DATABASE [$DatabaseName] FROM DISK = N'$BackupPath' WITH RECOVERY"
    sqlcmd -S $ServerName -Q $restoreCommand
    Write-Host "Restore completed successfully."
} catch {
    Write-Error "Error during restore: $_"
    exit 1
}
