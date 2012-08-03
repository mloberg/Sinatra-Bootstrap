$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/app')

require "rubygems"
require 'clockwork'

require 'boot'

Clockwork::every(5.minutes, "job.name") do
  # run a job
end
