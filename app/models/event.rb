class Event < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :reports

  with_options presence: true do
    validates :title
  end

  def create_notification_comment!(current_user, comment_id)
    temp_ids = Comment.where(event_id: id).where.not("user_id=? or user_id=?", current_user.id,user_id).select(:user_id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end

    save_notification_comment!(current_user, comment_id, user_id)
    end

    def save_notification_comment!(current_user, comment_id, visited_id)
        notification = current_user.active_notifications.new(
          event_id: id,
          comment_id: comment_id,
          visited_id: visited_id,
          action: 'comment'
        )
        if notification.visitor_id == notification.visited_id
          notification.checked = true
        end
        notification.save if notification.valid?
    end

end
