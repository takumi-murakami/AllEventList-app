class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.build(comment_params)
    @comment = current_user.comments.build(comment_params)
    @comment.event_id = params[:event_id]
    @comment.user_id = current_user.id
    @comment_event = @comment.event

    comment = Comment.new(comment_params)
    if comment.save
      flash[:success] = 'コメントしました'
      @event = @comment.event
      # @comment_event.create_notification_comment!(current_user, @comment.id)
      @event.create_notification_comment!(current_user, @comment.id)
      redirect_to "/events/#{comment.event.id}"
    else
      comments_get
      render 'events/show'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
