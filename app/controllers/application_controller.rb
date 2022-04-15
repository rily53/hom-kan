class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER_2"] && password == ENV["BASIC_AUTH_PASSWORD_2"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # :inviteと:accept_invitationに:usernameを許可する
    devise_parameter_sanitizer.permit(:invite) { |u| u.permit(:email, :name) }
    devise_parameter_sanitizer.permit(:accept_invitation) { |u| u.permit(:password, :password_confirmation, :invitation_token, :name) }
  end

end
