pipeline {
  agent none

  stages {
    stage('dotnet') {
      agent {
        docker { image 'mcr.microsoft.com/dotnet/sdk:6.0' }
      }
      environment {
        DOTNET_CLI_HOME = "/tmp/dotnet_cli_home"
        XDG_DATA_HOME = "/tmp"
      }
      steps {
        sh 'dotnet build'
        sh 'dotnet test'
      }
    }
    stage('npm') {
      agent {
        docker { image 'node:17-bullseye' }
      }
      steps {
        dir('cd DotnetTemplate.Web') {
          sh 'npm install'
          sh 'npm run build'
          sh 'npm run lint'
          sh 'npm t'
        }

      }
    }
  }
}