Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :twitter, 'caWpdHyRvCrbdPmV3H3x9g', '8JIadKuNAiNyRZTm7H45iNPphMYfQjklDJaCDtNQ4'

  provider :facebook, '7695455835', '0887c939705b4ab5092713acd1d2bd42'
  provider :google_oauth2, '528443707127.apps.googleusercontent.com', 'yzDessIYM7VGaAWOH45opPZU'
end

