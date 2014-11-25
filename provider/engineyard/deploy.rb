#!/usr/bin/env ruby
# see https://github.com/travis-ci/dpl/blob/master/lib/dpl/provider/engine_yard.rb
require 'engineyard-cloud-client'

STDOUT.sync = true

def poll(deployment)
  until deployment.finished?
    sleep 10
    print '.'
    deployment = EY::CloudClient::Deployment.get(@api, @app_env, deployment.id)
  end
  puts 'DONE'
  deployment
end

# authenticate
@api = EY::CloudClient.new
@api.authenticate!(ENV['EY_USERNAME'], ENV['EY_PASSWORD'])
# environment
env = {:app_name => ENV['APPNAME'], :environment_name => ENV['EY_ENVIRONMENT'] }
@app_env = EY::CloudClient::AppEnvironment.resolve_one(@api, env)
# deployment options
deploy_opts = {:ref => ARGV[0], :migrate => false}
deployment = EY::CloudClient::Deployment.deploy(@api, @app_env, deploy_opts)

result = poll(deployment)
unless result.successful
  error "Deployment failed (see logs on Engine Yard)"
end

