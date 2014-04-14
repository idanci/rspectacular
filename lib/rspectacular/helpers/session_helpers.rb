def authenticate_api_as(user)
  auth_token = user.respond_to?(:auth_token) ? user.auth_token : user

  request.env['HTTP_AUTHORIZATION'] = "Token #{auth_token}"
end
