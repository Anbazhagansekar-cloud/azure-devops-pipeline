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
