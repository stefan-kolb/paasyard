# Specify environment variables for Unicorn or Passenger here
file = File.dirname(File.realpath(__FILE__)) << '/.env'

if File.exist?(file)
  vars = Hash[*File.read(file).split(/[= \n]+/)]
else
  vars = Hash.new
end

default[:env_vars] = vars
