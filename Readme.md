### JS Bank AMI backing project

#### Pre-requisites
* [Packer](https://www.packer.io/downloads.html) have to be installed
* AWS Credentials into a VPC where port 22 is accessible from your local machine, the vpc should have a subnet available
* The environments AD must have the DNS names for trend/logstash/ntp or the components won't be able to communicate with it's master server

## TODO
* The packer created security group allows ssh access from '0.0.0.0/0'. Should be better to specify a pre-configured security group
* We should have a VPC - perhaps the shared vpc? - what we should use for AMI building
* We might want to use codebuild?
* Run inspec tests after build
* Run vulnerability scan after build

### Remarks

The code was kindly adopted from [ami-builder-packer](https://github.com/awslabs/ami-builder-packer) under Apache 2.0 License