class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] &&  session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

# Logic provided in OmniAuth Overview (https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview)
# assumed that a person had not logged in previously without facebook. Specifically
# the original logic was checking to see if it could locate the user in the user table via
# an auth.provider, and auth.id...if not found then it will attempt to create a new user in the user table and
# assign a random password.

# The Logic did not handle the scenario where the user had first created an account in the app and therefore
# already had a user.email in the user table. So the original logic would fail because it would try and create a new
# user with the email account when it didn't find an auth.provider or auth.id in the user table and devise GEM would
# not allow you to create a duplicate login with the same email address.  So the following logic had to be added
# to handle that scenario. Specifically the logic needs to do the following:
# 1. Check to see if the user has already logged in via facebook previously and if so return that user ElSE
# 2. See if you can find the user in the User Table via their email...if so then set the user.provider & user.uid
# into the user table and save in database ELSE if you can't find the user via email then
# 3. Create the user and save in the User table

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first
    if user # User found in User table (via uid and provider)
      return user
    else #User not found with uid and provider...try looking them up via email
      user = where(email: auth.info.email).first
      if user
        user.provider = auth.provider
        user.uid = auth.uid
        user.save!
        return user
      else # if not found then create a new user and save in User table
        user = User.create provider: auth.provider,
            uid: auth.uid,
            password: Devise.friendly_token[0,20],
            email: auth.info.email
        return user
      end
    end
  end
    # user.name = auth.info.name   # assuming the user model has a name
    # user.image = auth.info.image # assuming the user model has an image
end
