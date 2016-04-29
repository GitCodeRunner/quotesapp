class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = "https://quotesappfree.herokuapp.com/quotes.json"
    headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
  end
end
