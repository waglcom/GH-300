# GH-300 Architecture and Functionality Guide

## Overview

GH-300 is a demonstration project for educational purposes (GH-300 수업 데모용) that showcases a simple client-server architecture using .NET 8.0. The project consists of two main components that demonstrate API development and consumption patterns.

## Project Architecture

```
GH-300/
├── WebApi/              # ASP.NET Core Minimal API Server
│   ├── Program.cs       # API endpoints and configuration
│   ├── WebApi.csproj    # Project file with dependencies
│   ├── wwwroot/         # Static web content
│   │   └── health.html  # Interactive API testing interface
│   ├── readme.html      # Project structure documentation
│   └── WebApi.http      # HTTP request samples for testing
└── ConsoleApp/          # .NET Console Application Client
    ├── Program.cs       # HTTP client implementation
    └── ConsoleApp.csproj # Project file
```

## Key Components

### 1. WebApi (ASP.NET Core Minimal API)

The WebApi serves as the backend server providing RESTful endpoints. It demonstrates modern .NET minimal API patterns.

#### Features:
- **Minimal API Architecture**: Uses .NET 8.0 minimal APIs for lightweight, performance-focused endpoints
- **Swagger Integration**: Automatic API documentation and testing interface
- **Static File Serving**: Hosts web content including health monitoring interface
- **CORS Ready**: Configured for cross-origin requests

#### API Endpoints:

##### `/cities` [GET]
- **Purpose**: Returns a list of 10 major Korean cities
- **Response**: JSON array of city names
- **Example Response**:
```json
["Seoul","Busan","Incheon","Daegu","Daejeon","Gwangju","Suwon","Ulsan","Changwon","Goyang"]
```

##### `/weatherforecast` [GET]
- **Purpose**: Provides sample weather forecast data
- **Response**: JSON array of weather forecasts for the next 5 days
- **Example Response**:
```json
[
  {
    "date": "2025-09-11",
    "temperatureC": 21,
    "summary": "Mild",
    "temperatureF": 69
  }
]
```

##### `/health` [GET]
- **Purpose**: Simple health check endpoint
- **Response**: Plain text "Healthy" status
- **Use Case**: Application monitoring and load balancer health checks

#### Dependencies:
- `Microsoft.AspNetCore.OpenApi` (8.0.19) - OpenAPI/Swagger support
- `Swashbuckle.AspNetCore` (6.6.2) - Swagger UI generation

### 2. ConsoleApp (.NET Console Application)

The ConsoleApp demonstrates how to consume the WebApi services using HTTP client patterns.

#### Features:
- **HTTP Client Usage**: Shows proper HttpClient implementation with dependency injection patterns
- **JSON Deserialization**: Demonstrates parsing JSON responses using System.Text.Json
- **Error Handling**: Includes try-catch blocks for network and parsing errors
- **Async/Await Patterns**: Uses modern asynchronous programming techniques

#### Functionality:
1. Creates an HttpClient instance
2. Makes GET request to `http://localhost:5000/cities`
3. Deserializes JSON response to string array
4. Displays cities in Korean with formatted output
5. Handles connection and parsing errors gracefully

#### Code Structure:
```csharp
// HTTP client creation and API call
using var httpClient = new HttpClient();
var cities = await httpClient.GetFromJsonAsync<string[]>(apiUrl);

// Display results with Korean text
Console.WriteLine("도시 리스트:");
foreach (var city in cities)
{
    Console.WriteLine("- " + city);
}
```

### 3. Web Interface (health.html)

An interactive web-based testing interface for the API endpoints.

#### Features:
- **Real-time Health Monitoring**: Shows API status with visual indicators
- **Interactive Testing**: Buttons to test each API endpoint
- **Response Display**: Shows formatted JSON responses
- **Korean Localization**: Interface text in Korean for educational context
- **Responsive Design**: Clean, modern UI with CSS styling

#### Functionality:
- Green/Red status indicators for API health
- Test buttons for Cities, Weather, and Health endpoints
- Real-time timestamp updates
- Formatted JSON response display
- Error handling with user-friendly messages

## Technical Specifications

### Runtime Environment:
- **.NET 8.0**: Latest LTS version of .NET
- **C# 12**: Modern C# language features
- **Minimal APIs**: Lightweight API development approach

### Configuration:
- **Development Port**: 5000 (HTTP)
- **CORS**: Enabled for cross-origin requests
- **Swagger**: Available in development environment
- **Static Files**: Enabled for serving web content

### Build and Deployment:
- Standard .NET CLI commands (`dotnet build`, `dotnet run`)
- Self-contained deployment options available
- Docker containerization ready

## Usage Examples

### Starting the WebApi:
```bash
cd WebApi
dotnet run
# Server starts on http://localhost:5000
```

### Running the Console Client:
```bash
cd ConsoleApp
dotnet run
# Displays city list from API
```

### Testing the API:
1. **Browser**: Navigate to `http://localhost:5000/health.html`
2. **Curl**: `curl http://localhost:5000/cities`
3. **Swagger**: `http://localhost:5000/swagger` (development only)

## Educational Value

This project demonstrates:

1. **API Development**: RESTful service creation with minimal APIs
2. **HTTP Client Programming**: Consuming APIs from .NET applications
3. **JSON Processing**: Serialization and deserialization patterns
4. **Error Handling**: Network and parsing error management
5. **Modern .NET Patterns**: Async/await, minimal APIs, dependency injection
6. **Web Interface Development**: Interactive API testing tools
7. **Project Structure**: Proper separation of concerns

## Architecture Benefits

- **Simplicity**: Minimal codebase for easy understanding
- **Modern Patterns**: Uses current .NET best practices
- **Testability**: Clear separation between client and server
- **Extensibility**: Easy to add new endpoints or clients
- **Documentation**: Self-documenting with Swagger integration
- **Monitoring**: Built-in health checks and web interface

This architecture serves as an excellent foundation for learning web API development and consumption patterns in modern .NET applications.