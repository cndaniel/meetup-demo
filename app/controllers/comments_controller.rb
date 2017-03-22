class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @meetup = Meetup.find(params[:meetup_id])
    @comment = @meetup.comments.new(comments_params)
    @comment.user = current_user
    @comment.save
    respond_to do |format|
      format.html { redirect_to @meetup }
      format.js
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:conetent)
  end
end
