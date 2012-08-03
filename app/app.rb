require "api/helpers"

module Bootstrap
  class App < Sinatra::Base
    include Helpers

    enable :sessions
    set    :session_secret, Bootstrap.config.auth_token

    dir = File.dirname(File.expand_path(__FILE__))

    set :views,         "#{dir}/views"
    set :public_folder, "#{dir}/frontend/public"
    set :static,        true

    before do
      session_not_required = request.path_info =~ /\/login/

      unless session_not_required || @user
        redirect '/login' unless login
      end
    end

    get "/" do
      erb :index
    end

    get "/login" do
      erb :login
    end

    post "/login" do
      user = User.first(:email => params[:email])
      if user && user.login(params[:password])
        session[:user] = user.id
        session[:token] = user.token
      end
      redirect '/'
    end

    get "/logout" do
      session.clear
      redirect '/login'
    end

  end
end
