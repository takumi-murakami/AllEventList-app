module NotificationsHelper

  # def unchecked_notifications
  #   @notifications = current_user.passive_notifications.where(checked: false)
  # end

  def notification_form(notification)
    # @comment = nil
    @visitor = link_to notification.visitor.name, notification.visitor, style:"font-weight: bold;"
    @your_post = link_to 'あなたの予定', event_path(notification.event_id), style:"font-weight: bold;"

    case notification.action
      when "comment" then
        tag.a(@visitor) + 'が' + tag.a(@your_post) + 'にコメントしました'
    end
  end

end
