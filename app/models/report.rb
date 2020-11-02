class Report < ApplicationRecord
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
end
