#!/bin/bash

# GH-300 Demo Quick Start Script
# This script helps you quickly run the demonstration

echo "🚀 GH-300 Demo Quick Start"
echo "=========================="
echo ""

# Check if .NET is installed
if ! command -v dotnet &> /dev/null; then
    echo "❌ .NET is not installed. Please install .NET 8.0 or later."
    echo "Download from: https://dotnet.microsoft.com/download"
    exit 1
fi

# Display .NET version
echo "✅ .NET version: $(dotnet --version)"
echo ""

# Build projects
echo "🔨 Building projects..."
echo ""

echo "Building WebApi..."
cd WebApi
dotnet build --configuration Release
if [ $? -ne 0 ]; then
    echo "❌ Failed to build WebApi"
    exit 1
fi
cd ..

echo "Building ConsoleApp..."
cd ConsoleApp
dotnet build --configuration Release
if [ $? -ne 0 ]; then
    echo "❌ Failed to build ConsoleApp"
    exit 1
fi
cd ..

echo ""
echo "✅ All projects built successfully!"
echo ""

# Instructions
echo "📖 How to run the demo:"
echo ""
echo "1. Start the WebApi server:"
echo "   cd WebApi && dotnet run"
echo "   Server will start at: http://localhost:5000"
echo ""
echo "2. In another terminal, run the ConsoleApp client:"
echo "   cd ConsoleApp && dotnet run"
echo ""
echo "3. Test the web interface:"
echo "   Open browser to: http://localhost:5000/health.html"
echo ""
echo "4. Test API endpoints:"
echo "   curl http://localhost:5000/cities"
echo "   curl http://localhost:5000/weatherforecast"
echo "   curl http://localhost:5000/health"
echo ""
echo "📚 For detailed documentation, see ARCHITECTURE.md"
echo ""
echo "🎯 Happy learning!"