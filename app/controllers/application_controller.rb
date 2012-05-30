class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def start
    redirect_to problems_path if user_signed_in?
  end
end
