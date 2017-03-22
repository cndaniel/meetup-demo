class ApiController < ActionController::Base
  #  protect_from_forgery with: :null_session
  #  # disable cookies (no set-cookies header in response)
  #  before_action :destroy_session
  #
  # # disable the CSRF token
  # skip_before_action :verify_authenticity_token
  #
  # def destroy_session
  #   request.session_options[:skip] = true
  # end
  before_action :authenticate_user_from_token!
  def authenticate_user_from_token!
    if params[:auth_token].present?
      user = User.find_by_auth_token(params[:auth_token])
      sign_in(user, store: false) if user
    end
  end

  def unauthorized!
    head 401
  end
end
