# omniauth with devise authentication with github oauth 2

# signed_in_resource is actually current_user
def self.find_for_oauth(auth, signed_in_resource = nil)

  # Get user's identity and data if exist or create new identity
  identity = Identity.find_for_oauth auth

  # Assign current_user to user or if identity found a user
  user = signed_in_resource ? signed_in_resource : identity.user

  # Create the user if needed
  if user.nil?

    # Get the existing user by email if the provider gives us a verified email.
    # user to verify it on the next step via finish_signup

    email = auth.info.email
    user = User.where(:email => email).first if email

    # Create the user if it's a new registration
    if user.nil?
      user = User.new(
          name: auth.info.name,
          username: auth.info.nickname || auth.extra.raw_info.login ,
          email: email ? email : "#{EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
      )

      # if oauth provider provides email, no need to confirm
      user.skip_confirmation! if user.email !~ EMAIL_REGEX
      user.save!
      user.get_ssh_keys_from_github(auth.credentials.token)
    end
  end

  # Associate the identity with the user if needed
  if identity.user != user
    identity.user = user
    identity.save!
  end
  user

end