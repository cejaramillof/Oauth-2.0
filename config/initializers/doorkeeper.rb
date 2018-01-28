Doorkeeper.configure do
  # Change the ORM that doorkeeper will use (needs plugins)
  orm :active_record

  resource_owner_from_credentials do |routes|
    #Lógica
    user = User.find_by(username: params[:username])

    if user && user.is_valid_password?(params[:password])
      user
    end

  end

  use_refresh_token

  # This block will be called to check whether the resource owner is authenticated or not.
  resource_owner_authenticator do
    fail "Please configure doorkeeper resource_owner_authenticator block located in #{__FILE__}"
    # Put your resource owner authentication logic here.
    # Example implementation:
    #   User.find_by_id(session[:user_id]) || redirect_to(new_user_session_url)
  end

end

Doorkeeper.configuration.token_grant_types << "password"
