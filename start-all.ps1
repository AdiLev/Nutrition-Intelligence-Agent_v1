# Start Both Frontend and Backend
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Nutrition Intelligence Agent" -ForegroundColor Cyan
Write-Host "  Starting Backend and Frontend" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Start backend in background
Write-Host "Starting Backend Server on port 8000..." -ForegroundColor Green
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\backend'; python -m uvicorn main:app --host 0.0.0.0 --port 8000 --reload" -WindowStyle Normal

# Wait a moment for backend to start
Start-Sleep -Seconds 3

# Start frontend
Write-Host "Starting Frontend..." -ForegroundColor Green
cd $PSScriptRoot\frontend

# Check if Node.js is available
try {
    $nodeVersion = node --version
    Write-Host "Node.js version: $nodeVersion" -ForegroundColor Cyan
    
    # Check if build exists, if not build it
    if (-not (Test-Path "dist")) {
        Write-Host "Building frontend (first time)..." -ForegroundColor Yellow
        npm run build
    }
    
    # Start preview server
    Write-Host "Starting frontend preview server..." -ForegroundColor Yellow
    npm run preview
} catch {
    Write-Host "ERROR: Node.js is not installed or not in PATH." -ForegroundColor Red
    Write-Host "Please install Node.js from https://nodejs.org/" -ForegroundColor Yellow
    Write-Host "After installation, restart your terminal and run this script again." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Backend is running in a separate window." -ForegroundColor Cyan
    exit 1
}

