class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.passive_notifications
    if @notifications != nil
      @notifications.where(checked: false).each do |notification|
        notification.update_attributes(checked: true)
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    @notifications = current_user.passive_notifications.destroy_all
    redirect_to notifications_path
  end

end
