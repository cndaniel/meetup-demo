class Api::V1::MeetupsController < ApiController
  before_action :authenticate_user!, only: [:show]
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
end
