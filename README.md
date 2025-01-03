# Elastic Beanstalk practice guide

This guide contains instructions and tips to practice aws elastic beanstalk from the command line on your local environment

In the **main** branch you will find everything for deploying a java app with corretto (java) platform via EB. Build tool used is Gradle. 

In the **single-docker-container** branch you will find everything for deploying with docker platform and single Dockerfile.

## Prerequisites

Clone the repo and install the eb cli first using these instructions:
https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install.html

Here's a tutorial with the steps to deploy a sample Java app built with Maven to Elastic Beanstalk, please consult in case of any basic questions arise:
https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/java-quickstart.html#java-quickstart-run-local

Create an IAM role named "aws-elasticbeanstalk-ec2-role" with following permissions:
- AWSElasticBeanstalkMulticontainerDocker
- AWSElasticBeanstalkWebTier
- AWSElasticBeanstalkWorkerTier
- EC2InstanceProfileForImageBuilderECRContainerBuilds

Also, a role named "aws-elasticbeanstalk-service-role" should be automatically created for you on first eb create command
If not created, make sure you have this role with following permissions:
- AWSElasticBeanstalkEnhancedHealth
- AWSElasticBeanstalkManagedUpdatesCustomerRolePolicy

## Tutorial steps:

1. Package and run your app locally:
```bash
./gradlew clean build
java -jar build/libs/eb-java-0.0.1-SNAPSHOT.jar
```

2. Clean the built app:
```bash
./gradlew clean
```

3. Make sure the correct commands are present in the Buildfile and Procfile for building and running respectively.

4. After the eb cli is configured, use the following commands to deploy the app:

- Init the application in java platform with name java-tutorial and region us-east-1:
```bash
eb init -p corretto java-tutorial --region us-east-1
```

- Create env without an elastic load balancer (with a single instance):
```bash
eb create java-env --single     
```

- Open the app in the browser:
```bash
eb open
```

- Terminate the environment to clean up resources:
```bash
eb terminate
```


## Basic EB commands

To init the application with name and region:
```bash
eb init -p <platform> <app-name> --region <region>
```

To create env without an elastic load balancer (with a single instance):
```bash
eb create java-env --single     
```

for example, to init the application in java platform with name java-tutorial and region us-east-1 use this command:
```bash
eb init -p corretto java-tutorial --region us-east-1
```

To deploy/update:
```bash
eb deploy <optional-env-name>
```

To open the app in the browser:
```bash
eb open
```

To terminate the environment:
```bash
eb terminate
```

To check the current status:
```bash
eb status
```

To see the logs when the app is ready:
```bash
eb logs
```

To clone the environment for blue-green deployment
```bash
eb clone
```

To swap the environment URLs for blue-green deployment
```bash
eb swap <old-env-name> --destination_name <new-env-name>
```

***
## Deployment options:

Add this .config file for setting immutable deploy:
```yaml
option_settings:
  aws:elasticbeanstalk:command:
    DeploymentPolicy: Immutable
    HealthCheckSuccessThreshold: Warning
    IgnoreHealthCheck: true
    Timeout: "600"
```

