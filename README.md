# dotnetcore-with-webdriver
.NET Core SDK image with chrome webdriver to run integrated tests with selenium

## How to use with CI
Snippet of a gitlab-ci sample:

```yaml
integrated_test:
  stage: tests
  tags:
    - docker
  only:
    - branches
  image: joinville/dotnetcore-with-webdriver:0.1.1
  script:
    - dotnet run -p src/MyProject/MyProject.csproj > /tmp/dotnet.log & sleep 30s
    - dotnet test test/MyProject.Integrated.csproj
```

## How to use with docker
Should execute something like this in the project folder

```bash
  docker run -it -v $PWD:/app joinville/dotnetcore-with-webdriver:2.1-sdk-jessie /bin/bash -e -c "
    dotnet run -p src/MyProject/MyProject.csproj > /tmp/dotnet.log & sleep 30s;
    dotnet test test/MyProject.Integrated.csproj
    exit 0;"
```
