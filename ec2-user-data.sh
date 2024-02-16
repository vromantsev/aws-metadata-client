#!/bin/bash
sudo yum update -y

### Install Java 17
sudo yum install -y java-17-amazon-corretto-headless

JAVA_VERSION=$(java -version 2>&1 | grep "java version")

if [ "$JAVA_VERSION" == nill ];
then
  echo "Java is not installed. Exiting..."
  exit 1
else
  echo "Java installed successfully. Details: ${JAVA_VERSION}" 
fi


### Install maven
sudo yum install -y maven

MAVEN_VERSION=$(mvn -version 2>&1 | grep "Apache Maven")

if [ "$MAVEN_VERSION" == nill ];
then
  echo "Maven is not installed. Exiting..."
  exit 1
else
  echo "Maven installed successfully. Details: ${MAVEN_VERSION}" 
fi

### Install Git
sudo yum install -y git
GIT_VERSION=$(git --version)

if [ "$GIT_VERSION" == nill ]; 
then
  echo "Git was not installed. Exiting..."
  exit 1
else
  echo "Git installed successfully. Details: ${GIT_VERSION}"
fi

git clone https://github.com/vromantsev/aws-metadata-client.git

IS_PROJECT_DOWNLOADED=$(ls 2>&1 | grep "aws-metadata-client")

if [ "$IS_PROJECT_DOWNLOADED" == nill ];
then
  echo "Project was not downloaded. Exiting..."
  exit 1
else
  echo "Project ${IS_PROJECT_DOWNLOADED} downloaded successfully, continue"
fi

cd aws-metadata-client/
echo "In directory $(pwd)"

mvn spring-boot:run

