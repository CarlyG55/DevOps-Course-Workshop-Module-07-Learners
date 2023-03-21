FROM mcr.microsoft.com/dotnet/sdk:6.0
RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash - &&\
apt-get install -y nodejs
COPY . ./
RUN dotnet build
RUN cd DotnetTemplate.Web && npm install && npm run build
ENTRYPOINT cd DotnetTemplate.Web && dotnet run