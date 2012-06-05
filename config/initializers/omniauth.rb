Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :twitter, 'caWpdHyRvCrbdPmV3H3x9g', '8JIadKuNAiNyRZTm7H45iNPphMYfQjklDJaCDtNQ4'
  provider :facebook, '420103404676944', '6e33d25bfa4bc0d92be61ec54c3d7ed8'
  provider :google_oauth2, '59177245373.apps.googleusercontent.com', 'aAUBvEgFGVVUpMNDpSPV2BhG'
end

