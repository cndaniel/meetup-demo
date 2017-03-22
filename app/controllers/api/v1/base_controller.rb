class Api::V1::BaseController < ApiController
  before_action :current_user!

  def authenticate_user_from_token
    iif params[:auth_token].present?
      user = User.find_by_auth_token(params[:auth_token])
      sign_in(user, store: false)
    else
      head 401
    end
  end
end
