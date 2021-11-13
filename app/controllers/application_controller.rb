class ApplicationController < ActionController::Base
  def require_password_verification
    return true if 'https://soluciones-biomedicas-peruanas.web.app' in request.referrer
    return redirect_to '/login' unless cookies[:visitor_password_verified]
  end
end
