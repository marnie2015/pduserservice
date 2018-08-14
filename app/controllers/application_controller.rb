class ApplicationController < ActionController::Base

  def current_user
    decoded_token = JsonWebToken.decode(request.headers["Authorization"])
    unless decoded_token == "Invalid Access Token."
      decoded_token[0]
    else
      decoded_token
    end
  end

end
