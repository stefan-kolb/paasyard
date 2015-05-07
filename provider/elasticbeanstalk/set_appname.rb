#!/usr/bin/env ruby
require 'yaml'

yml = YAML.load_file('.elasticbeanstalk/config.yml')
yml['global']['application_name'] = ENV['APPNAME']

File.write('.elasticbeanstalk/config.yml', yml.to_yaml)
