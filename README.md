to practice elastic beanstalk from the command line on your local environment clone the repo and install the eb cli first using these instructions:
https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install.html

Here's a tutorial with the steps to deploy a sample Java app to Elastic Beanstalk, please consult in case of any basic questions arise:
https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/java-quickstart.html#java-quickstart-run-local

After the eb cli is configured, use the following commands to deploy the app:

To init the applications with aws eb:
```bash
eb init -p corretto java-tutorial --region us-east-1
```

To create env without an elastic load balancer (with a single instance):
```bash
eb create java-env --single     
```


To deploy/update:
```bash
eb deploy
```

To open the app in the browser:
```bash
eb open
```

To terminate the environment:
```bash
eb terminate
```

