class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def google_oauth2
		@user = User.from_omniauth(request.env['omniauth.auth'])

		if @user.persisted?
			flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
			sign_in_and_redirect @user, :event => :authentication
		else
			session['devise.google_data'] = request.env['omniauth.auth']
			redirect_to new_user_registration_url
		end
	end

	# def google_oauth2
	# 	auth_hash = request.env['omniauth.auth']
	# 	uid = auth.hash['uid']
	# 	name = auth_hash['info']['name']
	# 	auth = Authorization.find_by_provider_and_uid('google_oauth2', uid)

	# 	if auth
	# 		user = auth.user
	# 	else
	# 		unless current_user
	# 			unless user = User.find_by_name(name)
	# 				user = User.create({
	# 					name: name,
	# 					password: Devise.friendly_token[0,20],
	# 					email: "#{UUIDTools::UUID.random_create}@somebullshit.com"
	# 					})
	# 	end
	# 	unless auth= user.authorizations.find_by_provider('google_oauth2')
	# 		auth = user.authorizations.build(provider: 'google_oauth2', uid: uid)
	# 		user.authorizations << auth
	# 	end
	# 	auth.update_attributes({
	# 		uid: uid,
	# 		token: auth_hash['credentials']['token'],
	# 		secret: auth_hash['credentials']['secret'],
	# 		name: name,
	# 		url:
	# 		})
	# end
end