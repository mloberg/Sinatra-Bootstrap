module Bootstrap
  module Helpers

    def login
      if session[:user]
        user = User.get(session[:user])
        if user && user.token == session[:token]
          @user = user
          return true
        end
      end
      return false
    end

    def partial(template, locals = nil)
        locals = locals.is_a?(Hash) ? locals : { template.to_sym => locals }
        template=('partials/' + template.to_s).to_sym
        erb(template, { :layout => false}, locals)
    end

  end
end
