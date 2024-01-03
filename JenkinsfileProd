pipeline {
    agent any
    environment{
        github_branch = "PINKTEAM-17-configure-nginx-for-frontend"
        github_url = "https://github.com/TEAMPINKIDRN/class-schedule-frontend.git"
        nexus_url = "nexus-registry.hrtov.xyz"
        image_name = "nexus-registry.hrtov.xyz/stage/front"
        nexus_user = credentials('nexus_user')
        repo_url = "https://nexus-registry.hrtov.xyz/service/rest/repository/browse/stage/v2/stage/front/tags/"
        
      }
    stages {
        stage('Fetch code') {
            steps {
                git branch: "${github_branch}", url: "${github_url}"
                echo "Push made to branch: ${env.BRANCH_NAME}"
                sh 'docker build . -t "$image_name"'
                
            }
      }
        stage('Start script'){
        steps {
          script {
                
                sh 'docker login -u "${nexus_user_USR}" -p "${nexus_user_PSW}"  "${nexus_url}"'
                
                
                }
        }
      }	
      stage('Fetch script'){
        steps {
          script {
                sh 'message=$(git log --pretty=format:%s -n 1)' 
                git branch: 'PINK-versions', url: 'https://github.com/MaksymukNatalia/Schedule.git'
                sh 'chmod +x ./new_version.sh'
                sh './new_version.sh "$repo_url"  "$image_name" "$message"'
               
                
                }
        }
      }	
      
      
    }

    
}
