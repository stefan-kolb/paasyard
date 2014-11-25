# PaaSyard
Docker powered PaaS (mini) deployment system.

## Requirements
Any system with a running Docker daemon will do!

## Installation
1. Clone the repository
2. Configure `config/provider.cfg` with your provider credentials
3. Build the Docker images and install the `yard` executable via `make install`

## Usage
1. Define necessary environment variables, e.g. `RAILS_ENV=production` inside the app folder in the `.env` file
2. Run deployment via `yard (create|push|delete) VENDOR [-a APPNAME]`

This will create a new application APPNAME at vendor VENDOR and push the application.

## Field of application
- Deployment abstraction
- Quick deployment tests
- Isolated deployment measurements

## TODO
- current vendors `bluemix, pivotal, cloudcontrol, heroku, engineyard, openshift, elasticbeanstalk`
- Beware that it's Ruby focused for some vendors atm.
- Only use `create->push...push->delete` workflow for safety now, as SSH keys are pushed on create and removed on delete only at the moment.

