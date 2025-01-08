# Azure DevOps Database Automation

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
