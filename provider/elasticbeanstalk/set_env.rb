#!/usr/bin/env ruby
require 'yaml'

file = File.dirname(File.realpath(__FILE__)) << '/.env'

if File.exists?(file)
  env = Hash[*File.read(file).split(/[= \n]+/)]

  yml = YAML.load_file('.ebextensions/eb.config')

  env.each do |key, value|
    yml['option_settings'] << { 'option_name' => key, 'value' => value }
  end

  File.write('.ebextensions/eb.config', yml.to_yaml)
else
  abort "Cannot find .env configuration file"
end
