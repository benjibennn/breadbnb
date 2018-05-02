Rails.application.config.middleware.use OmniAuth::Builder do
provider :google_oauth2, ENV['GOOGLE_APP_ID'], ENV['GOOGLE_APP_SECRET'],:skip_jwt => true

end


 # provider :google_oauth2, '601049310261-fcb6bkaodl5us0fbst7o2n70kdipkdac.apps.googleusercontent.com',
 # 'KsTrqV7D1Faq26oGkQos378A'