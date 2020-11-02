class Report < ApplicationRecord
  belongs_to :event

  def initialize(year, month)
    @start_date = Date.new(year, month, 1)
    @end_date = @start_date + 1.month - 1.day
  end
  def dates
    @start_date..@end_date
  end
  def events
    @events ||= Event.all.to_a
  end

  def events_amount_on(date, event)
    Event.where(start_date: date)
        .where(event_id: event.id)
  end
end
