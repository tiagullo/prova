node {
    stage('scm') {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/tiagullo/prova.git']]])
    }
    stage('salt') {
        salt authtype: 'pam', clientInterface: local(arguments: '', function: 'test.ping', target: '*', targettype: 'glob'), credentialsId: '2752a406-6ffd-4a39-81f8-580336db5fd6', servername: 'http://192.168.50.10:8000'

    }
    stage('bat') {
        bat 'prova1.bat'

    }
}