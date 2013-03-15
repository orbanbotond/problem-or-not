Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :twitter, 'caWpdHyRvCrbdPmV3H3x9g', '8JIadKuNAiNyRZTm7H45iNPphMYfQjklDJaCDtNQ4'

  if Rails.env == 'development'
    $facebook_app_info = ['7695455835', '0887c939705b4ab5092713acd1d2bd42'] 
  else
    $facebook_app_info = ['420103404676944', '6e33d25bfa4bc0d92be61ec54c3d7ed8'] 
  end

  provider :google_oauth2, '59177245373.apps.googleusercontent.com', 'aAUBvEgFGVVUpMNDpSPV2BhG'
end
