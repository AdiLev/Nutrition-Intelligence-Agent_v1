# Frontend Startup Script
Write-Host "Building and Starting Frontend..." -ForegroundColor Green
cd $PSScriptRoot\frontend

# Check if Node.js is available
try {
    $nodeVersion = node --version
    Write-Host "Node.js version: $nodeVersion" -ForegroundColor Cyan
    
    # Build the frontend
    Write-Host "Building frontend..." -ForegroundColor Yellow
    npm run build
    
    # Start preview server
    Write-Host "Starting preview server..." -ForegroundColor Yellow
    npm run preview
} catch {
    Write-Host "ERROR: Node.js is not installed or not in PATH." -ForegroundColor Red
    Write-Host "Please install Node.js from https://nodejs.org/" -ForegroundColor Yellow
    Write-Host "After installation, restart your terminal and run this script again." -ForegroundColor Yellow
    exit 1
}

