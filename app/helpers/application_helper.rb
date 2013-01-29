module ApplicationHelper
  def oauth_login_path provider
    "/auth/#{provider.to_s}"
  end
end
