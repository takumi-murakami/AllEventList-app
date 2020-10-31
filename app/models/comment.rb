class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :notifications, dependent: :destroy


  # def create
  #   @event = Event.find(params[:event_id])
  #   #投稿に紐づいたコメントを作成
  #   @comment = @event.comments.build(comment_params)
  #   @comment.user_id = current_user.id
  #   @comment_event = @comment.event
  #   if @comment.save
  #     #通知の作成
  #     @comment_event.create_notification_comment!(current_user, @comment.id)
  #     render :index
  #   end
  # end
end
