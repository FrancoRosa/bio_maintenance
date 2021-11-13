class LoginController < ApplicationController
  skip_before_action :verify_authenticity_token

  def destroy
    cookies.delete(:visitor_password_verified)
  end

  def create
    unless params[:password].present?
      return redirect_back(fallback_location: root_path,
                           notice: 'Password is required.')
    end

    if params[:password] == Rails.configuration.visitor_password
      cookies[:visitor_password_verified] = true
      redirect_to(root_path, notice: 'Password verified.')
    else
      cookies.delete(:visitor_password_verified)
      redirect_back(fallback_location: root_path, notice: "You've entered the wrong password.")
    end
  end
end
