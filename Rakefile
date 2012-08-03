require "rubygems"
require 'rake'
require 'yaml'
require 'resque/tasks'

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/app')

require 'boot'

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -r ./app/boot"
end

desc "Start Clockwork"
task :clockwork do
  sh "bundle exec clockwork clock.rb"
end
