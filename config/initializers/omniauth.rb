Rails.application.config.middleware.use OmniAuth::Builder do
	provider :google_oauth2, '348959413513-h8khqmjb7pirj69381scb6sh55k1strv.apps.googleusercontent.com', 'TmbiEsq8PFMl03RTK4NN_6qy',
	{
		:name => 'google',
		:scope => "email, profile, plus.me, http://gdata.youtube.com",
		:prompt => 'select_account',
		:image_aspect_ratio => 'square',
		:image_size => 50
	}
end