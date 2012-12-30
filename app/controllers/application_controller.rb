class ApplicationController < ActionController::Base

  protect_from_forgery
  
  layout "huge_header"

  before_filter :prepare_for_mobile

  def start
    redirect_to problems_path if user_signed_in?
  end

private

  def prepare_for_mobile
    request.format = :mobile if mobile_device?
  end

  def mobile_device?
    request.user_agent =~ /Mobile|webOS/
  end

  helper_method :mobile_device?

end
