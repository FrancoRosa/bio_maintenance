class ApplicationController < ActionController::Base
  def require_password_verification
    return if request.host == 'soluciones-biomedicas-peruanas.web.app'
    return redirect_to '/login' unless cookies[:visitor_password_verified]
  end
end
