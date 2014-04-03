if defined? Devise
  def log_in(user, options = {})
    initial_path = options.fetch(:initial_path, :root_path)
    visit send(initial_path, :auth_token => user.authentication_token)
  end

  def log_out
    visit destroy_user_session_path
  end
end

def authenticate_api_as(user)
  auth_token = user.respond_to?(:auth_token) ? user.auth_token : user

  request.env['HTTP_AUTHORIZATION'] = "Token #{auth_token}"
end
