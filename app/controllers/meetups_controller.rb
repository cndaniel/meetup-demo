class MeetupsController < ApplicationController
  def index
    @meetups = Meetup.all
  end

  def show
    @meetup = Meetup.find(params[:id])
  end

  def new
    @meetup = Meetup.new
  end

  def create
    @meetup = Meetup.new(meetup_params)
    if @meetup.save
      redirect_to meetups_path, notice: 'meetup up created!'
    else
      render :new, alert: 'failed'
    end
  end
  private
  def meetup_params
    params.require(:meetup).permit(:title, :description)
  end
end
