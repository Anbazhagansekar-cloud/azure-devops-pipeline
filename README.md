# Azure DevOps Database Automation


The steps you outlined for migrating a local SQL Server database to an on-premises SQL Server using Azure Pipelines are thorough. Below is a slightly streamlined version of the process, with clear YAML pipeline code snippets and best practices:

# Prerequisites
Install Azure DevOps Agent on On-Premises Server:

Install the self-hosted Azure DevOps Agent on your on-premises SQL Server machine. Follow the official guide.
Ensure the agent has sufficient permissions to:
Run commands on the SQL Server.
Access the network for file transfer, if required.
Create a Service Connection:

# In Azure DevOps:
Go to Project Settings > Service Connections.
Add a SQL Server connection with the necessary credentials and access.

## Overview
This project automates SQL Server database backup, restore, and schema deployment using PowerShell scripts and Azure DevOps pipelines.

## Folder Structure
- `/scripts/`: Contains PowerShell scripts for backup, restore, and schema deployment.
- `/pipelines/`: Contains Azure DevOps pipeline YAML definitions.

## Prerequisites
1. Install a self-hosted Azure DevOps agent on the on-premises server.
2. Create a service connection for SQL Server in Azure DevOps.

## Steps to Use
1. Clone this repository.
2. Update the YAML pipeline file with your database details.
3. Commit changes to trigger the pipeline.

## Scripts
- `backup-database.ps1`: Backs up the SQL Server database.
- `restore-database.ps1`: Restores the database on the on-premises server.
- `deploy-schema.ps1`: Deploys schema changes.

==========================================================================================================================

1. CopyFilesOverSSH@0
This task transfers the schema file from the Azure DevOps agent to the on-premises SQL Server.

sshEndpoint: The SSH service connection configured in Azure DevOps for the on-premises server.
Create this connection in Project Settings > Service Connections > SSH.
sourceFolder: The folder in the repository containing schema files.
targetFolder: The destination folder on the target server where schema files will be stored.
2. PowerShell Script to Deploy Schema
The deploy-schema.ps1 script is executed on the on-premises server after transferring the schema file.

powershell
Copy code
# deploy-schema.ps1
param (
    [string]$ServerName,
    [string]$DatabaseName,
    [string]$SchemaFilePath
)

Write-Host "Deploying schema to database $DatabaseName on server $ServerName using $SchemaFilePath"

try {
    $schemaScript = Get-Content -Path $SchemaFilePath
    sqlcmd -S $ServerName -d $DatabaseName -Q $schemaScript
    Write-Host "Schema deployment completed successfully."
} catch {
    Write-Error "Error during schema deployment: $_"
    exit 1
}
Prerequisites for File Transfer
Set Up SSH on the Target Server:

Install an SSH server on the on-premises SQL Server machine (e.g., OpenSSH).
Configure SSH access for the Azure DevOps agent with the necessary credentials or key-based authentication.
Create an SSH Service Connection:

Go to Project Settings > Service Connections in Azure DevOps.
Create an SSH connection and provide the username, password, or SSH key for the target server.
Key Workflow
Backup Stage:

Backs up the database locally and publishes the backup as a build artifact.
Restore Stage:

Downloads the backup and restores it to the on-premises SQL Server.
DeploySchema Stage:

Transfers the schema file to the on-premises SQL Server.
Executes the schema deployment script using PowerShell.
Validation
Monitor the TransferSchemaFile job logs to confirm that the schema file is successfully copied.
Verify the DeploySchema job logs to ensure the schema script runs without errors.
Check the target SQL Server to validate the applied schema updates.

