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
    # for(:invite)：招待メールの送信／for(:accept_invitation)：招待されたユーザーがアカウントを作成
    # :inviteと:accept_invitationに:nameを許可する
    # home_ids:[]でRoomへ招待（中間テーブルへ登録）
    devise_parameter_sanitizer.permit(:invite) { |u| u.permit(:email, :name, { home_ids: []}) }
    devise_parameter_sanitizer.permit(:accept_invitation) { |u| u.permit(:password, :password_confirmation, :invitation_token, :name) }
  end

end
