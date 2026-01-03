# Backend Startup Script
Write-Host "Starting Backend Server..." -ForegroundColor Green
cd $PSScriptRoot\backend
python -m uvicorn main:app --host 0.0.0.0 --port 8000 --reload

