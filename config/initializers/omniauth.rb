Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :twitter, 'caWpdHyRvCrbdPmV3H3x9g', '8JIadKuNAiNyRZTm7H45iNPphMYfQjklDJaCDtNQ4'

  provider :facebook, '7695455835', '0887c939705b4ab5092713acd1d2bd42'
  provider :google_oauth2, '528443707127.apps.googleusercontent.com', 'yzDessIYM7VGaAWOH45opPZU'
end

# module OmniAuth
#   module Strategies
#     class Facebook < OAuth2

#       MOBILE_USER_AGENTS =  'webos|ipod|iphone|mobile'

#       def request_phase
#         options[:scope] ||= "email,offline_access"
#         options[:display] = mobile_request? ? 'touch' : 'page'
#         super
#       end

#       def mobile_request?
#         ua = Rack::Request.new(@env).user_agent.to_s
#         ua.downcase =~ Regexp.new(MOBILE_USER_AGENTS)
#       end

#     end
#   end
# end
