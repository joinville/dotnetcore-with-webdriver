# dotnetcore-with-webdriver
.NET Core SDK image with chrome webdriver to run integrated tests with selenium

## How to use
In your CI add the buid steps if needed and run
```yaml
script:
  - dotnet run -p src/MyProject/MyProject.csproj > /tmp/dotnet.log & sleep 30s
  - dotnet test test/MyProject.Integrated.csproj
```
