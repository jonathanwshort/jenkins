@echo off
REM Set Azure Cloud Environment to US Government
az cloud set --name AzureUSGovernment

echo Logging into Azure...
az login --service-principal -u %AZURE_CLIENT_ID% -p %AZURE_CLIENT_SECRET% -t %AZURE_TENANT_ID%

IF %ERRORLEVEL% EQU 0 (
    echo Logged into Azure successfully!
) ELSE (
    echo Failed to log into Azure.
    exit /b 1
)
