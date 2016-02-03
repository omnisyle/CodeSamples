class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # require user to enter an email if oauth hash does not include email
  def after_sign_in_path_for(resource)
    if resource.email_verified?
      super resource
    else
      finish_signup_path(resource)
    end
  end

  #define callbacks for different providers (code from devise oauth documentation)
  def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}
        @user = User.find_for_oauth(env["omniauth.auth"], current_user)

        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication
          set_flash_message(:success, :success, kind: "#{provider}".capitalize) if is_navigational_format?
        else
          session["devise.#{provider}_data"] = env["omniauth.auth"]
          redirect_to new_user_registration_url
        end
      end
    }
  end

  # for later implementation of other providers
  [:github, :facebook, :twitter].each do |provider|
    provides_callback_for provider
  end

end