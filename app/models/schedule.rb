class Schedule < ApplicationRecord
  belongs_to :event
  has_many :schedule_details, dependent: :destroy

  validates :week_day,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_blank: false }

  accepts_nested_attributes_for :schedule_details, reject_if: ->(a) { a[:content].blank? }, allow_destroy: true

  after_initialize :add_schedule_details

  def add_schedule_details
    schedule_details.build if new_record?
  end

end
