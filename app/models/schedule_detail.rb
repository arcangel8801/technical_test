class ScheduleDetail < ApplicationRecord
  belongs_to :schedule

  validates :hour, presence: true
  validates :coupons,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_blank: false }

end
