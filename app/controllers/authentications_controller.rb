class AuthenticationsController < ApplicationController
  def index
    @authentications = Authentication.all
  end

  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    binding.pry
    if authentication
      logger.debug "Found as: #{authentication.user.email}"
      flash[:notice] = "Signed in successfully."
      logger.debug "Signed in b: #{user_signed_in?}"
      flash[:notice] = "Signed in successfully."
      logger.debug "session b: #{session}"
      sign_in_and_redirect(:user, authentication.user)
      logger.debug "Signed in a: #{user_signed_in?}"
    elsif current_user
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      flash[:notice] = "Authentication successful."
      redirect_to problems_url
    else
      user = User.find_by_email(omniauth['info']['email']) || User.new
      user.apply_omniauth(omniauth)
      if user.save
        flash[:notice] = "Signed in successfully."
        sign_in_and_redirect(:user, user)
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
  end
end
