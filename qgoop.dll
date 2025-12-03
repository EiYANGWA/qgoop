# ใช้ image .NET SDK สำหรับ build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# copy csproj และ restore
COPY *.csproj ./
RUN dotnet restore

# copy code และ build
COPY . ./
RUN dotnet publish -c Release -o out

# ใช้ runtime image เล็ก ๆ สำหรับรัน
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/out ./
EXPOSE 80
ENTRYPOINT ["dotnet", "qgoop.dll"]
