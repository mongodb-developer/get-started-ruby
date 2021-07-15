# Get-Started Ruby

Repository to help getting started with MongoDB Ruby driver connecting to MongoDB Atlas.

## Information

This Get-Started project uses [MongoDB Ruby driver](https://docs.mongodb.com/ruby-driver/master/) latest stable version by default. Although you can change the driver version, the provided code example was only tested against the default version of MongoDB driver. There is no guarantee that the code sample will work for all possible versions of the driver. 

The Docker image also comes with the latest stable version of [mongoid](https://docs.mongodb.com/mongoid/current/). 

## Pre-requisites 

### Docker 

Have Docker running on your machine. You can download and install from: https://docs.docker.com/install/

### MongoDB Atlas

In order to execute the code example, you need to specify `MONGODB_URI` environment variable to connect to a MongoDB cluster. If you don't have an existing cluster, you can create one by signing up [MongoDB Atlas Free-tier M0](https://docs.atlas.mongodb.com/getting-started/). 

##  Execution Steps 

Execute the helper shell script followed by the MongoDB URI that you would like to connect to. 

```
./get-started.sh "mongodb+srv://usr:pwd@example.mongodb.net/dbname?retryWrites=true"
```

### Execute commands within the Docker environment 

You can invoke a terminal session within the Docker environment using the following command.
From the top level directory, execute: 
```
docker run -it -v "$(pwd):/workspace/ruby" -w /workspace/ruby ghcr.io/mongodb-developer/get-started-ruby:latest "sh"
```


## Tutorials

* [MongoDB Ruby driver: Tutorial](https://docs.mongodb.com/ruby-driver/master/ruby-driver-tutorials/)
* [MongoDB Ruby driver: QuickStart](https://docs.mongodb.com/ruby-driver/master/quick-start/)

## About 

This project is part of the MongoDB Get-Started code examples. Please see [get-started-readme](https://github.com/mongodb-developer/get-started-readme) for more information. 

## Disclaimer

This software is not supported by [MongoDB, Inc](https://www.mongodb.com)
under any of their commercial support subscriptions or otherwise. Any usage is at your own risk.
