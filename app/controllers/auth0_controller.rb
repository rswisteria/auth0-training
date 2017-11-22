class Auth0Controller < ApplicationController
  def callback
    session[:userinfo] = request.env['omniauth.auth']
    redirect_to '/dashboard'
  end

  def failure
    @error_type = request.params['error_type']
    @error_msg = request.params['error_msg']
  end
end
