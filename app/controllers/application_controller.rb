class ApplicationController < ActionController::Base
  def current_user
    decoded_token = JsonWebToken.decode(request.headers['Authorization'])
    unless [nil, 'Invalid Access Token.'].include?(decoded_token)
      User.where(id: decoded_token[0]['id']).first
    else
      'Invalid Access Token.'
    end
  end
end
