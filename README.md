# webapp001

A lightweight public HTTPS web app hosted on Azure App Service (Windows).

## Architecture
- Runtime: .NET 8 (ASP.NET Core)
- Hosting: Azure App Service (Windows, westus2)
- Infrastructure: Terraform (azurerm)
- CI/CD: GitHub Actions with OIDC authentication (no client secrets)
- Resource Group: webapp001-rg

## Deployment Flow
1. Push to `main` branch
2. GitHub Actions triggers workflow
3. Authenticates to Azure via OIDC (no secrets stored)
4. Terraform provisions/updates infrastructure
5. .NET app is built and published
6. Deployed to Azure App Service via zip deploy

## Local Development
```bash
cd src/WebApp001
dotnet run
```
