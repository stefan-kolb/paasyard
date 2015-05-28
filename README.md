# PaaSyard <img align="right" src="logo.png" height="25%" width="25%">
Docker powered (mini) deployment system for PaaS.

## Requirements
Any system with a running Docker daemon will do!

## Installation
Clone the repository:
```sh  
$ git clone https://github.com/stefan-kolb/paasyard.git
``` 
Configure a `config/provider.cfg` with your provider credentials (see `config/provider.cfg.example`).
```sh  
$ cat mv provider.cfg.example provider.cfg
# Heroku
HEROKU_USERNAME=
HEROKU_PASSWORD=
``` 
Build the Docker images and install the `paasyard` executable:
```sh  
$ sudo make install
```

## Usage
Supported vendors: 
```sh  
$ paasyard list
bluemix
cloudcontrol
dotcloud
elasticbeanstalk
engineyard
heroku
openshift
pivotal
```

Define necessary environment variables inside the app folder in a `.env` file (one per line).
```sh  
$ cat .env
RAILS_ENV=production
MONGO_URL=mongodb://user:pass@example.com:59938
```

### Deploy 
```sh  
$ paasyard create VENDOR [-a APPNAME]
```
### Update
```sh  
$ paasyard push VENDOR [-a APPNAME]
```
### Delete
```sh  
$ paasyard delete VENDOR [-a APPNAME]
```

## Field of application
- Deployment abstraction
- Quick deployment tests
- Isolated deployment measurements
```sh  
$ time paasyard create heroku
real	6m22.759s
user	0m0.049s
sys	0m0.055s
``` 

## TODO
- Beware that it's currently Ruby focused for some vendors (cloudControl, dotCloud, Beanstalk, OpenShift: Ruby 2.0).
- Only use `create -> push...push -> delete` workflow for safety now, as SSH keys are pushed on create and removed on delete only at the moment.

