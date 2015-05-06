# PaaSyard <img align="right" src="logo.png" height="25%" width="25%">
Docker powered (mini) deployment system for PaaS.

## Requirements
Any system with a running Docker daemon will do!

## Installation
1. Clone the repository
2. Configure a `config/provider.cfg` with your provider credentials (see `config/provider.cfg.example` for an example file)
3. Build the Docker images and install the `paasyard` executable via `sudo make install`

## Usage
Define necessary environment variables, e.g. `RAILS_ENV=production` (one per line) inside the app folder in the `.env` file

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

## TODO
- Supported vendors: `VENDOR=(bluemix, pivotal, cloudcontrol, heroku, engineyard, openshift, elasticbeanstalk)`
- Beware that it's currently Ruby focused for some vendors (Beanstalk, OpenShift: Ruby 2.0).
- Only use `create -> push...push -> delete` workflow for safety now, as SSH keys are pushed on create and removed on delete only at the moment.

