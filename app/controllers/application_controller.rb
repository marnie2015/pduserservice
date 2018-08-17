class ApplicationController < ActionController::Base
  def current_user
    decoded_token = JsonWebToken.decode(request.headers['Authorization'])
    if decoded_token != 'Invalid Access Token.'
      User.where(id: decoded_token[0]['id']).first
    else
      decoded_token
    end
  end
end
