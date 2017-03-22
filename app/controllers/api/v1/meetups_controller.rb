class Api::V1::MeetupsController < ApiController
  before_action :authenticate, only: [:show]
  def index
    @meetups = Meetup.all
    respond_to do |format|
      format.json
    end
  end

  def show
    @meetup = Meetup.find(params[:meetup_id])
    respond_to do |format|
      format.json
    end
  end

  protected

  def authenticate
    authenticate_token? || render_unauthorized
  end

  def authenticate_token?
    authenticate_with_http_token do |token, _options|
      User.find_by(auth_token: token)
    end
  end

  def render_unauthorized
    headers['WWW-Authenticate'] = 'Token realm="Episodes"'
    render json: 'bad crendentials', status: 401
  end
end
