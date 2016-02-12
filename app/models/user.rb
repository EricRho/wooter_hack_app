class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
    :omniauth_providers => [:google_oauth2]

  has_many :comments

  # Proper method to get info from Auth Hash
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info['name']
      user.token = auth['credentials']['token']
      user.password = Devise.friendly_token[0,20]

      if user.email == 'eric.rho.87@gmail.com'
        user.admin = true
      else
        user.admin = false
      end
    end
  end

  # def self.from_omniauth(access_token, signed_in_resource=nil)
  #   data = access_token.info
  #   user = User.where(:provider => access_token.provider, :uid => access_token.uid).first

  #   if user
  #     return user
  #   else
  #     registered_user = User.where(:email => access_token.info.email).first
  #     if registered_user
  #       return registered_user
  #     else
  #       user = User.create(
  #         name: data['name'],
  #         provider: access_token.provider,
  #         email: data['email'],
  #         uid: access_token.uid,
  #         password: Devise.friendly_token[0,20]
  #       )
  #     end
  #   end
  # end





  # def make_admin
  #   if current_user.email == 'eric.rho.87@gmail.com'
  #     current_user.update_attribute :admin, true
  #   else
  #     current_user.update_attribute :admin, false
  #   end
  # end
end
