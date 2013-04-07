class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :authenticated?
  include Mercury::Authentication
  
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      @authenticated = username == ENV["BLOG_USERNAME"] && password == ENV["BLOG_PASSWORD"]
    end
  end

  def authenticated?
    @authenticated
  end

end
