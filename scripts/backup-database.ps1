# backup-database.ps1
param (
    [string]$ServerName,
    [string]$DatabaseName,
    [string]$BackupPath
)

Write-Host "Backing up database $DatabaseName on server $ServerName to $BackupPath"

try {
    $backupCommand = "BACKUP DATABASE [$DatabaseName] TO DISK = N'$BackupPath' WITH INIT"
    sqlcmd -S $ServerName -Q $backupCommand
    Write-Host "Backup completed successfully."
} catch {
    Write-Error "Error during backup: $_"
    exit 1
}
