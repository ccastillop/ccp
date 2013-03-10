class ApplicationController < ActionController::Base
  protect_from_forgery
  include Mercury::Authentication
  
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      @authenticated = username == "ccp" && password == "Lima1972"
    end
  end

  def authenticated?
    @authenticated
  end
  helper_method :authenticated?
end
