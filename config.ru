require File.expand_path(File.dirname(__FILE__) + '/app/boot')
require 'sprockets'
require 'resque/server'

Resque::Server.class_eval do
  use Rack::Auth::Basic do |login, password|
    login == 'admin' && password == 'admin'
  end
end

stylesheets = Sprockets::Environment.new
stylesheets.append_path 'app/frontend/styles'

javascripts = Sprockets::Environment.new
javascripts.append_path 'app/frontend/scripts'

map("/resque") { run Resque::Server.new }
map("/css")    { run stylesheets }
map("/js")     { run javascripts }

map("/")       { run Bootstrap::App }
