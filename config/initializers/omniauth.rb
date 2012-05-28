Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :twitter, 'caWpdHyRvCrbdPmV3H3x9g', '8JIadKuNAiNyRZTm7H45iNPphMYfQjklDJaCDtNQ4'
end

