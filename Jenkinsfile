pipeline {
  agent { label 'avh' }

  stages {
    stage('Setup') {
      steps {
        powershell '''
          echo Installing vcpkg...
          # rm -Recurse -Force $env:USERPROFILE\\.vcpkg
          iex (iwr -useb https://aka.ms/vcpkg-init.ps1)
          '''
      }
    }

    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build') {
      steps {
        powershell '''
          . .\\activate.ps1
          armlm activate -product KEMDK-COM0 -server https://mdk-preview.keil.arm.com
          .\\build.ps1
          '''
      }
    }

    stage('Test') {
      steps {
        powershell '''
          . .\\activate
          .\\test.ps1
          Write-Host "Converting log to junit..."
          py -m pip install junit_reporter
          py Project\\report.py Project.avh.log
          '''
      }
      post {
        always {
          // Publish test results
          junit 'Project.avh.xml'
        }
      }
    }
  }
}
