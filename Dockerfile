# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# copy csproj ของ project หลัก
COPY local.net.csproj ./
RUN dotnet restore

# copy source code
COPY . ./

# build project-level
RUN dotnet publish local.net.csproj -c Release -o out

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/out ./
EXPOSE 80
ENTRYPOINT ["dotnet", "local.net.dll"]
