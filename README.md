# Elastic Beanstalk practice guide

## Prerequisites

to practice elastic beanstalk from the command line on your local environment clone the repo and install the eb cli first using these instructions:
https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install.html

Here's a tutorial with the steps to deploy a sample Java app to Elastic Beanstalk, please consult in case of any basic questions arise:
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

## Basic commands

After the eb cli is configured, use the following commands to deploy the app:

To init the application in java platform with name java-tutorial and region us-east-1:
```bash
eb init -p corretto java-tutorial --region us-east-1
```

To create env without an elastic load balancer (with a single instance):
```bash
eb create java-env --single     
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

