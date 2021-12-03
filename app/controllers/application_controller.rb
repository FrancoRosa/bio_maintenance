class ApplicationController < ActionController::Base
  def require_password_verification
    source = request.referrer.to_s
    return if source.include? 'https://soluciones-biomedicas-peruanas.web.app'
    return if source.include? 'localhost:4000'
    return redirect_to '/login' unless cookies[:visitor_password_verified]
  end
end
