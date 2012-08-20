$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require "rubygems"
require "bundler/setup"

require 'sinatra/base'
require 'redis'
require 'resque'
require 'bcrypt'
require 'securerandom'
require 'data_mapper'
require 'haml'
require 'coffee-script'
require 'sass'
require 'json'

require 'bootstrap'

DataMapper.setup(:default, {
  :adapter  => Bootstrap.config.db_adapter,
  :host     => Bootstrap.config.db_host,
  :username => Bootstrap.config.db_user,
  :password => Bootstrap.config.db_pass,
  :database => Bootstrap.config.db
})

require 'models/user'

DataMapper.auto_upgrade!

require 'tasks/sample'

require 'app'

$redis = Redis.connect(:url => Bootstrap.config.redis, :thread_safe => true)
Resque.redis = $redis
Resque.redis.namespace = "bootstrap"
