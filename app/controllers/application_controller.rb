class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout "huge_header"
  
  def start
    redirect_to problems_path if user_signed_in?
  end
end
